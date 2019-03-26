library(sirt)


### Name: mcmc.2pno
### Title: MCMC Estimation of the Two-Parameter Normal Ogive Item Response
###   Model
### Aliases: mcmc.2pno
### Keywords: Markov Chain Monte Carlo (MCMC)

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Dataset Reading
##D #############################################################################
##D data(data.read)
##D # estimate 2PNO with MCMC with 3000 iterations and 500 burn-in iterations
##D mod <- sirt::mcmc.2pno( dat=data.read, iter=3000, burnin=500 )
##D # plot MCMC chains
##D plot( mod$mcmcobj, ask=TRUE )
##D # write sampled chains into codafile
##D mcmclist2coda( mod$mcmcobj, name="dataread_2pno" )
##D # summary
##D summary(mod)
##D 
##D #############################################################################
##D # EXAMPLE 2
##D #############################################################################
##D # simulate data
##D N <- 1000
##D I <- 10
##D b <- seq( -1.5, 1.5, len=I )
##D a <- rep( c(1,2), I/2 )
##D theta1 <- stats::rnorm(N)
##D dat <- sirt::sim.raschtype( theta=theta1, fixed.a=a, b=b )
##D 
##D #***
##D # Model 1: estimate model without weights
##D mod1 <- sirt::mcmc.2pno( dat, iter=1500, burnin=500)
##D mod1$summary.mcmcobj
##D plot( mod1$mcmcobj, ask=TRUE )
##D 
##D #***
##D # Model 2: estimate model with weights
##D # define weights
##D weights <- c( rep( 5, N/4 ), rep( .2, 3/4*N ) )
##D mod2 <- sirt::mcmc.2pno( dat, weights=weights, iter=1500, burnin=500)
##D mod1$summary.mcmcobj
## End(Not run)



