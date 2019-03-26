library(rfm)


### Name: rfm_barchart_data
### Title: Bar chart data
### Aliases: rfm_barchart_data

### ** Examples

# using transaction data
analysis_date <- lubridate::as_date('2006-12-31', tz = 'UTC')
rfm_order <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# bar chart data
rfm_barchart_data(rfm_order)

# using customer data
analysis_date <- lubridate::as_date('2007-01-01', tz = 'UTC')
rfm_customer <- rfm_table_customer(rfm_data_customer, customer_id,
number_of_orders, recency_days, revenue, analysis_date)

# bar chart data
rfm_barchart_data(rfm_customer)




