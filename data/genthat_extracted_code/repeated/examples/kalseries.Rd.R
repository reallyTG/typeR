library(repeated)


### Name: kalseries
### Title: Repeated Measurements Models for Continuous Variables with
###   Frailty or Serial Dependence
### Aliases: kalseries deviance.kalseries residuals.kalseries
###   fitted.kalseries print.kalseries
### Keywords: models

### ** Examples


treat <- c(0,0,1,1)
tr <- tcctomat(treat)
dose <- matrix(rpois(20,10), ncol=5)
dd <- tvctomat(dose)
y <- restovec(matrix(rnorm(20), ncol=5), name="y")
reps <- rmna(y, ccov=tr, tvcov=dd)
#
# normal intensity, independence model
kalseries(y, intensity="normal", dep="independence", preg=1, pshape=5)
## Not run: 
##D # random effect
##D kalseries(y, intensity="normal", dep="frailty", preg=1, pinitial=1, psh=5)
##D # serial dependence
##D kalseries(y, intensity="normal", dep="serial", preg=1, pinitial=1,
##D 	pdep=0.1, psh=5)
##D # random effect and autoregression
##D kalseries(y, intensity="normal", dep="frailty", preg=1, pinitial=1,
##D 	pdep=0.1, psh=5)
##D #
##D # add time-constant variable
##D kalseries(y, intensity="normal", dep="serial", pinitial=1,
##D 	pdep=0.1, psh=5, preg=c(1,0), ccov=treat)
##D # or equivalently
##D kalseries(y, intensity="normal", mu=~treat, dep="serial", pinitial=1,
##D 	pdep=0.1, psh=5, preg=c(1,0))
##D # or
##D kalseries(y, intensity="normal", mu=~b0+b1*treat, dep="serial",
##D 	pinitial=1, pdep=0.1, psh=5, preg=c(1,0), envir=reps)
##D #
##D # add time-varying variable
##D kalseries(y, intensity="normal", dep="serial", pinitial=1, pdep=0.1,
##D 	psh=5, preg=c(1,0), ccov=treat, ptvc=0, tvc=dose)
##D # or equivalently, from the environment
##D dosev <- as.vector(t(dose))
##D kalseries(y, intensity="normal",
##D 	mu=~b0+b1*rep(treat,rep(5,4))+b2*dosev,
##D 	dep="serial", pinitial=1, pdep=0.1, psh=5, ptvc=c(1,0,0))
##D # or from the reps data object
##D kalseries(y, intensity="normal", mu=~b0+b1*treat+b2*dose,
##D 	dep="serial", pinitial=1, pdep=0.1, psh=5, ptvc=c(1,0,0),
##D 	envir=reps)
##D # try power variance family instead of gamma distribution for mixture
##D kalseries(y, intensity="normal", mu=~b0+b1*treat+b2*dose,
##D 	dep="serial", pinitial=1, pdep=0.1, psh=5, ptvc=c(1,0,0),
##D 	pfamily=0.1, envir=reps)
##D # first-order one-compartment model
##D # data objects for formulae
##D dose <- c(2,5)
##D dd <- tcctomat(dose)
##D times <- matrix(rep(1:20,2), nrow=2, byrow=TRUE)
##D tt <- tvctomat(times)
##D # vector covariates for functions
##D dose <- c(rep(2,20),rep(5,20))
##D times <- rep(1:20,2)
##D # functions
##D mu <- function(p) exp(p[1]-p[3])*(dose/(exp(p[1])-exp(p[2]))*
##D 	(exp(-exp(p[2])*times)-exp(-exp(p[1])*times)))
##D shape <- function(p) exp(p[1]-p[2])*times*dose*exp(-exp(p[1])*times)
##D # response
##D conc <- matrix(rgamma(40,shape(log(c(0.01,1))),
##D 	scale=mu(log(c(1,0.3,0.2))))/shape(log(c(0.1,0.4))),ncol=20,byrow=TRUE)
##D conc[,2:20] <- conc[,2:20]+0.5*(conc[,1:19]-matrix(mu(log(c(1,0.3,0.2))),
##D 	ncol=20,byrow=TRUE)[,1:19])
##D conc <- restovec(ifelse(conc>0,conc,0.01))
##D reps <- rmna(conc, ccov=dd, tvcov=tt)
##D #
##D # constant shape parameter
##D kalseries(reps, intensity="gamma", dep="independence", mu=mu,
##D 	ptvc=c(-1,-1.1,-1), pshape=1.5)
##D # or
##D kalseries(reps, intensity="gamma", dep="independence",
##D 	mu=~exp(absorption-volume)*
##D 	dose/(exp(absorption)-exp(elimination))*
##D 	(exp(-exp(elimination)*times)-exp(-exp(absorption)*times)),
##D 	ptvc=list(absorption=-1,elimination=-1.1,volume=-1),
##D 	pshape=1.2)
##D # add serial dependence
##D kalseries(reps, intensity="gamma", dep="serial", pdep=0.9,
##D 	mu=~exp(absorption-volume)*
##D 	dose/(exp(absorption)-exp(elimination))*
##D 	(exp(-exp(elimination)*times)-exp(-exp(absorption)*times)),
##D 	ptvc=list(absorption=-1,elimination=-1.1,volume=-1),
##D 	pshape=0.2)
##D # time dependent shape parameter
##D kalseries(reps, intensity="gamma", dep="independence", mu=mu,
##D 	shape=shape, ptvc=c(-1,-1.1,-1), pshape=c(-3,0))
##D # or
##D kalseries(reps, intensity="gamma", dep="independence",
##D 	mu=~exp(absorption-volume)*
##D 	dose/(exp(absorption)-exp(elimination))*
##D 	(exp(-exp(elimination)*times)-exp(-exp(absorption)*times)),
##D 	ptvc=list(absorption=-1,elimination=-1.1,volume=-1),
##D 	shape=~exp(b1-b2)*times*dose*exp(-exp(b1)*times),
##D 	pshape=list(b1=-3,b2=0))
##D # add serial dependence
##D kalseries(reps, intensity="gamma", dep="serial", pdep=0.5,
##D 	mu=~exp(absorption-volume)*
##D 	dose/(exp(absorption)-exp(elimination))*
##D 	(exp(-exp(elimination)*times)-exp(-exp(absorption)*times)),
##D 	ptvc=list(absorption=-1,elimination=-1.1,volume=-1),
##D 	shape=~exp(b1-b2)*times*dose*exp(-exp(b1)*times),
##D 	pshape=list(b1=-3,b2=0))
## End(Not run)



