library(xgb2sql)


### Name: booster2sql
### Title: Transform XGBoost model object to SQL query.
### Aliases: booster2sql

### ** Examples

library(xgboost)
# load data
df = data.frame(ggplot2::diamonds)
head(df)

# data processing
out <- onehot2sql(df)
x <- out$model.matrix[,colnames(out$model.matrix)!='price']
y <- out$model.matrix[,colnames(out$model.matrix)=='price']

# model training
bst <- xgboost(data = x,
               label = y,
               max.depth = 3,
               eta = .3,
               nround = 5,
               nthread = 1,
               objective = 'reg:linear')

# generate model scoring SQL script with ROW_KEY and MODREADY_TABLE
booster2sql(bst, output_file_name='xgb.txt')



