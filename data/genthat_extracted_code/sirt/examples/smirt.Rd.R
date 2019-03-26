library(sirt)


### Name: smirt
### Title: Multidimensional Noncompensatory, Compensatory and Partially
###   Compensatory Item Response Model
### Aliases: smirt summary.smirt logLik.smirt anova.smirt IRT.irfprob.smirt
###   IRT.likelihood.smirt IRT.posterior.smirt IRT.modelfit.smirt
###   summary.IRT.modelfit.smirt
### Keywords: Multidimensional item response model summary

### ** Examples

#############################################################################
## EXAMPLE 1: Noncompensatory and compensatory IRT models
#############################################################################
set.seed(997)

# (1) simulate data from a two-dimensional noncompensatory
#     item response model
#   -> increase number of iterations in all models!

N <- 1000    # number of persons
I <- 10        # number of items
theta0 <- rnorm( N, sd=1 )
theta1 <- theta0 + rnorm(N, sd=.7 )
theta2 <- theta0 + rnorm(N, sd=.7 )
Q <- matrix( 1, nrow=I,ncol=2 )
Q[ 1:(I/2), 2 ] <- 0
Q[ I,1] <- 0
b <- matrix( rnorm( I*2 ), I, 2 )
a <- matrix( 1, I, 2 )

# simulate data
prob <- dat <- matrix(0, nrow=N, ncol=I )
for (ii in 1:I){
prob[,ii] <- ( stats::plogis( theta1 - b[ii,1]  ) )^Q[ii,1]
prob[,ii] <- prob[,ii] * ( stats::plogis( theta2 - b[ii,2]  ) )^Q[ii,2]
            }
dat[ prob > matrix( stats::runif( N*I),N,I) ] <- 1
colnames(dat) <- paste0("I",1:I)

#***
# Model 1: Noncompensatory 1PL model
mod1 <- sirt::smirt(dat, Qmatrix=Q, maxiter=10 ) # change number of iterations
summary(mod1)

