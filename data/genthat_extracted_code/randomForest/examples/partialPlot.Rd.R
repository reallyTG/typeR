library(randomForest)


### Name: partialPlot
### Title: Partial dependence plot
### Aliases: partialPlot partialPlot.default partialPlot.randomForest
### Keywords: classif regression tree

### ** Examples

data(iris)
set.seed(543)
iris.rf <- randomForest(Species~., iris)
partialPlot(iris.rf, iris, Petal.Width, "versicolor")

## Looping over variables ranked by importance:
data(airquality)
airquality <- na.omit(airquality)
set.seed(131)
ozone.rf <- randomForest(Ozone ~ ., airquality, importance=TRUE)
imp <- importance(ozone.rf)
impvar <- rownames(imp)[order(imp[, 1], decreasing=TRUE)]
op <- par(mfrow=c(2, 3))
for (i in seq_along(impvar)) {
    partialPlot(ozone.rf, airquality, impvar[i], xlab=impvar[i],
                main=paste("Partial Dependence on", impvar[i]),
                ylim=c(30, 70))
}
par(op)



