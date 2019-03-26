library(sparkxgb)


### Name: xgboost_regressor
### Title: XGBoost Regressor
### Aliases: xgboost_regressor

### ** Examples

## No test: 
library(sparkxgb)
library(sparklyr)
sc <- spark_connect(master = "local")
mtcars_tbl <- copy_to(sc, mtcars)

xgb_model <- xgboost_regressor(
  mtcars_tbl,
  mpg ~ .
)
## End(No test)




