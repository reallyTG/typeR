library(tigerstats)


### Name: predict.polyGC
### Title: Prediction Function for GC Polynomial Regression
### Aliases: predict.polyGC

### ** Examples

#predict mpg for a car weighing 3 tons:
mpgModel <- polyfitGC(mpg~wt,data=mtcars,degree=2)
predict(mpgModel,x=3.0)
#include prediction interval:
predict(mpgModel,x=3.0,level=0.95)



