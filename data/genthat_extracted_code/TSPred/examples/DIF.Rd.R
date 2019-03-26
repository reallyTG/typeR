library(TSPred)


### Name: DIF
### Title: Differencing Transformation
### Aliases: DIF DIF.rev
### Keywords: differencing transform time series

### ** Examples

data(CATS)
d <- DIF(CATS[,1], differences = 1)
x <- DIF.rev(as.vector(d), differences = attributes(d)$ndiffs, xi = CATS[1,1])
all(round(x,4)==round(CATS[,1],4))



