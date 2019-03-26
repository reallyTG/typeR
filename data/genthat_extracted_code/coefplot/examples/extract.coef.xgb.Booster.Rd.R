library(coefplot)


### Name: extract.coef.xgb.Booster
### Title: extract.coef.xgb.Booster
### Aliases: extract.coef.xgb.Booster

### ** Examples

library(xgboost)
data(diamonds, package='ggplot2')
diaX <- useful::build.x(price ~ carat + cut + x, data=diamonds, contrasts=FALSE)
diaY <- useful::build.y(price ~ carat + cut + x, data=diamonds)
xg1 <- xgboost(data=diaX, label=diaY, 
booster='gblinear',
objective='reg:linear', eval_metric='rmse',
nrounds=50
)
extract.coef(xg1)
extract.coef(xg1, feature_names=colnames(diaX))




