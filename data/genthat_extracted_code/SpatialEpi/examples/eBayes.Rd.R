library(SpatialEpi)


### Name: eBayes
### Title: Empirical Bayes Estimates of Relative Risk
### Aliases: eBayes
### Keywords: file

### ** Examples

data(scotland)
data <- scotland$data

x <- data$AFF
Xmat <- cbind(x,x^2)
results <- eBayes(data$cases,data$expected,Xmat)

scotland.map <- scotland$spatial.polygon
mapvariable(results$RR, scotland.map)



