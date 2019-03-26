library(hpiR)


### Name: plot.hpiaccuracy
### Title: Plot method for 'hpiaccuracy' object
### Aliases: plot.hpiaccuracy

### ** Examples


 # Load Data
 data(ex_sales)

 # Create Index
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

 # Calculate insample accuracy
 hpi_accr <- calcAccuracy(hpi_obj = rt_index,
                          test_type = 'rt',
                          test_method = 'insample')

 # Make Plot
 plot(hpi_accr)




