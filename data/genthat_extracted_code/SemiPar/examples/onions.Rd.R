library(SemiPar)


### Name: onions
### Title: Onions data
### Aliases: onions
### Keywords: datasets

### ** Examples

library(SemiPar)
data(onions)
attach(onions)
points.cols <- c("red","blue")
plot(dens,yield,col=points.cols[location+1],pch=16)
legend(100,250,c("Purnong Landing","Virginia"),col=points.cols,pch=rep(16,2))



