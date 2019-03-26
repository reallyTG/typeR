library(rfm)


### Name: rfm_table_customer_2
### Title: RFM table 2 (customer data)
### Aliases: rfm_table_customer_2

### ** Examples

analysis_date <- lubridate::as_date('2007-01-01', tz = 'UTC')
rfm_table_customer_2(rfm_data_customer, customer_id, number_of_orders,
most_recent_visit, revenue, analysis_date)

# access rfm table
result <- rfm_table_customer_2(rfm_data_customer, customer_id, number_of_orders,
most_recent_visit, revenue, analysis_date)
result$rfm




