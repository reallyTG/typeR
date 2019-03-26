library(CDM)


### Name: gdm
### Title: General Diagnostic Model
### Aliases: gdm summary.gdm print.gdm plot.gdm
### Keywords: General diagnostic model summary print plot

### ** Examples

#############################################################################
# EXAMPLE 1: Fraction Dataset 1
#      Unidimensional Models for dichotomous data
#############################################################################

data(data.fraction1, package="CDM")
dat <- data.fraction1$data
theta.k <- seq( -6, 6, len=15 )   # discretized ability

#***
# Model 1: Rasch model (normal distribution)
mod1 <- CDM::gdm( dat, irtmodel="1PL", theta.k=theta.k, skillspace="normal",
               centered.latent=TRUE)
summary(mod1)
plot(mod1)

#***
# Model 2: Rasch model (log-linear smoothing)
# set the item difficulty of the 8th item to zero
b.constraint <- matrix( c(8,1,0), 1, 3 )
mod2 <- CDM::gdm( dat, irtmodel="1PL", theta.k=theta.k,
               skillspace="loglinear", b.constraint=b.constraint  )
summary(mod2)

#***
# Model 3: 2PL model
mod3 <- CDM::gdm( dat, irtmodel="2PL", theta.k=theta.k,
               skillspace="normal", standardized.latent=TRUE  )
summary(mod3)

