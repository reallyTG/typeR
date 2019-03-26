# Example: apply `qle` to normal model with criterion `mahal`
# and check `multiSearch` and testing hypothesis while estimation
# only with global phase searches

library(qle)
options(mc.cores=2L)

# define a statistical model bysimulation function
simfunc <- function(pars) {	
	x <- rnorm(10,mean=pars["mu"],sd=pars["sigma"])    
	c("T1"=median(x),"T2"=mad(x))	
}

# box contraints defining the parameter space
lb <- c("mu"=0.5,"sigma"=0.1)
ub <- c("mu"=8.0,"sigma"=5.0)	   

## the (unknown) true parameter
theta0 <- c("mu"=2,"sigma"=1)

# simulate model at a minimum of required design points
sim <- simQLdata(sim=simfunc,nsim=10,N=8,
		method="randomLHS",lb=lb,ub=ub)	 

# true and error-free observation
obs <- structure(c("T1"=2,"T2"=1), class="simQL")

# set number of simulations manually
# since otherwise only `nsim` would be used to 
# calculate sample average variance
attr(sim,"nsim") <- 100

# construct QL approximation model
qsd <- getQLmodel(sim,lb,ub,obs,var.type="wcholMean",
		model="sirfk", criterion="mahal", verbose=TRUE)

# force only global searches and testing
OPT <- qle(qsd,simfunc,nsim=10,
		global.opts=list("stopval"=0,"maxeval"=3),
		local.opts=list("ftol_abs"=0),
		method=c("bobyqa","cobyla","direct"),pl=10)

OPT$final
OPT$why

## testing with criterion `mahal`
## here: no Iobs for best root selection
S0 <- multiSearch(theta0, qsd=OPT$qsd, method=c("bobyqa","cobyla","direct"),
		 nstart=5,	multi.start=TRUE, optInfo=TRUE, pl=10, verbose=TRUE)
 
## found roots
attr(S0,"roots")
