library(datautils)


### Name: plotmeanshack
### Title: plotmeanshack
### Aliases: plotmeanshack

### ** Examples

data(state)
plotmeanshack(state.area ~ state.region, nummeans=FALSE) # non-numeric independent variable
data(iris)
irisdat <- cbind(iris[,1:4], c(rep(1,50), rep(2,50), rep(5,50)))
names(irisdat)[5] <- "iris.class"
plotmeanshack(Sepal.Width ~ iris.class, data=irisdat, nummeans=TRUE) # (artificial) numeric variable



