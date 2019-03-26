library(TAM)


### Name: IRTLikelihood.ctt
### Title: Computes Individual Likelihood from Classical Test Theory
###   Estimates
### Aliases: IRTLikelihood.ctt

### ** Examples

#############################################################################
# EXAMPLE 1: Individual likelihood and latent regression in CTT
#############################################################################

set.seed(75)

#--- simulate data
N <- 2000
x1 <- stats::rnorm(N)
x2 <- .7 * x1 + stats::runif(N)
# simulate true score
theta <- 1.2 + .6*x1 + .3 *x2 + stats::rnorm(N, sd=sqrt(.50) )
var(theta)
# simulate measurement error variances
errvar <- stats::runif( N, min=.6, max=.9 )
# simulate observed scores
y <- theta + stats::rnorm( N, sd=sqrt( errvar) )

#--- create likelihood object
like1 <- TAM::IRTLikelihood.ctt( y=y, errvar=errvar, theta=NULL )

#--- estimate latent regression
X <- data.frame(x1,x2)
mod1 <- TAM::tam.latreg( like=like1, Y=X )

## Not run: 
##D #--- draw plausible values
##D pv1 <- TAM::tam.pv( mod1, normal.approx=TRUE )
##D 
##D #--- create datalist
##D datlist1 <- TAM::tampv2datalist( pv1, pvnames="thetaPV", Y=X )
##D 
##D #--- statistical inference on plausible values using mitools package
##D library(mitools)
##D datlist1a <- mitools::imputationList(datlist1)
##D 
##D # fit linear regression and apply Rubin formulas
##D mod2 <- with( datlist1a, stats::lm( thetaPV ~ x1 + x2 ) )
##D summary( mitools::MIcombine(mod2) )
## End(Not run)



