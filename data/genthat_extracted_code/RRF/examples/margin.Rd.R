library(RRF)


### Name: margin
### Title: Margins of RRF Classifier
### Aliases: margin margin.default margin.RRF plot.margin
### Keywords: classif

### ** Examples

set.seed(1)
data(iris)
iris.rf <- RRF(Species ~ ., iris, keep.forest=FALSE)
plot(margin(iris.rf))



