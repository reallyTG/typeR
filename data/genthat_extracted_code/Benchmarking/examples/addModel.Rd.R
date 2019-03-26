library(Benchmarking)


### Name: dea.add
### Title: Additive DEA model
### Aliases: dea.add
### Keywords: models

### ** Examples

x <- matrix(c(2,3,2,4,6,5,6,8),ncol=1)
y <- matrix(c(1,3,2,3,5,2,3,5),ncol=1)
dea.plot.frontier(x,y,txt=1:dim(x)[1])

sb <- dea.add(x,y,RTS="vrs")
data.frame("sx"=sb$sx,"sy"=sb$sy,"sum"=sb$sum,"slack"=sb$slack)



