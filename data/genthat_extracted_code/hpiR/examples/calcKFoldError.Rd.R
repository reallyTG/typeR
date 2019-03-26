library(hpiR)


### Name: calcKFoldError
### Title: Calculate index error with FKold (out of sample)
### Aliases: calcKFoldError

### ** Examples


 # Load data
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

  # Create prediction data
  rt_data <- rtCreateTrans(trans_df = ex_sales,
                          prop_id = 'pinx',
                          trans_id = 'sale_id',
                          price = 'sale_price',
                          periodicity = 'monthly',
                          date = 'sale_date')

  # Calc Accuracy
  kf_accr <- calcKFoldError(hpi_obj = rt_index,
                            pred_df = rt_data,
                            k = 10,
                            seed = 123,
                            smooth = FALSE)




