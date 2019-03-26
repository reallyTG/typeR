library(sparkxgb)


### Name: xgboost_classifier
### Title: XGBoost Classifier
### Aliases: xgboost_classifier

### ** Examples

## No test: 
library(sparkxgb)
library(sparklyr)

sc <- spark_connect(master = "local")
iris_tbl <- sdf_copy_to(sc, iris)
xgb_model <- xgboost_classifier(
  iris_tbl, 
  Species ~ .,
  num_class = 3,
  num_round = 50, 
  max_depth = 4
)
## End(No test)



