library(gvlma)


### Name: plot.gvlma
### Title: Various Plots for a Gvlma Object
### Aliases: plot.gvlma
### Keywords: graphs

### ** Examples

data(CarMileageData)
CarModelAssess <- gvlma(NumGallons ~ MilesLastFill + NumDaysBetw,
    data = CarMileageData)
plot(CarModelAssess)
par(mfrow=c(2,2))
plot(CarModelAssess, onepage = FALSE)



