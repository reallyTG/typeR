library(ks)


### Name: histde
### Title: Histogram density estimate
### Aliases: histde predict.histde
### Keywords: smooth

### ** Examples

## positive data example
set.seed(8192)
x <- 2^rnorm(100)
fhat <- histde(x=x)
plot(fhat, col=3)
points(c(0.5, 1), predict(fhat, x=c(0.5, 1)))

## large data example on a non-default grid
set.seed(8192)
x <- rmvnorm.mixt(10000, mus=c(0,0), Sigmas=invvech(c(1,0.8,1)))
fhat <- histde(x=x, xmin=c(-5,-5), xmax=c(5,5))
plot(fhat)

## See other examples in ? plot.histde



