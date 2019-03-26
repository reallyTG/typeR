library(gvlma)


### Name: update.gvlma
### Title: Update a Gvlma Object
### Aliases: update.gvlma
### Keywords: methods

### ** Examples

data(CarMileageData)
CarModelAssess <- gvlma(NumGallons ~ MilesLastFill + NumDaysBetw,
                        data = CarMileageData)
CarModelAssess
summary(CarModelAssess)
CarModelNew <- update(CarModelAssess, alphalevel = 0.01)
CarModelNew
CarModelNew <- update(CarModelAssess, subset = -(1:10))
CarModelNew
summary(CarModelNew)



