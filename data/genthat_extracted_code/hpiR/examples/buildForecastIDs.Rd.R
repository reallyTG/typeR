library(hpiR)


### Name: buildForecastIDs
### Title: Create the row IDs for forecast accuracy
### Aliases: buildForecastIDs

### ** Examples


  # Load example sales
 data(ex_sales)

 # Create RT data
 rt_data <- rtCreateTrans(trans_df = ex_sales,
                          prop_id = 'pinx',
                          trans_id = 'sale_id',
                          price = 'sale_price',
                          periodicity = 'monthly',
                          date = 'sale_date')

# Create ids
  fc_ids <- buildForecastIDs(time_cut = 27,
                             hpi_df = rt_data,
                             forecast_length = 2,
                             train = TRUE)