## Not run: 
##D #***
##D # Model 2: Noncompensatory 2PL model
##D mod2 <- sirt::smirt(dat,Qmatrix=Q, est.a="2PL", maxiter=15 )
##D summary(mod2)
##D 
##D # Model 2a: avoid convergence problems with increment.factor
##D mod2a <- sirt::smirt(dat,Qmatrix=Q, est.a="2PL", maxiter=30, increment.factor=1.03)
##D summary(mod2a)
##D 
##D #***
##D # Model 3: some fixed c and d parameters different from zero or one
##D c.init <- rep(0,I)
##D c.init[ c(3,7)] <- .2
##D d.init <- rep(1,I)
##D d.init[c(4,8)] <- .95
##D mod3 <- sirt::smirt( dat, Qmatrix=Q, c.init=c.init, d.init=d.init )
##D summary(mod3)
##D 
##D #***
##D # Model 4: some estimated c and d parameters (in parameter groups)
##D est.c <- c.init <- rep(0,I)
##D c.estpars <- c(3,6,7)
##D c.init[ c.estpars ] <- .2
##D est.c[c.estpars] <- 1
##D est.d <- rep(0,I)
##D d.init <- rep(1,I)
##D d.estpars <- c(6,9)
##D d.init[ d.estpars ] <- .95
##D est.d[ d.estpars ] <- d.estpars   # different d parameters
##D mod4 <- sirt::smirt(dat,Qmatrix=Q, est.c=est.c, c.init=c.init,
##D             est.d=est.d, d.init=d.init  )
##D summary(mod4)
##D 
##D #***
##D # Model 5: Unidimensional 1PL model
##D Qmatrix <- matrix( 1, nrow=I, ncol=1 )
##D mod5 <- sirt::smirt( dat, Qmatrix=Qmatrix )
##D summary(mod5)
##D 
##D #***
##D # Model 6: Unidimensional 2PL model
##D mod6 <- sirt::smirt( dat, Qmatrix=Qmatrix, est.a="2PL" )
##D summary(mod6)
##D 
##D #***
##D # Model 7: Compensatory model with between item dimensionality
##D # Note that the data is simulated under the noncompensatory condition
##D # Therefore Model 7 should have a worse model fit than Model 1
##D Q1 <- Q
##D Q1[ 6:10, 1] <- 0
##D mod7 <- sirt::smirt(dat,Qmatrix=Q1, irtmodel="comp", maxiter=30)
##D summary(mod7)
##D 
##D #***
##D # Model 8: Compensatory model with within item dimensionality
##D #         assuming zero correlation between dimensions
##D variance.fixed <- as.matrix( cbind( 1,2,0) )
##D # set the covariance between the first and second dimension to zero
##D mod8 <- sirt::smirt(dat,Qmatrix=Q, irtmodel="comp", variance.fixed=variance.fixed,
##D             maxiter=30)
##D summary(mod8)
##D 
##D #***
##D # Model 8b: 2PL model with starting values for a and b parameters
##D b.init <- rep(0,10)  # set all item difficulties initially to zero
##D # b.init <- NULL
##D a.init <- Q       # initialize a.init with Q-matrix
##D # provide starting values for slopes of first three items on Dimension 1
##D a.init[1:3,1] <- c( .55, .32, 1.3)
##D 
##D mod8b <- sirt::smirt(dat,Qmatrix=Q, irtmodel="comp", variance.fixed=variance.fixed,
##D               b.init=b.init, a.init=a.init, maxiter=20, est.a="2PL" )
##D summary(mod8b)
##D 
##D #***
##D # Model 9: Unidimensional model with quadratic item response functions
##D # define theta
##D theta.k <- seq( - 6, 6, len=15 )
##D theta.k <- as.matrix( theta.k, ncol=1 )
##D # define design matrix
##D theta.kDES <- cbind( theta.k[,1], theta.k[,1]^2 )
##D # define Q-matrix
##D Qmatrix <- matrix( 0, I, 2 )
##D Qmatrix[,1] <- 1
##D Qmatrix[ c(3,6,7), 2 ] <- 1
##D colnames(Qmatrix) <- c("F1", "F1sq" )
##D # estimate model
##D mod9 <- sirt::smirt(dat,Qmatrix=Qmatrix, maxiter=50, irtmodel="comp",
##D            theta.k=theta.k, theta.kDES=theta.kDES, est.a="2PL" )
##D summary(mod9)
##D 
##D #***
##D # Model 10: Two-dimensional item response model with latent interaction
##D #           between dimensions
##D theta.k <- seq( - 6, 6, len=15 )
##D theta.k <- expand.grid( theta.k, theta.k )    # expand theta to 2 dimensions
##D # define design matrix
##D theta.kDES <- cbind( theta.k, theta.k[,1]*theta.k[,2] )
##D # define Q-matrix
##D Qmatrix <- matrix( 0, I, 3 )
##D Qmatrix[,1] <- 1
##D Qmatrix[ 6:10, c(2,3) ] <- 1
##D colnames(Qmatrix) <- c("F1", "F2", "F1iF2" )
##D # estimate model
##D mod10 <- sirt::smirt(dat,Qmatrix=Qmatrix,irtmodel="comp", theta.k=theta.k,
##D             theta.kDES=theta.kDES, est.a="2PL" )
##D summary(mod10)
##D 
##D #****
##D # Model 11: Example Quasi Monte Carlo integration
##D Qmatrix <- matrix( 1, I, 1 )
##D mod11 <- sirt::smirt( dat, irtmodel="comp", Qmatrix=Qmatrix, qmcnodes=1000 )
##D summary(mod11)
##D 
##D #############################################################################
##D ## EXAMPLE 2: Dataset Reading data.read
##D ##            Multidimensional models for dichotomous data
##D #############################################################################
##D 
##D data(data.read)
##D dat <- data.read
##D I <- ncol(dat)    # number of items
##D 
##D #***
##D # Model 1: 3-dimensional 2PL model
##D 
##D # define Q-matrix
##D Qmatrix <- matrix(0,nrow=I,ncol=3)
##D Qmatrix[1:4,1] <- 1
##D Qmatrix[5:8,2] <- 1
##D Qmatrix[9:12,3] <- 1
##D 
##D # estimate model
##D mod1 <- sirt::smirt( dat, Qmatrix=Qmatrix, irtmodel="comp", est.a="2PL",
##D             qmcnodes=1000, maxiter=20)
##D summary(mod1)
##D 
##D #***
##D # Model 2: 3-dimensional Rasch model
##D mod2 <- sirt::smirt( dat, Qmatrix=Qmatrix, irtmodel="comp",
##D               qmcnodes=1000, maxiter=20)
##D summary(mod2)
##D 
##D #***
##D # Model 3: 3-dimensional 2PL model with uncorrelated dimensions
##D # fix entries in variance matrix
##D variance.fixed <- cbind( c(1,1,2), c(2,3,3), 0 )
##D # set the following covariances to zero: cov[1,2]=cov[1,3]=cov[2,3]=0
##D 
##D # estimate model
##D mod3 <- sirt::smirt( dat, Qmatrix=Qmatrix, irtmodel="comp", est.a="2PL",
##D              variance.fixed=variance.fixed, qmcnodes=1000, maxiter=20)
##D summary(mod3)
##D 
##D #***
##D # Model 4: Bifactor model with one general factor (g) and
##D #          uncorrelated specific factors
##D 
##D # define a new Q-matrix
##D Qmatrix1 <- cbind( 1, Qmatrix )
##D # uncorrelated factors
##D variance.fixed <- cbind( c(1,1,1,2,2,3), c(2,3,4,3,4,4), 0 )
##D # The first dimension refers to the general factors while the other
##D # dimensions refer to the specific factors.
##D # The specification means that:
##D # Cov[1,2]=Cov[1,3]=Cov[1,4]=Cov[2,3]=Cov[2,4]=Cov[3,4]=0
##D 
##D # estimate model
##D mod4 <- sirt::smirt( dat, Qmatrix=Qmatrix1, irtmodel="comp", est.a="2PL",
##D              variance.fixed=variance.fixed, qmcnodes=1000, maxiter=20)
##D summary(mod4)
##D 
##D #############################################################################
##D ## EXAMPLE 3: Partially compensatory model
##D #############################################################################
##D 
##D #**** simulate data
##D set.seed(7656)
##D I <- 10         # number of items
##D N <- 2000        # number of subjects
##D Q <- matrix( 0, 3*I,2)  # Q-matrix
##D Q[1:I,1] <- 1
##D Q[1:I + I,2] <- 1
##D Q[1:I + 2*I,1:2] <- 1
##D b <- matrix( stats::runif( 3*I *2, -2, 2 ), nrow=3*I, 2 )
##D b <- b*Q
##D b <- round( b, 2 )
##D mui <- rep(0,3*I)
##D mui[ seq(2*I+1, 3*I) ] <- 0.65
##D # generate data
##D dat <- matrix( NA, N, 3*I )
##D colnames(dat) <- paste0("It", 1:(3*I) )
##D # simulate item responses
##D library(mvtnorm)
##D theta <- mvtnorm::rmvnorm(N, mean=c(0,0), sigma=matrix( c( 1.2, .6,.6,1.6),2, 2 ) )
##D for (ii in 1:(3*I)){
##D     # define probability
##D     tmp1 <- exp( theta[,1] * Q[ii,1] - b[ii,1] +  theta[,2] * Q[ii,2] - b[ii,2] )
##D     # non-compensatory model
##D     nco1 <- ( 1 + exp( theta[,1] * Q[ii,1] - b[ii,1] ) ) *
##D                   ( 1 + exp( theta[,2] * Q[ii,2] - b[ii,2] ) )
##D     co1 <- ( 1 + tmp1 )
##D     p1 <- tmp1 / ( mui[ii] * nco1 + ( 1 - mui[ii] )*co1 )
##D     dat[,ii] <- 1 * ( stats::runif(N) < p1 )
##D }
##D 
##D #*** Model 1: Joint mu.i parameter for all items
##D est.mu.i <- rep(0,3*I)
##D est.mu.i[ seq(2*I+1,3*I)] <- 1
##D mod1 <- sirt::smirt( dat, Qmatrix=Q, irtmodel="partcomp", est.mu.i=est.mu.i)
##D summary(mod1)
##D 
##D #*** Model 2: Separate mu.i parameter for all items
##D est.mu.i[ seq(2*I+1,3*I)] <- 1:I
##D mod2 <- sirt::smirt( dat, Qmatrix=Q, irtmodel="partcomp", est.mu.i=est.mu.i)
##D summary(mod2)
## End(Not run)



