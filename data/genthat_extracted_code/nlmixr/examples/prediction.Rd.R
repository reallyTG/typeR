library(nlmixr)


### Name: prediction
### Title: Prediction after a gnlmm fit
### Aliases: prediction

### ** Examples

## Not run: 
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
##D theo <- read.table("theo_md.txt", head=TRUE)
##D 
##D fit = gnlmm(llik, theo, inits, pars, sys1,
##D 	control=list(trace=TRUE, nAQD=5))
##D 
##D pred = function() {
##D 	pred = centr/V
##D }
##D 
##D s = prediction(fit, pred)
##D plot(s$p, s$dv); abline(0,1,col="red")
##D 
## End(Not run)



