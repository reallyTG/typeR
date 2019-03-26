library(rmutil)


### Name: pkpd
### Title: Pharmacokinetic Compartment Models
### Aliases: pkpd mu1.0o1c mu1.1o1c mu1.1o2c mu1.1o2cl mu1.1o2cc mu2.0o1c
###   mu2.0o2c1 mu2.0o2c2 mu2.1o1c mu2.0o1cfp mu2.0o2c1fp mu2.0o2c2fp
###   mu2.1o1cfp
### Keywords: models

### ** Examples

## Not run: 
##D library(repeated)
##D times <- rep(1:20,2)
##D dose <- c(rep(2,20),rep(5,20))
##D # set up a mean function for gar based on mu1.1o1c:
##D mu <- function(p) {
##D 	ka <- exp(p[2])
##D 	ke <- exp(p[3])
##D 	exp(p[2]-p[1])/(ka-ke)*(exp(-ke*times)-exp(-ka*times))}
##D conc <- matrix(rgamma(40,2,scale=mu(log(c(1,0.3,0.2)))/2),ncol=20,byrow=TRUE)
##D conc[,2:20] <- conc[,2:20]+0.5*(conc[,1:19]-matrix(mu(log(c(1,0.3,0.2))),
##D 	ncol=20,byrow=TRUE)[,1:19])
##D conc <- ifelse(conc>0,conc,0.01)
##D gar(conc, dist="gamma", times=1:20, mu=mu, preg=log(c(1,0.4,0.1)),
##D 	pdepend=0.1, pshape=1)
##D # changing variance
##D shape <- mu
##D gar(conc, dist="gamma", times=1:20, mu=mu, preg=log(c(0.5,0.4,0.1)),
##D 	pdep=0.1, shape=shape, pshape=log(c(0.5,0.4,0.1)))
## End(Not run)



