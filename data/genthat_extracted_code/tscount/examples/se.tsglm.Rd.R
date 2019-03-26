library(tscount)


### Name: se.tsglm
### Title: Standard Errors of a Fitted Generalised Linear Model for Time
###   Series of Counts
### Aliases: se.tsglm se
### Keywords: Inference

### ** Examples

###Road casualties in Great Britain (see help("Seatbelts"))
timeseries <- Seatbelts[, "VanKilled"]
regressors <- cbind(PetrolPrice=Seatbelts[, c("PetrolPrice")],
                    linearTrend=seq(along=timeseries)/12)
#Logarithmic link function with Poisson distribution:                    
seatbeltsfit <- tsglm(ts=timeseries, link="log",
  model=list(past_obs=c(1, 12)), xreg=regressors, distr="poisson")
  
se(seatbeltsfit) #by normal approximation

## Not run: 
##D system.time(stderror <- se(seatbeltsfit, B=100)) #by bootstrap
##D stderror
##D #This estimation of bootstrap standard errors takes several minutes on a single
##D #processing unit, of course depending on its speed.
##D #Parallel computation for shorter run time on a cluster:
##D library(parallel)
##D ntasks <- 3
##D clust <- makeCluster(ntasks)
##D setDefaultCluster(cl=clust)
##D system.time(stderror <- se(seatbeltsfit, B=100, parallel=TRUE))
## End(Not run)



