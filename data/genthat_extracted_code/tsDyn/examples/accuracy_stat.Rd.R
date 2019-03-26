library(tsDyn)


### Name: accuracy_stat
### Title: Forecasting accuracy measures.
### Aliases: accuracy_stat accuracy_stat.default accuracy_stat.pred_roll
### Keywords: ts

### ** Examples


## univariate:
mod_ar <- linear(lynx[1:100], m=1)
mod_ar_pred <- predict_rolling(mod_ar, newdata=lynx[101:114])
accuracy_stat(object=mod_ar_pred$pred, true=mod_ar_pred$true)

## multivariate
data(barry)
mod_var <- lineVar(barry, lag=1)

mod_var_pred <-predict_rolling(object=mod_var, nroll=10, n.ahead=1:3)
accuracy_stat(object=mod_var_pred)
accuracy_stat(object=mod_var_pred, w=c(0.7, 0.2, 0.1))






