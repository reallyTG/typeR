library(TSPred)


### Name: PCT
### Title: Percentage Change Transformation
### Aliases: PCT PCT.rev
### Keywords: percentage change transform time series

### ** Examples

data(NN5.A)
ts <- na.omit(NN5.A[,10])
length(ts)

pct <- PCT(ts)
length(pct)

x0 <- ts[1]
pct.rev <- PCT.rev(pct,x0)
x <- c(x0,pct.rev)

all(round(x,4)==round(ts,4))



