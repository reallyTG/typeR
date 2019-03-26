library(hpiR)


### Name: calcForecastError
### Title: Calculate the forecast accuracy of series of indexes
### Aliases: calcForecastError

### ** Examples


 # Load example sales
 data(ex_sales)

 # Create Index
 hed_index <- hedIndex(trans_df = ex_sales,
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
                       dep_var = 'price',
                       ind_var = c('tot_sf', 'beds', 'baths'),
                       smooth = FALSE)

 # Create Series (Suppressing messages do to small sample size of this example)
  suppressMessages(
    hpi_series <- createSeries(hpi_obj = hed_index,
                               train_period = 12))

 # Create Prediction data
 rt_data <- rtCreateTrans(trans_df = ex_sales,
                          prop_id = 'pinx',
                          trans_id = 'sale_id',
                          price = 'sale_price',
                          periodicity = 'monthly',
                          date = 'sale_date')


 # Calculate forecast accuracty
 fc_accr <- calcForecastError(is_obj = hpi_series,
                              pred_df = rt_data)




