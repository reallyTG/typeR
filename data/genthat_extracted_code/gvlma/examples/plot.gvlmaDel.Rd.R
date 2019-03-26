library(gvlma)


### Name: plot.gvlmaDel
### Title: Various Plots for a Gvlmadel Object
### Aliases: plot.gvlmaDel
### Keywords: graphs

### ** Examples

data(CarMileageData)
CarModelAssess <- gvlma(NumGallons ~ MilesLastFill + NumDaysBetw,
    data = CarMileageData)
CarModelDel <- deletion.gvlma(CarModelAssess)
par(mfrow=c(1,1))
plot(CarModelDel)
par(mfrow=c(2,2))
plot(CarModelDel)
plot(CarModelDel, TukeyStyle = FALSE)
plot(CarModelDel, which = 2)



