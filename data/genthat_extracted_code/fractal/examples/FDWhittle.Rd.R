library(fractal)


### Name: FDWhittle
### Title: Estimate the Hurst coefficient by Whittle's method
### Aliases: FDWhittle
### Keywords: univar models nonlinear

### ** Examples

set.seed(100)
walk <- cumsum(rnorm(1024))
FDWhittle(walk, method="discrete", sdf.method="multitaper")
FDWhittle(walk, method="continuous", sdf.method="multitaper")



