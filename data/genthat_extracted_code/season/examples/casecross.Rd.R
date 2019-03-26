library(season)


### Name: casecross
### Title: Case-crossover Analysis to Control for Seasonality
### Aliases: casecross

### ** Examples
## No test: 
# cardiovascular disease data
data(CVDdaily)
CVDdaily = subset(CVDdaily, date<=as.Date('1987-12-31')) # subset for example
# Effect of ozone on CVD death
model1 = casecross(cvd ~ o3mean+tmpd+Mon+Tue+Wed+Thu+Fri+Sat, data=CVDdaily)
summary(model1)
# match on day of the week
model2 = casecross(cvd ~ o3mean+tmpd, matchdow=TRUE, data=CVDdaily)
summary(model2)
# match on temperature to within a degree
model3 = casecross(cvd ~ o3mean+Mon+Tue+Wed+Thu+Fri+Sat, data=CVDdaily,
                   matchconf='tmpd', confrange=1)
summary(model3)
## End(No test)



