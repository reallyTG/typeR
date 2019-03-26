library(rfm)


### Name: rfm_bar_chart
### Title: RFM bar chart
### Aliases: rfm_bar_chart

### ** Examples

# using transaction data
analysis_date <- lubridate::as_date('2006-12-31', tz = 'UTC')
rfm_order <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# bar chart
rfm_bar_chart(rfm_order)




