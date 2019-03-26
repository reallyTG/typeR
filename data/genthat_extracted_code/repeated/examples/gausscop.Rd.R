library(repeated)


### Name: gausscop
### Title: Multivariate Gaussian Copula with Arbitrary Marginals
### Aliases: gausscop fitted.gausscop residuals.gausscop deviance.gausscop
###   print.gausscop
### Keywords: models

### ** Examples


# linear models
y <- matrix(rgamma(40,1,1),ncol=5)+rep(rgamma(8,0.5,1),5)
x1 <- c(rep(0,4),rep(1,4))
reps <- rmna(restovec(y),ccov=tcctomat(x1))
# independence with default gamma marginals
# compare with gnlm::gnlr(y, pmu=1, psh=0, dist="gamma", env=reps)
gausscop(y, pmu=1, pshape=0, env=reps)
gausscop(y, mu=~x1, pmu=c(1,0), pshape=0, env=reps)
# AR(1)
gausscop(y, pmu=1, pshape=0, par=0.1, env=reps)
## Not run: 
##D # random effect
##D gausscop(y, pmu=1, pshape=0, pre=0.1, env=reps)
##D # try other marginal distributions
##D gausscop(y, pmu=1, pshape=0, pre=0.1, env=reps, dist="Weibull")
##D gausscop(y, pmu=1, pshape=0, pre=0.1, env=reps, dist="inverse Gauss",
##D 	stepmax=1)
##D gausscop(y, pmu=1, pshape=0, pre=0.1, env=reps, dist="Cauchy")
##D #
##D # first-order one-compartment model
##D # create data objects for formulae
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
##D lmu <- function(p) p[1]-p[3]+log(dose/(exp(p[1])-exp(p[2]))*
##D 	(exp(-exp(p[2])*times)-exp(-exp(p[1])*times)))
##D lshape <- function(p) p[1]-p[2]+log(times*dose)-exp(p[1])*times
##D # response
##D #conc <- matrix(rgamma(40,shape(log(c(0.1,0.4))),
##D #	scale=mu(log(c(1,0.3,0.2))))/shape(log(c(0.1,0.4))),ncol=20,byrow=TRUE)
##D #conc[,2:20] <- conc[,2:20]+0.5*(conc[,1:19]-matrix(mu(log(c(1,0.3,0.2))),
##D #	ncol=20,byrow=TRUE)[,1:19])
##D #conc <- restovec(ifelse(conc>0,conc,0.01),name="conc")
##D conc <- matrix(c(3.65586845,0.01000000,0.01000000,0.01731192,1.68707608,
##D 	0.01000000,4.67338974,4.79679942,1.86429851,1.82886732,1.54708795,
##D 	0.57592054,0.08014232,0.09436425,0.26106139,0.11125534,0.22685364,
##D 	0.22896015,0.04886441,0.01000000,33.59011263,16.89115866,19.99638316,
##D 	16.94021361,9.95440037,7.10473948,2.97769676,1.53785279,2.13059515,
##D 	0.72562344,1.27832563,1.33917155,0.99811111,0.23437424,0.42751355,
##D 	0.65702300,0.41126684,0.15406463,0.03092312,0.14672610),
##D 	ncol=20,byrow=TRUE)
##D conc <- restovec(conc)
##D reps <- rmna(conc, ccov=dd, tvcov=tt)
##D # constant shape parameter
##D gausscop(conc, mu=lmu, pmu=log(c(1,0.4,0.1)), par=0.5, pshape=0, envir=reps)
##D # or
##D gausscop(conc, mu=~absorption-volume+
##D 	log(dose/(exp(absorption)-exp(elimination))*
##D 	(exp(-exp(elimination)*times)-exp(-exp(absorption)*times))),
##D 	pmu=list(absorption=0,elimination=log(0.4),volume=log(0.1)),
##D 	par=0.5, pshape=0, envir=reps)
##D # compare to gar autoregression
##D gar(conc, dist="gamma", times=1:20, mu=mu,
##D 	preg=log(c(1,0.4,0.1)), pdepend=0.5, pshape=1)
##D #
##D # time dependent shape parameter
##D gausscop(conc, mu=lmu, shape=lshape,
##D 	pmu=log(c(1,0.4,0.1)), par=0.5, pshape=c(-0.1,-0.1))
##D # or
##D gausscop(conc, mu=~absorption-volume+
##D 	log(dose/(exp(absorption)-exp(elimination))*
##D 	(exp(-exp(elimination)*times)-exp(-exp(absorption)*times))),
##D 	shape=~b1-b2+log(times*dose)-exp(b1)*times,
##D 	pmu=list(absorption=0,elimination=log(0.4),volume=log(0.1)),
##D 	par=0.5, pshape=list(b1=-0.1,b2=-0.1), envir=reps)
##D #
##D # shape depends on location
##D lshape <- function(p, mu) p[1]*log(abs(mu))
##D gausscop(conc, mu=lmu, shape=lshape, shfn=TRUE, pmu=log(c(1,0.4,0.1)),
##D 	par=0.5, pshape=1)
##D # or
##D gausscop(conc, mu=~absorption-volume+
##D 	log(dose/(exp(absorption)-exp(elimination))*
##D 	(exp(-exp(elimination)*times)-exp(-exp(absorption)*times))),
##D 	shape=~d*log(abs(mu)), shfn=TRUE,
##D 	pmu=list(absorption=0,elimination=log(0.4),volume=log(0.1)),
##D 	par=0.5, pshape=list(d=1), envir=reps)
## End(Not run)



