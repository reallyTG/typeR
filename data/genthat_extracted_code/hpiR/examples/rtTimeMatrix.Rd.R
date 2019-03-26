library(hpiR)


### Name: rtTimeMatrix
### Title: Create model matrix for repeat transaction approach
### Aliases: rtTimeMatrix

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
 # Create Matrix
 rt_matrix <- rtTimeMatrix(rt_data)




