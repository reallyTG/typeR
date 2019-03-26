library(Benchmarking)


### Name: outlier.ap
### Title: Detection of outliers in benchmark models
### Aliases: outlier.ap outlier.ap.plot

### ** Examples

n <- 25
x <- matrix(rnorm(n))
y <- .5 + 2.5*x + 2*rnorm(25)
tap <- outlier.ap(x,y, NDEL=2)
print(cbind(tap$imat,tap$rmin), na.print="", digit=2)
outlier.ap.plot(tap$ratio)



