library(tigerstats)


### Name: predict.GClm
### Title: Prediction Function for GC Linear Regression
### Aliases: predict.GClm

### ** Examples

#predict fastest speed driven, for person with GPA=3.0:
SpeedModel <- lmGC(fastest~GPA,data=m111survey)
predict(SpeedModel,x=3.0)
#include prediction interval:
predict(SpeedModel,x=3.0,level=0.95)



