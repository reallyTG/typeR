library(RRF)


### Name: partialPlot
### Title: Partial dependence plot
### Aliases: partialPlot partialPlot.default partialPlot.RRF
### Keywords: classif regression tree

### ** Examples

data(airquality)
airquality <- na.omit(airquality)
set.seed(131)
ozone.rf <- RRF(Ozone ~ ., airquality)
partialPlot(ozone.rf, airquality, Temp)

data(iris)
set.seed(543)
iris.rf <- RRF(Species~., iris)
partialPlot(iris.rf, iris, Petal.Width, "versicolor")



