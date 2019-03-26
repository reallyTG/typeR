library(hpiR)


### Name: calcInSampleError
### Title: Calculate index errors in sample
### Aliases: calcInSampleError

### ** Examples


 # Load example data
 data(ex_sales)

 # Create index with raw transaction data
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

 # Calculate accuracy
 in_accr <- calcInSampleError(pred_df = rt_index$data,
                              index = rt_index$index$value)




