library(decisionSupport)


### Name: random.estimate
### Title: Generate random numbers for an estimate.
### Aliases: random.estimate

### ** Examples

variable=c("revenue","costs")
distribution=c("norm","norm")
 lower=c(10000,  5000)
 upper=c(100000, 50000)
 estimateObject<-as.estimate(variable, distribution, lower, upper)
 x<-random(rho=estimateObject, n=10000)
 apply(X=x, MARGIN=2, FUN=quantile, probs=c(0.05, 0.95))
 cor(x)
 colnames(x)
 summary(x)
 hist(x[,"revenue"])
 hist(x[,"costs"])
 
 # Create an estimate with median and method information:
 estimateObject<-estimate(         c("posnorm", "lnorm"),
                                   c(        4,       4),
                                   c(       50,      10),
                          variable=c("revenue", "costs"),
                          median = c(   "mean",      NA),
                          method = c(    "fit",      ""))
 # Sample random values for this estimate:
 x<-random(rho=estimateObject, n=10000)
 # Check the results 
 apply(X=x, MARGIN=2, FUN=quantile, probs=c(0.05, 0.95))
 summary(x)
 hist(x[,"revenue"], breaks=100)
 hist(x[,"costs"], breaks=100)
 



