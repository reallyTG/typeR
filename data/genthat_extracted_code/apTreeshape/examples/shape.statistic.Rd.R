library(apTreeshape)


### Name: shape.statistic
### Title: Computes the log of the likelihood ratio (yule/pda)
### Aliases: shape.statistic
### Keywords: univar

### ** Examples

data(universal.treeshape)
tree <- universal.treeshape
plot(tree)
summary(tree)

likelihood.test(tree,  model = "yule", alternative = "two.sided")
likelihood.test(tree,  model = "pda", alternative = "two.sided")

## Histogram of shape statistics for a list of Yule trees 
##      (may take some time to compute)
main="Histogram of shape statistics"; xlab="shape statistic"	
hist(sapply(rtreeshape(100,tip.number=50,model="yule"),FUN=shape.statistic,
      norm="yule"), freq=FALSE, main=main, xlab=xlab)
#Increase the numner of trees >100 for a better fit
## Does it fit the Gaussian distribution with mean=0 and sd=1 ?
x<-seq(-3,3,by=0.001)
lines(x,dnorm(x))



