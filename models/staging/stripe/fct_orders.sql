with orders as (
    select * from {{ ref('stg_orders')}}
),

payments as (
    select * from {{ ref('stg_payments') }}
    WHERE status = 'success'
),

final as (

    select
        orders.order_id,
        orders.customer_id,
        payments.amount

    from orders LEFT JOIN payments using(order_id)
)
select * from final
