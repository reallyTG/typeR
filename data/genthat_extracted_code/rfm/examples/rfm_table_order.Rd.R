library(rfm)


### Name: rfm_table_order
### Title: RFM table (transaction data)
### Aliases: rfm_table_order

### ** Examples

analysis_date <- lubridate::as_date('2006-12-31', tz = 'UTC')
rfm_table_order(rfm_data_orders, customer_id, order_date, revenue, analysis_date)

# access rfm table
result <- rfm_table_order(rfm_data_orders, customer_id, order_date, revenue, analysis_date)
result$rfm




