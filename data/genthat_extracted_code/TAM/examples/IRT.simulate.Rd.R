library(TAM)


### Name: IRT.simulate
### Title: Simulating Item Response Models
### Aliases: IRT.simulate IRT.simulate.tam.mml IRT.simulate.tam.mml.2pl
###   IRT.simulate.tam.mml.3pl IRT.simulate.tam.mml.mfr

### ** Examples

#############################################################################
# EXAMPLE 1: Simulating Rasch model
#############################################################################

data(data.sim.rasch)

#** (1) estimate model
mod1 <- TAM::tam.mml(resp=data.sim.rasch )

#** (2) simulate data
sim.dat <- TAM::IRT.simulate(mod1)

## Not run: 
##D #** (3) use a subset of items with the argument iIndex
##D set.seed(976)
##D iIndex <- sort(sample(ncol(data.sim.rasch), 15))  # randomly select 15 items
##D sim.dat <- TAM::IRT.simulate(mod1, iIndex=iIndex)
##D mod.sim.dat <- TAM::tam.mml(sim.dat)
##D 
##D #** (4) specify number of persons in addition
##D sim.dat <- TAM::IRT.simulate(mod1, nobs=1500, iIndex=iIndex)
##D 
##D # Rasch - constraint="items" ----
##D mod1 <- TAM::tam.mml(resp=data.sim.rasch,  constraint="items",
##D                 control=list( xsi.start0=1, fac.oldxsi=.5) )
##D 
##D # provide abilities
##D theta0 <- matrix( rnorm(1500, mean=0.5, sd=sqrt(mod1$variance)), ncol=1 )
##D # simulate data
##D data <- TAM::IRT.simulate(mod1, theta=theta0 )
##D # estimate model based on simulated data
##D xsi.fixed <- cbind(1:nrow(mod1$item), mod1$item$xsi.item)
##D mod2 <- TAM::tam.mml(data, xsi.fixed=xsi.fixed )
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 2: Simulating 2PL model
##D #############################################################################
##D 
##D data(data.sim.rasch)
##D # estimate 2PL
##D mod2 <- TAM::tam.mml.2pl(resp=data.sim.rasch, irtmodel="2PL")
##D # simulate 2PL
##D sim.dat <- TAM::IRT.simulate(mod2)
##D mod.sim.dat <- TAM::tam.mml.2pl(resp=sim.dat, irtmodel="2PL")
##D 
##D #############################################################################
##D # EXAMPLE 3: Simulate multiple group model
##D #############################################################################
##D 
##D # Multi-Group ----
##D set.seed(6778)
##D N <- 3000
##D theta <- c( stats::rnorm(N/2,mean=0,sd=1.5), stats::rnorm(N/2,mean=.5,sd=1)  )
##D I <- 20
##D p1 <- stats::plogis( outer( theta, seq( -2, 2, len=I ), "-" ) )
##D resp <- 1 * ( p1 > matrix( stats::runif( N*I ), nrow=N, ncol=I ) )
##D colnames(resp) <- paste("I", 1:I, sep="")
##D group <- rep(1:2, each=N/2 )
##D mod3 <- TAM::tam.mml(resp, group=group)
##D 
##D # simulate data
##D sim.dat.g1 <- TAM::IRT.simulate(mod3,
##D                    theta=matrix( stats::rnorm(N/2, mean=0, sd=1.5), ncol=1) )
##D sim.dat.g2 <- TAM::IRT.simulate(mod3,
##D                    theta=matrix( stats::rnorm(N/2, mean=.5, sd=1), ncol=1) )
##D sim.dat <- rbind( sim.dat.g1, sim.dat.g2)
##D # estimate model
##D mod3s <- TAM::tam.mml( sim.dat, group=group)
##D 
##D #############################################################################
##D # EXAMPLE 4: Multidimensional model and latent regression
##D #############################################################################
##D 
##D set.seed(6778)
##D N <- 2000
##D Y <- cbind( stats::rnorm(N), stats::rnorm(N))
##D theta <- mvtnorm::rmvnorm(N, mean=c(0,0), sigma=matrix(c(1,.5,.5,1), 2, 2))
##D theta[,1] <- theta[,1] + .4 * Y[,1] + .2 * Y[,2]  # latent regression model
##D theta[,2] <- theta[,2] + .8 * Y[,1] + .5 * Y[,2]  # latent regression model
##D I <- 20
##D p1 <- stats::plogis(outer(theta[, 1], seq(-2, 2, len=I), "-"))
##D resp1 <- 1 * (p1 > matrix(stats::runif(N * I), nrow=N, ncol=I))
##D p1 <- stats::plogis(outer(theta[, 2], seq(-2, 2, len=I ), "-" ))
##D resp2 <- 1 * (p1 > matrix(stats::runif(N * I), nrow=N, ncol=I))
##D resp <- cbind(resp1, resp2)
##D colnames(resp) <- paste("I", 1 : (2 * I), sep="")
##D 
##D # (2) define loading Matrix
##D Q <- array(0, dim=c(2 * I, 2))
##D Q[cbind(1:(2*I), c(rep(1, I), rep(2, I)))] <- 1
##D Q
##D 
##D # (3) estimate models
##D mod4 <- TAM::tam.mml(resp=resp, Q=Q, Y=Y, control=list(  maxiter=15))
##D 
##D # simulate new item responses
##D theta <- mvtnorm::rmvnorm(N, mean=c(0,0), sigma=matrix(c(1,.5,.5,1), 2, 2))
##D theta[,1] <- theta[,1] + .4 * Y[,1] + .2 * Y[,2]  # latent regression model
##D theta[,2] <- theta[,2] + .8 * Y[,1] + .5 * Y[,2]  # latent regression model
##D 
##D sim.dat <- TAM::IRT.simulate(mod4, theta=theta)
##D mod.sim.dat <- TAM::tam.mml(resp=sim.dat, Q=Q, Y=Y, control=list( maxiter=15))
## End(Not run)



