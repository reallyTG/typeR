library(popbio)


### Name: hudsonia
### Title: Projection matrices for mountain golden heather
### Aliases: hudsonia
### Keywords: datasets

### ** Examples

data(hudsonia)
sapply(hudsonia, lambda)

## mean matrix 
x<-mean(hudsonia)
image2(x, mar=c(1,4,5.5,1))
title("Hudsonia mean matrix", line=2.5)
lambda(x)
# variance
var2(hudsonia)



