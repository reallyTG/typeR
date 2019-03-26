library(qle)


### Name: getQLmodel
### Title: Setup the quasi-likelihood approximation model all at once
### Aliases: getQLmodel

### ** Examples


data(normal)

# simulate model at a minimum of required design points
sim <- simQLdata(sim=qsd$simfn,nsim=5,N=8,
			 method="maximinLHS",lb=qsd$lower,ub=qsd$upper)
	 
# true and error-free observation
obs <- structure(c("T1"=2,"T2"=1), class="simQL")

# construct QL approximation model
qsd <- getQLmodel(sim,qsd$lower,qsd$upper,obs,var.type="wcholMean")





