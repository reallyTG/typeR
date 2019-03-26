library(qle)


### Name: simQLdata
### Title: Simulate the statistical model
### Aliases: simQLdata

### ** Examples

# generate design points, simulate and return the sample means
sim <- simQLdata(sim=function(x) rlnorm(1,x[1],x[2]),
         nsim=10,N=8, method="maximinLHS",
         lb=c(-1.5,0),ub=c(2,1), mode="mean") 
  



