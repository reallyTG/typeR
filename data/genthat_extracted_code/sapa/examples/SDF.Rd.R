library(sapa)


### Name: SDF
### Title: Nonparametric (cross) spectral density function estimation
### Aliases: SDF as.matrix.SDF plot.SDF print.SDF
### Keywords: univar

### ** Examples

## calculate various SDF estimates for the 
## sunspots series. remove mean component for a 
## better comparison. 

require(ifultools)
data <- as.numeric(sunspots)
methods <- c("direct","wosa","multitaper",
    "lag window")

S <- lapply(methods, function(x, data) SDF(data, method=x), data)
x <- attr(S[[1]], "frequency")[-1]
y <- lapply(S,function(x) decibel(as.vector(x)[-1]))
names(y) <- methods

## create a stack plot of the data 
stackPlot(x, y, col=1:4)

## calculate the cross-spectrum of the same 
## series: all spectra should be the same in 
## this case 
SDF(cbind(data,data), method="lag")

## calculate the SDF using npad=31 
SDF(data, npad=31, method="multitaper")



