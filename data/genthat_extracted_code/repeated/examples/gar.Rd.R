library(repeated)


### Name: gar
### Title: Generalized Autoregression Models
### Aliases: gar volatility volatility.gar deviance.gar fitted.gar
###   print.gar residuals.gar
### Keywords: models

### ** Examples


# first-order one-compartment model
# data objects for formulae
dose <- c(2,5)
dd <- tcctomat(dose)
times <- matrix(rep(1:20,2), nrow=2, byrow=TRUE)
tt <- tvctomat(times)
# vector covariates for functions
dose <- c(rep(2,20),rep(5,20))
times <- rep(1:20,2)
# functions
mu <- function(p) exp(p[1]-p[3])*(dose/(exp(p[1])-exp(p[2]))*
	(exp(-exp(p[2])*times)-exp(-exp(p[1])*times)))
shape <- function(p) exp(p[1]-p[2])*times*dose*exp(-exp(p[1])*times)
# response
conc <- matrix(rgamma(40,shape(log(c(0.1,0.4))),
	scale=mu(log(c(1,0.3,0.2))))/shape(log(c(0.1,0.4))),ncol=20,byrow=TRUE)
conc[,2:20] <- conc[,2:20]+0.5*(conc[,1:19]-matrix(mu(log(c(1,0.3,0.2))),
	ncol=20,byrow=TRUE)[,1:19])
conc <- restovec(ifelse(conc>0,conc,0.01),name="conc")
reps <- rmna(conc, ccov=dd, tvcov=tt)
# constant shape parameter
gar(conc, dist="gamma", times=1:20, mu=mu,
	preg=log(c(1,0.4,0.1)), pdepend=0.5, pshape=1)
# or
gar(conc, dist="gamma", times=1:20, mu=~exp(absorption-volume)*
	dose/(exp(absorption)-exp(elimination))*
	(exp(-exp(elimination)*times)-exp(-exp(absorption)*times)),
	preg=list(absorption=0,elimination=log(0.4),volume=log(0.1)),
	pdepend=0.5, pshape=1, envir=reps)
# generalized gamma distribution
gar(conc, dist="gen gamma", times=1:20, mu=mu,
	preg=log(c(1,0.4,0.1)), pdepend=0.5, pshape=c(1,1))
# (if the covariates contained NAs, reps would have to be used as
# response instead of conc)
#
# time dependent shape parameter
gar(conc, dist="gamma", times=1:20, mu=mu, shape=shape,
	preg=log(c(1,0.4,0.1)), pdepend=0.5, pshape=log(c(1,0.2)))
# or
gar(conc, dist="gamma", times=1:20, mu=~exp(absorption-volume)*
	dose/(exp(absorption)-exp(elimination))*
	(exp(-exp(elimination)*times)-exp(-exp(absorption)*times)),
	shape=~exp(b1-b2)*times*dose*exp(-exp(b1)*times),
	preg=list(absorption=0,elimination=log(0.4),volume=log(0.1)),
	pdepend=0.5, pshape=list(b1=0,b2=log(0.2)), envir=reps)
# generalized gamma distribution
gar(conc, dist="gen gamma", times=1:20, mu=mu, shape=shape,
	preg=log(c(1,0.4,0.1)), pdepend=0.5,
	pshape=c(log(c(1,0.2)),2))
#
# shape function depends on location parameter
shape <- function(p, mu) p[1]+p[2]*mu
gar(conc, dist="gamma", times=1:20, mu=mu, shape=shape, shfn=TRUE,
	preg=log(c(1,0.4,0.1)), pdepend=0.5, pshape=c(1,0))
# or
gar(conc, dist="gamma", times=1:20, mu=mu, shape=~a+d*mu, shfn=TRUE,
	preg=log(c(1,0.4,0.1)), pdepend=0.5, pshape=c(1,0))




