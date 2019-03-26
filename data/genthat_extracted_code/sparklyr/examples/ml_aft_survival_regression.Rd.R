library(sparklyr)


### Name: ml_aft_survival_regression
### Title: Spark ML - Survival Regression
### Aliases: ml_aft_survival_regression ml_survival_regression

### ** Examples

## Not run: 
##D 
##D library(survival)
##D library(sparklyr)
##D 
##D sc <- spark_connect(master = "local")
##D ovarian_tbl <- sdf_copy_to(sc, ovarian, name = "ovarian_tbl", overwrite = TRUE)
##D 
##D partitions <- ovarian_tbl %>%
##D   sdf_partition(training = 0.7, test = 0.3, seed = 1111)
##D 
##D ovarian_training <- partitions$training
##D ovarian_test <- partitions$test
##D 
##D sur_reg <- ovarian_training %>%
##D   ml_aft_survival_regression(futime ~ ecog_ps + rx + age + resid_ds, censor_col = "fustat")
##D 
##D pred <- ml_predict(sur_reg, ovarian_test)
##D pred
## End(Not run)




