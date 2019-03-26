library(hpiR)


### Name: plot.hpiindex
### Title: Plot method for 'hpiindex' object
### Aliases: plot.hpiindex

### ** Examples


 # Load data
 data(ex_sales)

 # With a raw transaction data.frame
 rt_data <- rtCreateTrans(trans_df = ex_sales,
                          prop_id = 'pinx',
                          trans_id = 'sale_id',
                          price = 'sale_price',
                          periodicity = 'monthly',
                          date = 'sale_date')

 # Create model object
 hpi_model <- hpiModel(hpi_df = rt_data,
                       estimator = 'base',
                       log_dep = TRUE)

 # Create Index
 hpi_index <- modelToIndex(hpi_model,
                           max_period = 84)

 # Make Plot
 plot(hpi_index)




