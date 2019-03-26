library(rfm)


### Name: rfm_rm_plot
### Title: RFM Scatter plot
### Aliases: rfm_rm_plot rfm_fm_plot rfm_rf_plot

### ** Examples

# rfm table
analysis_date <- lubridate::as_date('2006-12-31', tz = 'UTC')
rfm_result <- rfm_table_order(rfm_data_orders, customer_id, order_date,
revenue, analysis_date)

# monetary value vs recency
rfm_rm_plot(rfm_result)

# frequency vs monetary value
rfm_fm_plot(rfm_result)

# frequency vs recency
rfm_rf_plot(rfm_result)




