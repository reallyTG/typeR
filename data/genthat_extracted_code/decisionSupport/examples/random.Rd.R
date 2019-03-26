library(decisionSupport)


### Name: random
### Title: Quantiles or empirically based generic random number generation.
### Aliases: random random.default random.vector random.data.frame

### ** Examples

 x<-random(n=10000)
 hist(x,breaks=100)
 mean(x)
 sd(x)
  
 rho<-list(distribution="norm", 
           probabilities=c(0.05,0.4,0.8), 
           quantiles=c(-4, 20, 100))
 x<-random(rho=rho, n=10000, tolConv=0.01)
 hist(x,breaks=100)
 quantile(x,p=rho[["probabilities"]])