## Not run: 
##D #***
##D # Model 4: include quadratic term in item response function
##D #   using the argument decrease.increments=TRUE leads to a more
##D #   stable estimate
##D thetaDes <- cbind( theta.k, theta.k^2 )
##D colnames(thetaDes) <- c( "F1", "F1q" )
##D mod4 <- CDM::gdm( dat, irtmodel="2PL", theta.k=theta.k,
##D           thetaDes=thetaDes, skillspace="normal",
##D           standardized.latent=TRUE, decrease.increments=TRUE)
##D summary(mod4)
##D 
##D #***
##D # Model 5: step function for ICC
##D #          two different probabilities theta < 0 and theta > 0
##D thetaDes <- matrix( 1*(theta.k>0), ncol=1 )
##D colnames(thetaDes) <- c( "Fgrm1" )
##D mod5 <- CDM::gdm( dat, irtmodel="2PL", theta.k=theta.k,
##D           thetaDes=thetaDes, skillspace="normal" )
##D summary(mod5)
##D 
##D #***
##D # Model 6: DINA model with din function
##D mod6 <- CDM::din( dat, q.matrix=matrix( 1, nrow=ncol(dat),ncol=1 ) )
##D summary(mod6)
##D 
##D #***
##D # Model 7: Estimating a version of the DINA model with gdm
##D theta.k <- c(-.5,.5)
##D mod7 <- CDM::gdm( dat, irtmodel="2PL", theta.k=theta.k, skillspace="loglinear" )
##D summary(mod7)
##D 
##D #############################################################################
##D # EXAMPLE 2: Cultural Activities - data.Students
##D #      Unidimensional Models for polytomous data
##D #############################################################################
##D 
##D data(data.Students, package="CDM")
##D dat <- data.Students
##D 
##D dat <- dat[, grep( "act", colnames(dat) ) ]
##D theta.k <- seq( -4, 4, len=11 )   # discretized ability
##D 
##D #***
##D # Model 1: Partial Credit Model (PCM)
##D mod1 <- CDM::gdm( dat, irtmodel="1PL", theta.k=theta.k, skillspace="normal",
##D            centered.latent=TRUE)
##D summary(mod1)
##D plot(mod1)
##D 
##D #***
##D # Model 1b: PCM using frequency patterns
##D mod1b <- CDM::gdm( dat, irtmodel="1PL", theta.k=theta.k, skillspace="normal",
##D            centered.latent=TRUE, use.freqpatt=TRUE)
##D summary(mod1b)
##D 
##D #***
##D # Model 2: PCM with two groups
##D mod2 <- CDM::gdm( dat, irtmodel="1PL", theta.k=theta.k,
##D             group=CDM::data.Students$urban + 1, skillspace="normal",
##D             centered.latent=TRUE)
##D summary(mod2)
##D 
##D #***
##D # Model 3: PCM with loglinear smoothing
##D b.constraint <- matrix( c(1,2,0), ncol=3 )
##D mod3 <- CDM::gdm( dat, irtmodel="1PL", theta.k=theta.k,
##D     skillspace="loglinear", b.constraint=b.constraint )
##D summary(mod3)
##D 
##D #***
##D # Model 4: Model with pre-specified item weights in Q-matrix
##D Qmatrix <- array( 1, dim=c(5,1,2) )
##D Qmatrix[,1,2] <- 2     # default is score 2 for category 2
##D # now change the scoring of category 2:
##D Qmatrix[c(2,4),1,1] <- .74
##D Qmatrix[c(2,4),1,2] <- 2.3
##D # for items 2 and 4 the score for category 1 is .74 and for category 2 it is 2.3
##D mod4 <- CDM::gdm( dat, irtmodel="1PL", theta.k=theta.k, Qmatrix=Qmatrix,
##D            skillspace="normal", centered.latent=TRUE)
##D summary(mod4)
##D 
##D #***
##D # Model 5: Generalized partial credit model
##D mod5 <- CDM::gdm( dat, irtmodel="2PL", theta.k=theta.k,
##D           skillspace="normal", standardized.latent=TRUE )
##D summary(mod5)
##D 
##D #***
##D # Model 6: Item-category slope estimation
##D mod6 <- CDM::gdm( dat, irtmodel="2PLcat", theta.k=theta.k,  skillspace="normal",
##D                  standardized.latent=TRUE, decrease.increments=TRUE)
##D summary(mod6)
##D 
##D #***
##D # Models 7: items with different number of categories
##D dat0 <- dat
##D dat0[ paste(dat0[,1])==2, 1 ] <- 1 # 1st item has only two categories
##D dat0[ paste(dat0[,3])==2, 3 ] <- 1 # 3rd item has only two categories
##D 
##D # Model 7a: PCM
##D mod7a <- CDM::gdm( dat0, irtmodel="1PL", theta.k=theta.k,  centered.latent=TRUE )
##D summary(mod7a)
##D 
##D # Model 7b: Item category slopes
##D mod7b <- CDM::gdm( dat0, irtmodel="2PLcat", theta.k=theta.k,
##D                  standardized.latent=TRUE, decrease.increments=TRUE )
##D summary(mod7b)
##D 
##D #############################################################################
##D # EXAMPLE 3: Fraction Dataset 2
##D #      Multidimensional Models for dichotomous data
##D #############################################################################
##D 
##D data(data.fraction2, package="CDM")
##D dat <- data.fraction2$data
##D Qmatrix <- data.fraction2$q.matrix3
##D 
##D #***
##D # Model 1: One-dimensional Rasch model
##D theta.k <- seq( -4, 4, len=11 )   # discretized ability
##D mod1 <- CDM::gdm( dat, irtmodel="1PL", theta.k=theta.k,  centered.latent=TRUE)
##D summary(mod1)
##D plot(mod1)
##D 
##D #***
##D # Model 2: One-dimensional 2PL model
##D mod2 <- CDM::gdm( dat, irtmodel="2PL", theta.k=theta.k, standardized.latent=TRUE)
##D summary(mod2)
##D plot(mod2)
##D 
##D #***
##D # Model 3: 3-dimensional Rasch Model (normal distribution)
##D mod3 <- CDM::gdm( dat, irtmodel="1PL", theta.k=theta.k, Qmatrix=Qmatrix,
##D             centered.latent=TRUE,  globconv=5*1E-3, conv=1E-4 )
##D summary(mod3)
##D 
##D #***
##D # Model 4: 3-dimensional Rasch model (loglinear smoothing)
##D # set some item parameters of items 4,1 and 2 to zero
##D b.constraint <- cbind( c(4,1,2), 1, 0 )
##D mod4 <- CDM::gdm( dat, irtmodel="1PL", theta.k=theta.k, Qmatrix=Qmatrix,
##D               b.constraint=b.constraint, skillspace="loglinear" )
##D summary(mod4)
##D 
##D #***
##D # Model 5: define a different theta grid for each dimension
##D theta.k <- list( "Dim1"=seq( -5, 5, len=11 ),
##D                  "Dim2"=seq(-5,5,len=8),
##D                  "Dim3"=seq( -3,3,len=6) )
##D mod5 <- CDM::gdm( dat, irtmodel="1PL", theta.k=theta.k, Qmatrix=Qmatrix,
##D                  b.constraint=b.constraint,  skillspace="loglinear")
##D summary(mod5)
##D 
##D #***
##D # Model 6: multdimensional 2PL model (normal distribution)
##D theta.k <- seq( -5, 5, len=13 )
##D a.constraint <- cbind( c(8,1,3), 1:3, 1, 1 ) # fix some slopes to 1
##D mod6 <- CDM::gdm( dat, irtmodel="2PL", theta.k=theta.k,  Qmatrix=Qmatrix,
##D             centered.latent=TRUE, a.constraint=a.constraint, decrease.increments=TRUE,
##D             skillspace="normal")
##D summary(mod6)
##D 
##D #***
##D # Model 7: multdimensional 2PL model (loglinear distribution)
##D a.constraint <- cbind( c(8,1,3), 1:3, 1, 1 )
##D b.constraint <- cbind( c(8,1,3), 1, 0 )
##D mod7 <- CDM::gdm( dat, irtmodel="2PL", theta.k=theta.k,  Qmatrix=Qmatrix,
##D                b.constraint=b.constraint,  a.constraint=a.constraint,
##D                decrease.increments=FALSE, skillspace="loglinear")
##D summary(mod7)
##D 
##D #############################################################################
##D # EXAMPLE 4: Unidimensional latent class 1PL IRT model
##D #############################################################################
##D 
##D # simulate data
##D set.seed(754)
##D I <- 20     # number of items
##D N <- 2000   # number of persons
##D theta <- c( -2, 0, 1, 2 )
##D theta <- rep( theta, c(N/4,N/4, 3*N/8, N/8)  )
##D b <- seq(-2,2,len=I)
##D library(sirt)   # use function sim.raschtype from sirt package
##D dat <- sirt::sim.raschtype( theta=theta, b=b )
##D 
##D theta.k <- seq(-1, 1, len=4)      # initial vector of theta
##D # estimate model
##D mod1 <- CDM::gdm( dat, theta.k=theta.k, skillspace="est", irtmodel="1PL",
##D             centerintercepts=TRUE, maxiter=200)
##D summary(mod1)
##D   ##   Estimated Skill Distribution
##D   ##         F1    pi.k
##D   ##   1 -1.988 0.24813
##D   ##   2 -0.055 0.23313
##D   ##   3  0.940 0.40059
##D   ##   4  2.000 0.11816
##D 
##D #############################################################################
##D # EXAMPLE 5: Multidimensional latent class IRT model
##D #############################################################################
##D 
##D # We simulate a two-dimensional IRT model in which theta vectors
##D # are observed at a fixed discrete grid (see below).
##D 
##D # simulate data
##D set.seed(754)
##D I <- 13     # number of items
##D N <- 2400   # number of persons
##D 
##D # simulate Dimension 1 at 4 discrete theta points
##D theta <- c( -2, 0, 1, 2 )
##D theta <- rep( theta, c(N/4,N/4, 3*N/8, N/8)  )
##D b <- seq(-2,2,len=I)
##D library(sirt)  # use simulation function from sirt package
##D dat1 <- sirt::sim.raschtype( theta=theta, b=b )
##D # simulate Dimension 2 at 4 discrete theta points
##D theta <- c( -3, 0, 1.5, 2 )
##D theta <- rep( theta, c(N/4,N/4, 3*N/8, N/8)  )
##D dat2 <- sirt::sim.raschtype( theta=theta, b=b )
##D colnames(dat2) <- gsub( "I", "U", colnames(dat2))
##D dat <- cbind( dat1, dat2 )
##D 
##D # define Q-matrix
##D Qmatrix <- matrix(0,2*I,2)
##D Qmatrix[ cbind( 1:(2*I), rep(1:2, each=I) ) ] <- 1
##D 
##D theta.k <- seq(-1, 1, len=4)      # initial matrix
##D theta.k <- cbind( theta.k, theta.k )
##D colnames(theta.k) <- c("Dim1","Dim2")
##D 
##D # estimate model
##D mod2 <- CDM::gdm( dat, theta.k=theta.k, skillspace="est", irtmodel="1PL",
##D               Qmatrix=Qmatrix, centerintercepts=TRUE)
##D summary(mod2)
##D   ##   Estimated Skill Distribution
##D   ##     theta.k.Dim1 theta.k.Dim2    pi.k
##D   ##   1       -2.022       -3.035 0.25010
##D   ##   2        0.016        0.053 0.24794
##D   ##   3        0.956        1.525 0.36401
##D   ##   4        1.958        1.919 0.13795
##D 
##D #############################################################################
##D # EXAMPLE 6: Large-scale dataset data.mg
##D #############################################################################
##D 
##D data(data.mg, package="CDM")
##D dat <- data.mg[, paste0("I", 1:11 ) ]
##D theta.k <- seq(-6,6,len=21)
##D 
##D #***
##D # Model 1: Generalized partial credit model with multiple groups
##D mod1 <- CDM::gdm( dat, irtmodel="2PL", theta.k=theta.k, group=CDM::data.mg$group,
##D               skillspace="normal", standardized.latent=TRUE)
##D summary(mod1)
## End(Not run)



