library(nlmixr)


### Name: gnlmm
### Title: Fit a generalized nonlinear mixed-effect model
### Aliases: gnlmm gnlmm2

### ** Examples

llik <- function()
{
	lp = THETA[1]*x1+THETA[2]*x2+(x1+x2*THETA[3])*ETA[1]
	p = pnorm(lp)
	dbinom(x, m, p, log=TRUE)
}
inits = list(THTA=c(1,1,1), OMGA=list(ETA[1]~1))

gnlmm(llik, rats, inits, control=list(nAQD=3))


## Not run: 
##D llik <- function()
##D {
##D 	if (group==1) lp = THETA[1]+THETA[2]*logtstd+ETA[1]
##D 	else          lp = THETA[3]+THETA[4]*logtstd+ETA[1]
##D 	lam = exp(lp)
##D 	dpois(y, lam, log=TRUE)
##D }
##D inits = list(THTA=c(1,1,1,1), OMGA=list(ETA[1]~1))
##D 
##D fit = gnlmm(llik, pump, inits,
##D 	control=list(
##D 	    reltol.outer=1e-4,
##D 		optim.outer="nmsimplex",
##D 		nAQD=5
##D 	)
##D )
##D 
##D 
##D 
##D ode <- "
##D d/dt(depot) =-KA*depot;
##D d/dt(centr) = KA*depot - KE*centr;
##D "
##D sys1 = RxODE(ode)
##D 
##D pars <- function()
##D {
##D 	CL = exp(THETA[1] + ETA[1])#; if (CL>100) CL=100
##D 	KA = exp(THETA[2] + ETA[2])#; if (KA>20) KA=20
##D 	KE = exp(THETA[3])
##D 	V  = CL/KE
##D 	sig2 = exp(THETA[4])
##D }
##D llik <- function() {
##D 	pred = centr/V
##D 	dnorm(DV, pred, sd=sqrt(sig2), log=TRUE)
##D }
##D inits = list(THTA=c(-3.22, 0.47, -2.45, 0))
##D inits$OMGA=list(ETA[1]~.027, ETA[2]~.37)
##D #inits$OMGA=list(ETA[1]+ETA[2]~c(.027, .01, .37))
##D theo <- read.table("theo_md.txt", head=TRUE)
##D 
##D fit = gnlmm(llik, theo, inits, pars, sys1,
##D 	control=list(trace=TRUE, nAQD=5))
##D 
##D cv = calcCov(fit)
##D cbind(fit$par[fit$nsplt==1], sqrt(diag(cv)))
##D 
## End(Not run)



