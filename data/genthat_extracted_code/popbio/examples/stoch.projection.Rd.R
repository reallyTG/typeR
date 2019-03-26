library(popbio)


### Name: stoch.projection
### Title: Simulate stochastic growth from a sequence of matrices
### Aliases: stoch.projection
### Keywords: survey

### ** Examples

data(hudsonia)
n<-c(4264, 3,30,16,25,5)
names(n)<-c("seed",  "seedlings", "tiny", "small", "medium" , "large")

### use equal and unequal probabilities for matrix selection 
x.eq<-stoch.projection(hudsonia, n, nreps=1000)
x.uneq<-stoch.projection(hudsonia, n, nreps=1000, prob=c(.2,.2,.2,.4))

hist(apply(x.eq, 1, sum), xlim=c(0,5000), ylim=c(0,200), col="green", 
breaks=seq(0,5000, 100), xlab="Final population size at t=50", main='')

par(new=TRUE)

## use transparency for overlapping distributions - may not work on all systems
hist(apply(x.uneq, 1, sum), xlim=c(0,5000), ylim=c(0,200), col = rgb(0, 0, 1, 0.2), 
xaxt='n', yaxt='n', ylab='', xlab='', 
breaks=seq(0,10000, 100), main='')

legend(2500,200,  c("equal", "unequal"),fill=c("green", rgb(0, 0, 1, 0.2)))
title(paste("Projection of stochastic growth for Hudsonia
using equal and unequal probabilities"), cex.main=1)

## initial pop size  
sum(n)
abline(v=sum(n), lty=3)






