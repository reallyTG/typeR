library(hpiR)


### Name: hpiModel
### Title: Wrapper to estimate model approaches (generic method)
### Aliases: hpiModel

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




