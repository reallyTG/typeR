library(hpiR)


### Name: createKFoldData
### Title: Create data for KFold error test
### Aliases: createKFoldData

### ** Examples


 # Load Data
 data(ex_sales)

 # Create RT Data
 rt_data <- rtCreateTrans(trans_df = ex_sales,
                          prop_id = 'pinx',
                          trans_id = 'sale_id',
                          price = 'sale_price',
                          periodicity = 'monthly',
                          date = 'sale_date')
 # Create folds
 k_folds <- caret::createFolds(y = 1:nrow(rt_data),
                               k = 10,
                               list = TRUE,
                               returnTrain = FALSE)

 # Create data from folds
 kfold_data <- createKFoldData(score_ids = k_folds[[1]],
                               full_data = rt_data,
                               pred_df = rt_data)




