library(gvlma)


### Name: summary.gvlmaDel
### Title: Basic Information for the Leave-One-Out Global and Directional
###   Tests for Linear Model Assumptions
### Aliases: summary.gvlmaDel print.gvlmaDel
### Keywords: print

### ** Examples

data(CarMileageData)
CarModelAssess <- gvlma(NumGallons ~ MilesLastFill, data = CarMileageData)
CarModelAssess
CarModelDel <- deletion.gvlma(CarModelAssess)
CarModelDel
summary(CarModelDel)
summary(CarModelDel, allstats = FALSE)



