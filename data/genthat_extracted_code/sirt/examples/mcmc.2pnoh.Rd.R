library(sirt)


### Name: mcmc.2pnoh
### Title: MCMC Estimation of the Hierarchical IRT Model for
###   Criterion-Referenced Measurement
### Aliases: mcmc.2pnoh
### Keywords: Markov Chain Monte Carlo (MCMC)

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Simulated data according to Janssen et al. (2000, Table 2)
##D #############################################################################
##D 
##D N <- 1000
##D Ik <- c(4,6,8,5,9,6,8,6,5)
##D xi.k <- c( -.89, -1.13, -1.23, .06, -1.41, -.66, -1.09, .57, -2.44)
##D omega.k <- c(.98, .91, .76, .74, .71, .80, .79, .82, .54)
##D 
##D # select 4 attributes
##D K <- 4
##D Ik <- Ik[1:K] ; xi.k <- xi.k[1:K] ; omega.k <- omega.k[1:K]
##D sig2 <- 3.02
##D nu2 <- .09
##D I <- sum(Ik)
##D b <- rep( xi.k, Ik ) + stats::rnorm(I, sd=sqrt(sig2) )
##D a <- rep( omega.k, Ik ) + stats::rnorm(I, sd=sqrt(nu2) )
##D theta1 <- stats::rnorm(N)
##D t1 <- rep(1,N)
##D p1 <- stats::pnorm( outer(t1,a) * ( theta1 - outer(t1,b) ) )
##D dat <- 1  * ( p1 > stats::runif(N*I)  )
##D itemgroups <- rep( paste0("A", 1:K ), Ik )
##D 
##D # estimate model
##D mod <- sirt::mcmc.2pnoh(dat, itemgroups, burnin=200, iter=1000 )
##D # summary
##D summary(mod)
##D # plot
##D plot(mod$mcmcobj, ask=TRUE)
##D # write coda files
##D mcmclist2coda( mod$mcmcobj, name="simul_2pnoh" )
## End(Not run)



