library(gvlma)


### Name: gvlma
### Title: Create a Gvlma Object
### Aliases: gvlma gvlma.form gvlma.lm
### Keywords: regression

### ** Examples

data(CarMileageData)
CarModelAssess <- gvlma(NumGallons ~ MilesLastFill + NumDaysBetw,
                        data = CarMileageData)
CarModelAssess
summary(CarModelAssess)
CarModel2 <- gvlma(lm(NumGallons ~ MilesLastFill + NumDaysBetw,
                      data = CarMileageData))
CarModel2
summary(CarModel2)
plot(CarModel2)



