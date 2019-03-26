library(rfm)


### Name: rfm_table_customer
### Title: RFM table (customer data)
### Aliases: rfm_table_customer

### ** Examples

analysis_date <- lubridate::as_date('2007-01-01', tz = 'UTC')
rfm_table_customer(rfm_data_customer, customer_id, number_of_orders,
recency_days, revenue, analysis_date)

# access rfm table
result <- rfm_table_customer(rfm_data_customer, customer_id, number_of_orders,
recency_days, revenue, analysis_date)
result$rfm




