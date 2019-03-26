library(DescTools)


### Name: Measures of Accuracy
### Title: Measures of Accuracy
### Aliases: MAE MAE.default MAE.lm MAPE MSE RMSE MAPE.default MSE.default
###   RMSE.default MAPE.lm MSE.lm RMSE.lm NMAE NMSE SMAPE SMAPE.default
###   SMAPE.lm
### Keywords: model

### ** Examples

r.lm <- lm(Fertility ~ ., data=swiss)

MAE(r.lm)

# the same as:
MAE(predict(r.lm), swiss$Fertility)

MAPE(r.lm)
MSE(r.lm)
RMSE(r.lm)



