library(gamlss.dist)


### Name: flexDist
### Title: Non-parametric pdf from limited information data
### Aliases: flexDist
### Keywords: distribution regression

### ** Examples

# Normal
r1<-flexDist(quantiles=list(values=qNO(c(0.05, 0.25, 0.5,0.75, 0.95), mu=0, 
             sigma=1), prob=c( 0.05, 0.25, 0.5,0.75,0.95 )), 
             no.inter=200, lambda=10,  kappa=10, perc.quant=0.3)
# GAMMA
r1<-flexDist(quantiles=list(values=qGA(c(0.05,0.25, 0.5,0.75,0.95), mu=1, 
       sigma=.8), prob=c(0.05,0.25, 0.5,0.75,0.95)), 
       expectiles=list(values=1, prob=0.5),  lambda=10, 
       kappa=10, lower=0, upper=5)# 



