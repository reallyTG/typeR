library(hpiR)


### Name: plot.hpi
### Title: Plot method for 'hpi' object
### Aliases: plot.hpi

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

 # Plot data
 plot(rt_index)
 plot(rt_index, smooth = TRUE)




