library(gvlma)


### Name: summary.gvlma
### Title: Print Basic Information for a Gvlma Object
### Aliases: summary.gvlma print.gvlma display.gvlmatests
### Keywords: print

### ** Examples

data(CarMileageData)
CarModelAssess <- gvlma(NumGallons ~ MilesLastFill, data = CarMileageData)
CarModelAssess
summary(CarModelAssess)



