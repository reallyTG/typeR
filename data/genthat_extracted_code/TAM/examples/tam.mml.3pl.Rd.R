library(TAM)


### Name: tam.mml.3pl
### Title: 3PL Structured Item Response Model in 'TAM'
### Aliases: tam.mml.3pl summary.tam.mml.3pl print.tam.mml.3pl
### Keywords: 3PL model Structured item response model

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Dichotomous data | data.sim.rasch
##D #############################################################################
##D 
##D data(data.sim.rasch)
##D dat <- data.sim.rasch
##D # some control arguments
##D ctl.list <- list(maxiter=100) # increase the number of iterations in applications!
##D 
##D #*** Model 1: Rasch model, normal trait distribution
##D mod1 <- TAM::tam.mml.3pl(resp=dat, skillspace="normal", est.some.slopes=FALSE,
##D               control=ctl.list)
##D summary(mod1)
##D 
##D #*** Model 2: Rasch model, discrete trait distribution
##D #  choose theta grid
##D theta.k <- seq( -3, 3, len=7 )    # discrete theta grid distribution
##D # define symmetric trait distribution
##D delta.designmatrix <- matrix( 0, nrow=7, ncol=4 )
##D delta.designmatrix[4,1] <- 1
##D delta.designmatrix[c(3,5),2] <- 1
##D delta.designmatrix[c(2,6),3] <- 1
##D delta.designmatrix[c(1,7),4] <- 1
##D mod2 <- TAM::tam.mml.3pl(resp=dat, skillspace="discrete", est.some.slopes=FALSE,
##D            theta.k=theta.k, delta.designmatrix=delta.designmatrix, control=ctl.list)
##D summary(mod2)
##D 
##D #*** Model 3: 2PL model
##D mod3 <- TAM::tam.mml.3pl(resp=dat, skillspace="normal", gammaslope.des="2PL",
##D        control=ctl.list, est.variance=FALSE )
##D summary(mod3)
##D 
##D #*** Model 4: 3PL model
##D # estimate guessing parameters for items 3,7,9 and 12
##D I <- ncol(dat)
##D est.guess <- rep(0, I )
##D # set parameters 9 and 12 equal -> same integers
##D est.guess[ c(3,7,9,12) ] <- c( 1, 3, 2, 2 )
##D # starting values guessing parameter
##D guess <- .2*(est.guess > 0)
##D # estimate model
##D mod4 <- TAM::tam.mml.3pl(resp=dat, skillspace="normal", gammaslope.des="2PL",
##D         control=ctl.list, est.guess=est.guess, guess=guess, est.variance=FALSE)
##D summary(mod4)
##D 
##D #--- specification in tamaan
##D tammodel <- "
##D LAVAAN MODEL:
##D   F1=~ I1__I40
##D   F1 ~~ 1*F1
##D   I3 + I7 ?=g1
##D   I9 + I12 ?=g912 * g1
##D     "
##D mod4a <- TAM::tamaan( tammodel, resp=dat, control=list(maxiter=20))
##D summary(mod4a)
##D 
##D #*** Model 5: 3PL model, add some prior Beta distribution
##D guess.prior <- matrix( 0, nrow=I, ncol=2 )
##D guess.prior[ est.guess  > 0, 1] <- 5
##D guess.prior[ est.guess  > 0, 2] <- 17
##D mod5 <- TAM::tam.mml.3pl(resp=dat, skillspace="normal", gammaslope.des="2PL",
##D         control=ctl.list, est.guess=est.guess, guess=guess, guess.prior=guess.prior)
##D summary(mod5)
##D 
##D #--- specification in tamaan
##D tammodel <- "
##D LAVAAN MODEL:
##D   F1=~ I1__I40
##D   F1 ~~ 1*F1
##D   I3 + I7 ?=g1
##D   I9 + I12 ?=g912 * g1
##D MODEL PRIOR:
##D   g912 ~ Beta(5,17)
##D   I3_guess ~ Beta(5,17)
##D   I7_guess ~ Beta(5,17)
##D     "
##D mod5a <- TAM::tamaan( tammodel, resp=dat, control=list(maxiter=20))
##D 
##D #*** Model 6: 2PL model with design matrix for item slopes
##D I <- 40         # number of items
##D D <- 1       # dimensions
##D maxK <- 2    # maximum number of categories
##D Ngam <- 13   # number of different slope parameters
##D E <- array( 0, dim=c(I,maxK,D,Ngam) )
##D # joint slope parameters for items 1 to 10, 11 to 20, 21 to 30
##D E[ 1:10, 2, 1, 2 ] <- 1
##D E[ 11:20, 2, 1, 1 ] <- 1
##D E[ 21:30, 2, 1, 3 ] <- 1
##D for (ii in 31:40){   E[ii,2,1,ii - 27 ] <- 1 }
##D # estimate model
##D mod6 <- TAM::tam.mml.3pl(resp=dat, control=ctl.list,   E=E, est.variance=FALSE  )
##D summary(mod6)
##D 
##D #*** Model 6b: Truncated normal prior distribution for slope parameters
##D gammaslope.prior <- matrix( 0, nrow=Ngam, ncol=4 )
##D gammaslope.prior[,1] <- 2  # mean
##D gammaslope.prior[,2] <- 10  # standard deviation
##D gammaslope.prior[,3] <- -Inf # lower bound
##D gammaslope.prior[ 4:13,3] <- 1.2
##D gammaslope.prior[,4] <- Inf  # upper bound
##D # estimate model
##D mod6b <- TAM::tam.mml.3pl(resp=dat, E=E, est.variance=FALSE,
##D                 gammaslope.prior=gammaslope.prior, control=ctl.list )
##D summary(mod6b)
##D 
##D #*** Model 7: 2PL model with design matrix of slopes and slope constraints
##D Ngam <- dim(E)[4]   # number of gamma parameters
##D # define two constraint equations
##D gammaslope.constr.V <- matrix( 0, nrow=Ngam, ncol=2 )
##D gammaslope.constr.c <- rep(0,2)
##D # set sum of first two xlambda entries to 1.8
##D gammaslope.constr.V[1:2,1] <- 1
##D gammaslope.constr.c[1] <- 1.8
##D # set sum of entries 4, 5 and 6 to 3
##D gammaslope.constr.V[4:6,2] <- 1
##D gammaslope.constr.c[2] <- 3
##D mod7 <- TAM::tam.mml.3pl(resp=dat, control=ctl.list,  E=E,  est.variance=FALSE,
##D    gammaslope.constr.V=gammaslope.constr.V, gammaslope.constr.c=gammaslope.constr.c)
##D summary(mod7)
##D 
##D #**** Model 8: Located latent class Rasch model with estimated three skill points
##D 
##D # three classes of theta's are estimated
##D TP <- 3
##D theta.k <- diag(TP)
##D # because item difficulties are unrestricted, we define the sum of the estimated
##D # theta points equal to zero
##D Ngam <- TP  # estimate three gamma loading parameters which are discrete theta points
##D E <- array( 0, dim=c(I,2,TP,Ngam) )
##D E[,2,1,1] <- E[,2,2,2] <- E[,2,3,3] <- 1
##D gammaslope.constr.V <- matrix( 1, nrow=3, ncol=1 )
##D gammaslope.constr.c <- c(0)
##D # initial gamma values
##D gammaslope <- c( -2, 0, 2 )
##D # estimate model
##D mod8 <- TAM::tam.mml.3pl(resp=dat, control=ctl.list,  E=E,  skillspace="discrete",
##D      theta.k=theta.k, gammaslope=gammaslope, gammaslope.constr.V=gammaslope.constr.V,
##D      gammaslope.constr.c=gammaslope.constr.c )
##D summary(mod8)
##D 
##D #*** Model 9: Multidimensional multiple group model
##D N <- nrow(dat)
##D I <- ncol(dat)
##D group <- c( rep(1,N/4), rep(2,N/4), rep(3,N/2) )
##D Q <- matrix(0,nrow=I,ncol=2)
##D Q[ 1:(I/2), 1] <- Q[ seq(I/2+1,I), 2] <- 1
##D # estimate model
##D mod9 <- TAM::tam.mml.3pl(resp=dat, skillspace="normal", est.some.slopes=FALSE,
##D                group=group, Q=Q)
##D summary(mod9)
##D 
##D #############################################################################
##D # EXAMPLE 2: Polytomous data
##D #############################################################################
##D 
##D data( data.mg, package="CDM")
##D dat <- data.mg[1:1000, paste0("I",1:11)]
##D 
##D #*******************************************************
##D #*** Model 1: 1-dimensional 1PL estimation, normal skill distribution
##D mod1 <- TAM::tam.mml.3pl(resp=dat, skillspace="normal",
##D            gammaslope.des="2PL", est.some.slopes=FALSE,  est.variance=TRUE  )
##D summary(mod1)
##D 
##D #*******************************************************
##D #*** Model 2: 1-dimensional 2PL estimation, discrete skill distribution
##D # define skill space
##D theta.k <- matrix( seq(-5,5,len=21) )
##D # allow skew skill distribution
##D delta.designmatrix <- cbind( 1, theta.k, theta.k^2, theta.k^3 )
##D # fix 13th xsi item parameter to zero
##D xsi.fixed <- cbind( 13, 0 )
##D # fix 10th slope paremeter to one
##D gammaslope.fixed <- cbind( 10, 1 )
##D # estimate model
##D mod2 <- TAM::tam.mml.3pl(resp=dat, skillspace="discrete", theta.k=theta.k,
##D           delta.designmatrix=delta.designmatrix, gammaslope.des="2PL", xsi.fixed=xsi.fixed,
##D           gammaslope.fixed=gammaslope.fixed)
##D summary(mod2)
##D 
##D #*******************************************************
##D #*** Model 3: 2-dimensional 2PL estimation, normal skill distribution
##D 
##D # define loading matrix
##D Q <- matrix(0,11,2)
##D Q[1:6,1] <- 1   # items 1 to 6 load on dimension 1
##D Q[7:11,2] <- 1  # items 7 to 11 load on dimension 2
##D # estimate model
##D mod3 <- TAM::tam.mml.3pl(resp=dat, gammaslope.des="2PL", Q=Q )
##D summary(mod3)
##D 
##D #############################################################################
##D # EXAMPLE 3: Dichotomous data with guessing
##D #############################################################################
##D 
##D #*** simulate data
##D set.seed(9765)
##D N <- 4000   # number of persons
##D I <- 20     # number of items
##D b <- seq( -1.5, 1.5, len=I )
##D guess <- rep(0, I )
##D guess.items <- c(6,11,16)
##D guess[ guess.items ] <- .33
##D library(sirt)
##D dat <- sirt::sim.raschtype( stats::rnorm(N), b=b, fixed.c=guess )
##D 
##D #*******************************************************
##D #*** Model 1: Difficulty + guessing model, i.e. fix slopes to 1
##D est.guess <- rep(0,I)
##D est.guess[ guess.items ] <- seq(1, length(guess.items) )
##D # define prior distribution
##D guess.prior <- matrix( cbind( 5, 17 ), I, 2, byrow=TRUE )
##D guess.prior[ ! est.guess, ] <- 0
##D # estimate model
##D mod1 <- TAM::tam.mml.3pl(resp=dat, guess=guess, est.guess=est.guess,
##D            guess.prior=guess.prior, control=ctl.list,est.variance=TRUE,
##D            est.some.slopes=FALSE )
##D summary(mod1)
##D 
##D #*******************************************************
##D #*** Model 2: estimate a joint guessing parameter
##D est.guess <- rep(0,I)
##D est.guess[ guess.items ] <- 1
##D # estimate model
##D mod2 <- TAM::tam.mml.3pl(resp=dat, guess=guess, est.guess=est.guess,
##D             guess.prior=guess.prior, control=ctl.list,est.variance=TRUE,
##D             est.some.slopes=FALSE )
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 4: Latent class model with two classes
##D #      See slca Simulated Example 2 in the CDM package
##D #############################################################################
##D 
##D #*******************************************************
##D #*** simulate data
##D set.seed(9876)
##D I <- 7  # number of items
##D # simulate response probabilities
##D a1 <- round( stats::runif(I,0, .4 ),4)
##D a2 <- round( stats::runif(I, .6, 1 ),4)
##D N <- 1000   # sample size
##D # simulate data in two classes of proportions .3 and .7
##D N1 <- round(.3*N)
##D dat1 <- 1 * ( matrix(a1,N1,I,byrow=TRUE) > matrix( stats::runif( N1 * I), N1, I ) )
##D N2 <- round(.7*N)
##D dat2 <- 1 * ( matrix(a2,N2,I,byrow=TRUE) > matrix( stats::runif( N2 * I), N2, I ) )
##D dat <- rbind( dat1, dat2 )
##D colnames(dat) <- paste0("I", 1:I)
##D 
##D #*******************************************************
##D # estimation using tam.mml.3pl function
##D 
##D # define design matrices
##D TP <- 2     # two classes
##D theta.k <- diag(TP)     # there are theta dimensions -> two classes
##D # The idea is that latent classes refer to two different "dimensions".
##D # Items load on latent class indicators 1 and 2, see below.
##D E <- array(0, dim=c(I,2,2,2*I) )
##D items <- colnames(dat)
##D dimnames(E)[[4]] <- c(paste0( colnames(dat), "Class", 1),
##D           paste0( colnames(dat), "Class", 2) )
##D # items, categories, classes, parameters
##D # probabilities for correct solution
##D for (ii in 1:I){
##D     E[ ii, 2, 1, ii ] <- 1    # probabilities class 1
##D     E[ ii, 2, 2, ii+I ] <- 1  # probabilities class 2
##D                     }
##D 
##D # estimation command
##D mod1 <- TAM::tam.mml.3pl(resp=dat, E=E, control=list(maxit=20), skillspace="discrete",
##D           theta.k=theta.k, notA=TRUE)
##D summary(mod1)
##D # compare simulated and estimated data
##D cbind( mod1$rprobs[,2,1], a2 )  # Simulated class 2
##D cbind( mod1$rprobs[,2,2], a1 )  # Simulated class 1
##D 
##D #*******************************************************
##D #** specification with tamaan
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=LCA;
##D   NCLASSES(2);   # 2 classes
##D   NSTARTS(5,20); # 5 random starts with 20 iterations
##D LAVAAN MODEL:
##D   F=~ I1__I7
##D     "
##D mod1b <- TAM::tamaan( tammodel, resp=dat )
##D summary(mod1b)
##D # compare with mod1
##D logLik(mod1)
##D logLik(mod1b)
##D 
##D #############################################################################
##D # EXAMPLE 5: Located latent class model, Rasch model
##D #      See slca Simulated Example 4 in the CDM package
##D #############################################################################
##D 
##D #*** simulate data
##D set.seed(487)
##D I <- 15  # I items
##D b1 <- seq( -2, 2, len=I)      # item difficulties
##D N <- 2000    # number of persons
##D # simulate 4 theta classes
##D theta0 <- c( -2.5, -1, 0.3, 1.3 )  # skill classes
##D probs0 <- c( .1, .4, .2, .3 )      # skill class probabilities
##D TP <- length(theta0)
##D theta <- theta0[ rep(1:TP, round(probs0*N)  ) ]
##D library(sirt)
##D dat <- sirt::sim.raschtype( theta, b1 )
##D colnames(dat) <- paste0("I",1:I)
##D 
##D #*******************************************************
##D #*** Model 1: Located latent class model with 4 classes
##D maxK <- 2
##D Ngam <- TP
##D E <- array( 0, dim=c(I, maxK, TP,  Ngam ) )
##D dimnames(E)[[1]] <- colnames(dat)
##D dimnames(E)[[2]] <- paste0("Cat", 1:(maxK) )
##D dimnames(E)[[3]] <- paste0("Class", 1:TP)
##D dimnames(E)[[4]] <- paste0("theta", 1:TP)
##D # theta design
##D for (tt in 1:TP){   E[1:I, 2, tt,  tt] <- 1       }
##D theta.k <- diag(TP)
##D # set eighth item difficulty to zero
##D xsi.fixed <- cbind( 8, 0 )
##D # initial gamma parameter
##D gammaslope <- seq( -1.5, 1.5, len=TP)
##D # estimate model
##D mod1 <- TAM::tam.mml.3pl(resp=dat, E=E, xsi.fixed=xsi.fixed,
##D            control=list(maxiter=100), skillspace="discrete",
##D            theta.k=theta.k, gammaslope=gammaslope)
##D summary(mod1)
##D # compare estimated and simulated theta class locations
##D cbind( mod1$gammaslope, theta0 )
##D # compare estimated and simulated latent class proportions
##D cbind( mod1$pi.k, probs0 )
##D 
##D #----- specification using tamaan
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=LOCLCA;
##D   NCLASSES(4)
##D LAVAAN MODEL:
##D   F=~ I1__I15
##D   I8 | 0*t1
##D     "
##D mod1b <- TAM::tamaan( tammodel, resp=dat )
##D summary(mod1b)
##D 
##D #############################################################################
##D # EXAMPLE 6: DINA model with two skills
##D #      See slca Simulated Example 5 in the CDM package
##D #############################################################################
##D 
##D #*** simulate data
##D set.seed(487)
##D N <- 3000   # number of persons
##D # define Q-matrix
##D I <- 9  # 9 items
##D NS <- 2 # 2 skills
##D TP <- 4 # number of skill classes
##D Q <- scan(nlines=3, text=
##D   "1 0   1 0   1 0
##D    0 1   0 1   0 1
##D    1 1   1 1   1 1",
##D    )
##D Q <- matrix(Q, I, ncol=NS, byrow=TRUE)
##D # define skill distribution
##D alpha0 <- matrix( c(0,0,1,0,0,1,1,1), nrow=4,ncol=2,byrow=TRUE)
##D prob0 <- c( .2, .4, .1, .3 )
##D alpha <- alpha0[ rep( 1:TP, prob0*N),]
##D # define guessing and slipping parameters
##D guess <- round( stats::runif(I, 0, .4 ), 2 )
##D slip <- round( stats::runif(I, 0, .3 ), 2 )
##D # simulate data according to the DINA model
##D dat <- CDM::sim.din( q.matrix=Q, alpha=alpha, slip=slip, guess=guess )$dat
##D 
##D #*** Model 1: Estimate DINA model
##D # define E matrix which contains the anti-slipping parameters
##D maxK <- 2
##D Ngam <- I
##D E <- array( 0, dim=c(I, maxK, TP,  Ngam ) )
##D dimnames(E)[[1]] <- colnames(dat)
##D dimnames(E)[[2]] <- paste0("Cat", 1:(maxK) )
##D dimnames(E)[[3]] <- c("S00","S10","S01","S11")
##D dimnames(E)[[4]] <- paste0( "antislip", 1:I )
##D # define anti-slipping parameters in E
##D for (ii in 1:I){
##D         # define latent responses
##D         latresp <- 1*( alpha0 %*% Q[ii,]==sum(Q[ii,]) )[,1]
##D         # model slipping parameters
##D         E[ii, 2, latresp==1, ii ] <- 1
##D                  }
##D # skill space definition
##D theta.k <- diag(TP)
##D gammaslope <- rep( qlogis( .8 ), I )
##D 
##D # estimate model
##D mod1 <- TAM::tam.mml.3pl(resp=dat, E=E, control=list(maxiter=100), skillspace="discrete",
##D           theta.k=theta.k, gammaslope=gammaslope)
##D summary(mod1)
##D # compare estimated and simulated latent class proportions
##D cbind( mod1$pi.k, probs0 )
##D # compare estimated and simulated guessing parameters
##D cbind( mod1$rprobs[,2,1], guess )
##D # compare estimated and simulated slipping parameters
##D cbind( 1 - mod1$rprobs[,2,4], slip )
##D 
##D #############################################################################
##D # EXAMPLE 7: Mixed Rasch model with two classes
##D #      See slca Simulated Example 3 in the CDM package
##D #############################################################################
##D 
##D #*** simulate data
##D set.seed(987)
##D library(sirt)
##D # simulate two latent classes of Rasch populations
##D I <- 15  # 6 items
##D b1 <- seq( -1.5, 1.5, len=I)      # difficulties latent class 1
##D b2 <- b1    # difficulties latent class 2
##D b2[ c(4,7, 9, 11, 12, 13) ] <- c(1, -.5, -.5, .33, .33, -.66 )
##D b2 <- b2 - mean(b2)
##D N <- 3000    # number of persons
##D wgt <- .25       # class probability for class 1
##D # class 1
##D dat1 <- sirt::sim.raschtype( stats::rnorm( wgt*N ), - b1 )
##D # class 2
##D dat2 <- sirt::sim.raschtype( stats::rnorm( (1-wgt)*N, mean=1, sd=1.7), - b2 )
##D dat <- rbind( dat1, dat2 )
##D 
##D # The idea is that each grid point class x theta is defined as new
##D # dimension. If we approximate the trait distribution by 7 theta points
##D # and are interested in estimating 2 latent classes, then we need
##D # 7*2=14 dimensions.
##D 
##D #*** Model 1: Rasch model
##D # theta grid
##D theta.k1 <- seq( -5, 5, len=7 )
##D TT <- length(theta.k1)
##D #-- define theta design matrix
##D theta.k <- diag(TT)
##D #-- delta designmatrix
##D delta.designmatrix <- matrix( 0, TT, ncol=3 )
##D delta.designmatrix[, 1] <- 1
##D delta.designmatrix[, 2:3] <- cbind( theta.k1, theta.k1^2 )
##D 
##D #-- define loading matrix E
##D E <- array( 0, dim=c(I,2,TT,I + 1) )  # last parameter is constant 1
##D for (ii in 1:I){
##D     E[ ii, 2, 1:TT, ii ] <- -1   # '-b' in '1*theta - b'
##D     E[ ii, 2, 1:TT, I+1] <- theta.k1  # '1*theta' in '1*theta - b'
##D                 }
##D # initial gammaslope parameters
##D par1 <- stats::qlogis( colMeans( dat ) )
##D gammaslope <- c( par1, 1 )
##D # sum constraint of zero on item difficulties
##D gammaslope.constr.V <- matrix( 0, I+1, 1 )
##D gammaslope.constr.V[ 1:I, 1] <- 1  # Class 1
##D gammaslope.constr.c <- c(0)
##D # fixed gammaslope parameter
##D gammaslope.fixed <- cbind( I+1, 1 )
##D # estimate model
##D mod1 <- TAM::tam.mml.3pl(resp=dat1, E=E, skillspace="discrete",
##D            theta.k=theta.k, delta.designmatrix=delta.designmatrix,
##D            gammaslope=gammaslope, gammaslope.constr.V=gammaslope.constr.V,
##D            gammaslope.constr.c=gammaslope.constr.c, gammaslope.fixed=gammaslope.fixed,
##D            notA=TRUE, est.variance=FALSE)
##D summary(mod1)
##D 
##D #*** Model 2: Mixed Rasch model with two latent classes
##D # theta grid
##D theta.k1 <- seq( -4, 4, len=7 )
##D TT <- length(theta.k1)
##D #-- define theta design matrix
##D theta.k <- diag(2*TT)   # 2*7=14 classes
##D #-- delta designmatrix
##D delta.designmatrix <- matrix( 0, 2*TT, ncol=6 )
##D # Class 1
##D delta.designmatrix[1:TT, 1] <- 1
##D delta.designmatrix[1:TT, 2:3] <- cbind( theta.k1, theta.k1^2 )
##D # Class 2
##D delta.designmatrix[TT+1:TT, 4] <- 1
##D delta.designmatrix[TT+1:TT, 5:6] <- cbind( theta.k1, theta.k1^2 )
##D 
##D #-- define loading matrix E
##D E <- array( 0, dim=c(I,2,2*TT,2*I + 1) )  # last parameter is constant 1
##D dimnames(E)[[1]] <- colnames(dat)
##D dimnames(E)[[2]] <- c("Cat0","Cat1")
##D dimnames(E)[[3]] <- c( paste0("Class1_theta", 1:TT), paste0("Class2_theta", 1:TT) )
##D dimnames(E)[[4]] <- c( paste0("b_Class1_", colnames(dat)),
##D        paste0("b_Class2_", colnames(dat)), "One")
##D for (ii in 1:I){
##D   # Class 1 item parameters
##D     E[ ii, 2, 1:TT, ii ] <- -1   # '-b' in '1*theta - b'
##D     E[ ii, 2, 1:TT, 2*I+1] <- theta.k1  # '1*theta' in '1*theta - b'
##D   # Class 2 item parameters
##D     E[ ii, 2, TT + 1:TT, I + ii ] <- -1
##D     E[ ii, 2, TT + 1:TT, 2*I+1] <- theta.k1
##D                 }
##D # initial gammaslope parameters
##D par1 <- qlogis( colMeans( dat ) )
##D gammaslope <- c( par1, par1 + stats::runif(I, -2,2 ), 1 )
##D # sum constraint of zero on item difficulties within a class
##D gammaslope.center.index <- c( rep( 1, I ), rep(2,I), 0 )
##D gammaslope.center.value <- c(0,0)
##D 
##D # estimate model
##D mod1 <- TAM::tam.mml.3pl(resp=dat, E=E, skillspace="discrete",
##D             theta.k=theta.k, delta.designmatrix=delta.designmatrix,
##D             gammaslope=gammaslope, gammaslope.center.index=gammaslope.center.index,
##D             gammaslope.center.value=gammaslope.center.value, gammaslope.fixed=gammaslope.fixed,
##D             notA=TRUE)
##D summary(mod1)
##D # latent class proportions
##D stats::aggregate( mod1$pi.k, list( rep(1:2, each=TT)), sum )
##D # compare simulated and estimated item parameters
##D cbind( b1, b2, - mod1$gammaslope[1:I], - mod1$gammaslope[I + 1:I ] )
##D 
##D #--- specification in tamaan
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=MIXTURE;
##D   NCLASSES(2)
##D   NSTARTS(5,30)
##D LAVAAN MODEL:
##D   F=~ I0001__I0015
##D ITEM TYPE:
##D   ALL(Rasch);
##D     "
##D mod1b <- TAM::tamaan( tammodel, resp=dat )
##D summary(mod1b)
##D 
##D #############################################################################
##D # EXAMPLE 8: 2PL mixture distribution model
##D #############################################################################
##D 
##D #*** simulate data
##D set.seed(9187)
##D library(sirt)
##D # simulate two latent classes of Rasch populations
##D I <- 20
##D b1 <- seq( -1.5, 1.5, len=I)      # difficulties latent class 1
##D b2 <- b1    # difficulties latent class 2
##D b2[ c(4,7, 9, 11, 12, 13, 16, 18) ] <- c(1, -.5, -.5, .33, .33, -.66, -1, .3)
##D # b2 <- scale( b2, scale=FALSE)
##D b2 <- b2 - mean(b2)
##D N <- 4000       # number of persons
##D wgt <- .75       # class probability for class 1
##D # item slopes
##D a1 <- rep( 1, I )  # first class
##D a2 <- rep( c(.5,1.5), I/2 )
##D 
##D # class 1
##D dat1 <- sirt::sim.raschtype( stats::rnorm( wgt*N ), - b1, fixed.a=a1)
##D # class 2
##D dat2 <- sirt::sim.raschtype( stats::rnorm( (1-wgt)*N, mean=1, sd=1.4), - b2, fixed.a=a2)
##D dat <- rbind( dat1, dat2 )
##D 
##D #*** Model 1: Mixed 2PL model with two latent classes
##D 
##D theta.k1 <- seq( -4, 4, len=7 )
##D TT <- length(theta.k1)
##D #-- define theta design matrix
##D theta.k <- diag(2*TT)   # 2*7=14 classes
##D #-- delta designmatrix
##D delta.designmatrix <- matrix( 0, 2*TT, ncol=6 )
##D # Class 1
##D delta.designmatrix[1:TT, 1] <- 1
##D delta.designmatrix[1:TT, 2:3] <- cbind( theta.k1, theta.k1^2 )
##D # Class 2
##D delta.designmatrix[TT+1:TT, 4] <- 1
##D delta.designmatrix[TT+1:TT, 5:6] <- cbind( theta.k1, theta.k1^2 )
##D 
##D #-- define loading matrix E
##D E <- array( 0, dim=c(I,2,2*TT,4*I ) )
##D dimnames(E)[[1]] <- colnames(dat)
##D dimnames(E)[[2]] <- c("Cat0","Cat1")
##D dimnames(E)[[3]] <- c( paste0("Class1_theta", 1:TT), paste0("Class2_theta", 1:TT) )
##D dimnames(E)[[4]] <- c( paste0("b_Class1_", colnames(dat)),
##D                        paste0("a_Class1_", colnames(dat)),
##D                        paste0("b_Class2_", colnames(dat)),
##D                        paste0("a_Class2_", colnames(dat)) )
##D 
##D for (ii in 1:I){
##D   # Class 1 item parameters
##D     E[ ii, 2, 1:TT, ii ] <- -1           # '-b' in 'a*theta - b'
##D     E[ ii, 2, 1:TT, I + ii] <- theta.k1  # 'a*theta' in 'a*theta - b'
##D   # Class 2 item parameters
##D     E[ ii, 2, TT + 1:TT, 2*I + ii ] <- -1
##D     E[ ii, 2, TT + 1:TT, 3*I + ii ] <- theta.k1
##D }
##D 
##D # initial gammaslope parameters
##D par1 <- scale( - stats::qlogis( colMeans( dat ) ), scale=FALSE )
##D gammaslope <- c( par1, rep(1,I),  scale( par1 + runif(I, - 1.4, 1.4 ),
##D         scale=FALSE), stats::runif( I,.6,1.4) )
##D 
##D # constraint matrix
##D gammaslope.constr.V <- matrix( 0, 4*I, 4 )
##D # sum of item intercepts equals zero
##D gammaslope.constr.V[ 1:I, 1] <- 1        # Class 1 (b)
##D gammaslope.constr.V[ 2*I + 1:I, 2] <- 1  # Class 2 (b)
##D # sum of item slopes equals number of items -> mean slope of 1
##D gammaslope.constr.V[ I + 1:I, 3] <- 1    # Class 1 (a)
##D gammaslope.constr.V[ 3*I + 1:I, 4] <- 1  # Class 2 (a)
##D gammaslope.constr.c <- c(0,0,I,I)
##D 
##D # estimate model
##D mod1 <- TAM::tam.mml.3pl(resp=dat, E=E, control=list(maxiter=80), skillspace="discrete",
##D       theta.k=theta.k, delta.designmatrix=delta.designmatrix,
##D       gammaslope=gammaslope, gammaslope.constr.V=gammaslope.constr.V,
##D       gammaslope.constr.c=gammaslope.constr.c,  gammaslope.fixed=gammaslope.fixed,
##D       notA=TRUE)
##D 
##D # estimated item parameters
##D mod1$gammaslope
##D # summary
##D summary(mod1)
##D # latent class proportions
##D round( stats::aggregate( mod1$pi.k, list( rep(1:2, each=TT)), sum ), 3 )
##D # compare simulated and estimated item intercepts
##D int <- cbind( b1*a1, b2 * a2, - mod1$gammaslope[1:I], - mod1$gammaslope[2*I + 1:I ] )
##D round( int, 3 )
##D # simulated and estimated item slopes
##D slo <- cbind( a1, a2,  mod1$gammaslope[I+1:I], mod1$gammaslope[3*I + 1:I ] )
##D round(slo,3)
##D 
##D #--- specification in tamaan
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=MIXTURE;
##D   NCLASSES(2)
##D   NSTARTS(10,25)
##D LAVAAN MODEL:
##D   F=~ I0001__I0020
##D     "
##D mod1t <- TAM::tamaan( tammodel, resp=dat )
##D summary(mod1t)
##D 
##D #############################################################################
##D # EXAMPLE 9: Toy example: Exact representation of an item by a factor
##D #############################################################################
##D 
##D data(data.gpcm)
##D dat <- data.gpcm[,1,drop=FALSE ]   # choose first item
##D # some descriptives
##D ( t1 <- table(dat) )
##D 
##D # The idea is that we define an IRT model with one latent variable
##D # which extactly corresponds to the manifest item.
##D 
##D I <- 1    # 1 item
##D K <- 4    # 4 categories
##D TP <- 4   # 4 discrete theta points
##D 
##D # define skill space
##D theta.k <- diag(TP)
##D # define loading matrix E
##D E <- array( -99, dim=c(I,K,TP,1 ) )
##D for (vv in 1:K){
##D     E[ 1, vv, vv, 1 ] <- 9
##D                 }
##D # estimate model
##D mod1 <- TAM::tam.mml.3pl(resp=dat, E=E, skillspace="discrete",
##D          theta.k=theta.k,  notA=TRUE)
##D summary(mod1)
##D # -> the latent distribution corresponds to the manifest distribution, because ...
##D round( mod1$pi.k, 3 )
##D round( t1 / sum(t1), 3 )
##D 
##D #############################################################################
##D # EXAMPLE 10: Some fixed item loadings
##D #############################################################################
##D 
##D data(data.Students,package="CDM")
##D dat <- data.Students
##D # select variables
##D vars <- scan( nlines=1, what="character")
##D     act1 act2 act3 act4 act5 sc1 sc2 sc3 sc4
##D dat <- data.Students[, vars  ]
##D 
##D # define loading matrix: two-dimensional model
##D Q <- matrix( 0, nrow=9, ncol=2 )
##D Q[1:5,1] <- 1
##D Q[6:9,2] <- 1
##D # define some fixed item loadings
##D Q.fixed <- NA*Q
##D Q.fixed[ c(1,4), 1] <- .5
##D Q.fixed[ 6:7, 2 ] <- 1
##D 
##D # estimate model
##D mod3 <- TAM::tam.mml.3pl( resp=dat, gammaslope.des="2PL", Q=Q, Q.fixed=Q.fixed,
##D             control=list( maxiter=10, nodes=seq(-4,4,len=10) )  )
##D summary(mod3)
##D 
##D #############################################################################
##D # EXAMPLE 11: Mixed response formats - Multiple choice and partial credit items
##D #############################################################################
##D 
##D data(data.timssAusTwn.scored)
##D dat <- data.timssAusTwn.scored
##D 
##D # select columns with item responses
##D dat <- dat[, grep("M0", colnames(dat) ) ]
##D I <- ncol(dat)   # number of items
##D 
##D # The idea is to start with partial credit modelling
##D # and then to include the guessing parameters
##D 
##D #*** Model 0: Partial Credit Model
##D mod0 <- TAM::tam.mml(dat)
##D summary(mod0)
##D 
##D #*** Model 1 and Model 2: include guessing parameters
##D 
##D # multiple choice items
##D guess_items <- which( apply( dat, 2, max, na.rm=TRUE )==1 )
##D # define guessing parameters
##D guess0 <- rep(0,I)
##D guess0[ guess_items ] <- .25  # set guessing probability to .25
##D 
##D # define which guessing parameters should be estimated
##D est.guess1 <- rep(0,I)  # all parameters are fixed
##D est.guess2 <- 1 * ( guess0==.25 )  # joint guessing parameter
##D 
##D # use design matrix from partial credit model
##D A0 <- mod0$A
##D 
##D #--- Model 1: fixed guessing parameters of .25 and item slopes of 1
##D mod1 <- TAM::tam.mml.3pl( dat, guess=guess0, est.guess=est.guess1,
##D             A=A0, est.some.slopes=FALSE, control=list(maxiter=50) )
##D summary(mod1)
##D 
##D #--- Model 2: estimate joint guessing parameters and item slopes of 1
##D mod2 <- TAM::tam.mml.3pl( dat, guess=guess0, est.guess=est.guess2,
##D             A=A0, est.some.slopes=FALSE, control=list(maxiter=50) )
##D summary(mod2)
##D 
##D # model comparison
##D IRT.compareModels(mod0,mod1,mod2)
## End(Not run)



