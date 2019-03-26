library(mda)


### Name: plot.fda
### Title: Plot for Flexible Discriminant Analysis
### Aliases: plot.fda
### Keywords: classif

### ** Examples

data(iris)
irisfit <- fda(Species ~ ., data = iris)
plot(irisfit)
data(ESL.mixture)
## Not a data frame
mixture.train=ESL.mixture[c("x","y")] 
mixfit=mda(y~x, data=mixture.train)
plot(mixfit, mixture.train)
plot(mixfit, data=ESL.mixture$xnew, group="pred")



