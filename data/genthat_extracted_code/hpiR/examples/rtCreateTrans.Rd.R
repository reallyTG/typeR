library(hpiR)


### Name: rtCreateTrans
### Title: Create transaction data for rt approach
### Aliases: rtCreateTrans

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




