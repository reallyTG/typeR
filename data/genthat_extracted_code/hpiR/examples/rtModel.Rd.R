library(hpiR)


### Name: rtModel
### Title: Estimate repeat transaction model for index creation
### Aliases: rtModel

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

  # Calc price differences
  price_diff <- rt_data$price_2 - rt_data$price_1

  # Create time matrix
  rt_matrix <- rtTimeMatrix(rt_data)

  # Calculate model
  rt_model <- rtModel(rt_df = rt_data,
                      price_diff = price_diff,
                      time_matrix = rt_matrix,
                      estimator = structure('base', class='base'))




