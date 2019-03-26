library(hpiR)


### Name: smoothSeries
### Title: Smooth all indexes in a series
### Aliases: smoothSeries

### ** Examples

 # Load data
 data(ex_sales)

 # Create index
 rt_index <- rtIndex(trans_df = ex_sales,
                     periodicity = 'monthly',
                     min_date = '2010-06-01',
                     max_date = '2015-11-30',
                     adj_type = 'clip',
                     date = 'sale_date',
                     price = 'sale_price',
                     trans_id = 'sale_id',
                     prop_id = 'pinx',
                     estimator = 'robust',
                     log_dep = TRUE,
                     trim_model = TRUE,
                     max_period = 48,
                     smooth = FALSE)

 #  Create Series (Suppressing messages do to small sample size of this example)
 suppressMessages(
    hpi_series <- createSeries(hpi_obj = rt_index,
                               train_period = 12))
 # Smooth indexes
 sm_series <- smoothSeries(series_obj = hpi_series,
                           order = 5)




