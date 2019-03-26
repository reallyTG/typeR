library(apTreeshape)


### Name: rtreeshape
### Title: Generate a list of random binary trees according to a given
###   model
### Aliases: rtreeshape
### Keywords: datagen

### ** Examples


## Summary of a PDA tree with 10 tips:
summary(rtreeshape(n=1, tip.number=10, model="pda")[[1]])
## Summary of a Yule tree with 10 tips:
summary(rtreeshape(n=1, tip.number=100, model="yule")[[1]])
  
## Generate trees with different sizes
trees=rtreeshape(n=2, tip.number=c(10,20), model="yule")
length(trees)
plot(trees[[1]])
plot(trees[[2]])
  
## Histogram of Colless' indices for a list of 100 PDA trees with 50 tips
hist(sapply(rtreeshape(100,50,model="pda"),FUN=colless,norm="pda"),freq=FALSE)

## Histogram of shape statistics for a list of 100 Yule trees with 50 tips 
##      (takes some time to compute) 
main="Histogram of shape statistics for a list of 100 Yule trees"
hist(sapply(rtreeshape(100,50,model="yule"),FUN=shape.statistic,norm="yule"),
      freq=FALSE, main=main)
## It should be a gaussian with mean 0 and standard deviation 1 
## consider to increase the number of trees>100
x<-seq(-4,4,by=0.01)
lines(x,dnorm(x))	

## Building a tree using Markov splitting model
Q <- function(n,i) (i==1)

tree=rtreeshape(n=1, tip.number=10, FUN=Q)
plot(tree[[1]])



