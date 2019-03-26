library(gvlma)


### Name: deletion.gvlma
### Title: Deletion Statistics for a Linear Model
### Aliases: deletion.gvlma
### Keywords: regression

### ** Examples

data(CarMileageData)
CarModelAssess <- gvlma(NumGallons ~ MilesLastFill, data = CarMileageData)
CarModelDel <- deletion.gvlma(CarModelAssess)
CarModelDel



