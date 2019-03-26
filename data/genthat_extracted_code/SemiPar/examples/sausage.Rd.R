library(SemiPar)


### Name: sausage
### Title: Sausage data
### Aliases: sausage
### Keywords: datasets

### ** Examples

library(SemiPar)
data(sausage)
attach(sausage)
points.cols <- c("red","blue","green")
plot(sodium,calories,col=points.cols[type],pch=16)
legend(200,180,c("beef","pork","poultry"),col=points.cols,pch=rep(16,3))



