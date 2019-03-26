library(qle)


### Name: setQLdata
### Title: Setup of quasi-likelihood data for estimation
### Aliases: setQLdata

### ** Examples

# simulate model statistics at LHS design
sim <- simQLdata(sim =
         function(x,cond) {
           X <- rlnorm(cond$n,x[1],x[2])
           c("MED"=median(X),"MAD"=mad(X))
         },
         cond=list("n"=10),
         nsim=10, N=10, method="maximinLHS",
         lb=c("mu"=-1.5,"sd"=0), ub=c("mu"=2,"sd"=1))

# setup the QL data model using defaults
qldata <- setQLdata(sim,verbose=TRUE) 
  



