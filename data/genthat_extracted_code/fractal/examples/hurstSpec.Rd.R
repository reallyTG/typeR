library(fractal)


### Name: hurstSpec
### Title: Hurst coefficient estimation via spectral regression
### Aliases: hurstSpec
### Keywords: univar models nonlinear

### ** Examples

## create test series 
set.seed(100)
x <- rnorm(1024)
walk <- cumsum(x)

## calculate the Hurst coefficient of a random 
## walk series using various techniques. use a 
## multitaper SDF 
methods <- c("standard","smoothed")
z <- lapply(methods, function(method, walk){
    hurstSpec(walk, method=method, sdf.method="multitaper")
},walk=walk )
names(z) <- methods

## plot results 
old.plt <- par("plt")
for (i in 1:2){
    splitplot(2,1,i)
    plot(z[[i]])
}
par(plt=old.plt)

## Robinson's method 
hurstSpec(walk, method="robinson", sdf.method="multitaper")



