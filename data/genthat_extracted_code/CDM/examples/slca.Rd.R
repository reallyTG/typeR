library(CDM)


### Name: slca
### Title: Structured Latent Class Analysis (SLCA)
### Aliases: slca summary.slca print.slca plot.slca
### Keywords: Structured latent class analysis (SLCA) summary plot

### ** Examples

#############################################################################
# EXAMPLE 1: data.Students | (Generalized) Partial Credit Model
#############################################################################

data(data.Students, package="CDM")

dat <- data.Students[, c("mj1","mj2","mj3","mj4","sc1", "sc2") ]
# define discretized ability
theta.k <- seq( -6, 6, len=21 )

#*** Model 1: Partial credit model

# define design matrix for lambda
I <- ncol(dat)
maxK <- 4
TP <- length(theta.k)
NXlam <- I*(maxK-1) + 1       # number of estimated parameters
       # last parameter is joint slope parameter
Xdes <- array( 0, dim=c(I, maxK, TP,  NXlam ) )
# Item1Cat1, ..., Item1Cat3, Item2Cat1, ...,
dimnames(Xdes)[[1]] <- colnames(dat)
dimnames(Xdes)[[2]] <- paste0("Cat", 1:(maxK) )
dimnames(Xdes)[[3]] <- paste0("Class", 1:TP )
v2 <- unlist( sapply( 1:I, FUN=function(ii){ # ii
    paste0( paste0( colnames(dat)[ii], "_b"  ), "Cat", 1:(maxK-1) )
                }, simplify=FALSE) )
dimnames(Xdes)[[4]] <- c( v2, "a" )
# define theta design and item discriminations
for (ii in 1:I){
    for (hh in 1:(maxK-1) ){
        Xdes[ii, hh + 1,, NXlam ] <- hh * theta.k
    }
}
# item intercepts
for (ii in 1:I){
    for (hh in 1:(maxK-1) ){
        # ii <- 1  # Item    # hh <- 1  # category
        Xdes[ii,hh+1,, ( ii - 1)*(maxK-1) + hh] <- 1
    }
}
#****
# skill space designmatrix
TP <- length(theta.k)
w1 <- stats::dnorm(theta.k)
w1 <- w1 / sum(w1)
delta.designmatrix <- matrix( 1, nrow=TP, ncol=1 )
delta.designmatrix[,1] <- log(w1)

# initial lambda parameters
Xlambda.init <- c( stats::rnorm( dim(Xdes)[[4]] - 1 ), 1 )
# fixed delta parameter
delta.fixed <- cbind( 1, 1,1 )

# estimate model
mod1 <- CDM::slca( dat, Xdes=Xdes, delta.designmatrix=delta.designmatrix,
            Xlambda.init=Xlambda.init, delta.fixed=delta.fixed )
summary(mod1)
plot(mod1, cex.names=.7 )

## Not run: 
##D #*** Model 2: Partial credit model with some parameter constraints
##D # fixed lambda parameters
##D Xlambda.fixed <- cbind( c(1,19), c(3.2,1.52 ) )
##D # 1st parameter=3.2
##D # 19th parameter=1.52 (joint item slope)
##D mod2 <- CDM::slca( dat, Xdes=Xdes, delta.designmatrix=delta.designmatrix,
##D             delta.init=delta.init, Xlambda.init=Xlambda.init, delta.fixed=delta.fixed,
##D             Xlambda.fixed=Xlambda.fixed, maxiter=70 )
##D 
##D #*** Model 3: Partial credit model with non-normal distribution
##D Xlambda.fixed <- cbind(  c(1,19), c(3.2,1) ) # fix item slope to one
##D delta.designmatrix <- cbind( 1, theta.k, theta.k^2, theta.k^3 )
##D mod3 <- CDM::slca( dat, Xdes=Xdes,  delta.designmatrix=delta.designmatrix,
##D             Xlambda.fixed=Xlambda.fixed,  maxiter=200 )
##D summary(mod3)
##D 
##D # non-normal distribution with convergence regularizing factor oldfac
##D mod3a <- CDM::slca( dat, Xdes=Xdes,  delta.designmatrix=delta.designmatrix,
##D             Xlambda.fixed=Xlambda.fixed, maxiter=500, oldfac=.95 )
##D summary(mod3a)
##D 
##D #*** Model 4: Generalized Partial Credit Model
##D 
##D # estimate generalized partial credit model without restrictions on trait
##D # distribution and item parameters to ensure better convergence behavior
##D # Note that two parameters are not identifiable and information criteria
##D # have to be adapted.
##D 
##D #---
##D # define design matrix for lambda
##D I <- ncol(dat)
##D maxK <- 4
##D TP <- length(theta.k)
##D NXlam <- I*(maxK-1) + I       # number of estimated parameters
##D Xdes <- array( 0, dim=c(I, maxK, TP,  NXlam ) )
##D # Item1Cat1, ..., Item1Cat3, Item2Cat1, ...,
##D dimnames(Xdes)[[1]] <- colnames(dat)
##D dimnames(Xdes)[[2]] <- paste0("Cat", 1:(maxK) )
##D dimnames(Xdes)[[3]] <- paste0("Class", 1:TP )
##D v2 <- unlist( sapply( 1:I, FUN=function(ii){ # ii
##D     paste0( paste0( colnames(dat)[ii], "_b"  ), "Cat", 1:(maxK-1) )
##D                 }, simplify=FALSE) )
##D dimnames(Xdes)[[4]] <- c( v2, paste0( colnames(dat),"_a") )
##D dimnames(Xdes)
##D # define theta design and item discriminations
##D for (ii in 1:I){
##D     for (hh in 1:(maxK-1) ){
##D         Xdes[ii, hh + 1,, I*(maxK-1) + ii ] <- hh * theta.k
##D     }
##D }
##D # item intercepts
##D for (ii in 1:I){
##D     for (hh in 1:(maxK-1) ){
##D         Xdes[ii,hh+1,, ( ii - 1)*(maxK-1) + hh] <- 1
##D     }
##D }
##D #****
##D # skill space designmatrix
##D delta.designmatrix <- cbind( 1, theta.k,theta.k^2 )
##D # initial lambda parameters from partial credit model
##D Xlambda.init <- mod1$Xlambda
##D Xlambda.init <- c( mod1$Xlambda[ - length(Xlambda.init) ],
##D          rep( Xlambda.init[ length(Xlambda.init)  ],I) )
##D 
##D # estimate model
##D mod4 <- CDM::slca( dat, Xdes=Xdes, Xlambda.init=Xlambda.init,
##D              delta.designmatrix=delta.designmatrix, decrease.increments=TRUE,
##D              maxiter=300 )
##D 
##D #############################################################################
##D # EXAMPLE 2: Latent class model with two classes
##D #############################################################################
##D 
##D set.seed(9876)
##D I <- 7    # number of items
##D # simulate response probabilities
##D a1 <- stats::runif(I, 0, .4 )
##D a2 <- stats::runif(I, .6, 1 )
##D N <- 1000    # sample size
##D # simulate data in two classes of proportions .3 and .7
##D N1 <- round(.3*N)
##D dat1 <- 1 * ( matrix(a1,N1,I,byrow=TRUE) > matrix( stats::runif( N1 * I), N1, I ) )
##D N2 <- round(.7*N)
##D dat2 <- 1 * ( matrix(a2,N2,I,byrow=TRUE) > matrix( stats::runif( N2 * I), N2, I ) )
##D dat <- rbind( dat1, dat2 )
##D colnames(dat) <- paste0("I", 1:I)
##D 
##D # define design matrices
##D TP <- 2     # two classes
##D # The idea is that latent classes refer to two different "dimensions".
##D # Items load on latent class indicators 1 and 2, see below.
##D Xdes <- array(0, dim=c(I,2,2,2*I) )
##D items <- colnames(dat)
##D dimnames(Xdes)[[4]] <- c(paste0( colnames(dat), "Class", 1),
##D           paste0( colnames(dat), "Class", 2) )
##D     # items, categories, classes, parameters
##D # probabilities for correct solution
##D for (ii in 1:I){
##D     Xdes[ ii, 2, 1, ii ] <- 1    # probabilities class 1
##D     Xdes[ ii, 2, 2, ii+I ] <- 1  # probabilities class 2
##D }
##D # estimate model
##D mod1 <- CDM::slca( dat, Xdes=Xdes )
##D summary(mod1)
##D 
##D #############################################################################
##D # EXAMPLE 3: Mixed Rasch model with two classes
##D #############################################################################
##D 
##D set.seed(987)
##D library(sirt)
##D # simulate two latent classes of Rasch populations
##D I <- 15  # 6 items
##D b1 <- seq( -1.5, 1.5, len=I)      # difficulties latent class 1
##D b2 <- b1    # difficulties latent class 2
##D b2[ c(4,7, 9, 11, 12, 13) ] <- c(1, -.5, -.5, .33, .33, -.66 )
##D N <- 3000    # number of persons
##D wgt <- .25       # class probability for class 1
##D # class 1
##D dat1 <- sirt::sim.raschtype( stats::rnorm( wgt*N ), b1 )
##D # class 2
##D dat2 <- sirt::sim.raschtype( stats::rnorm( (1-wgt)*N, mean=1, sd=1.7), b2 )
##D dat <- rbind( dat1, dat2 )
##D # theta grid
##D theta.k <- seq( -5, 5, len=9 )
##D TP <- length(theta.k)
##D 
##D #*** Model 1: Rasch model with normal distribution
##D maxK <- 2
##D NXlam <- I +1
##D Xdes <- array( 0, dim=c(I, maxK, TP,  NXlam ) )
##D dimnames(Xdes)[[1]] <- colnames(dat)
##D dimnames(Xdes)[[2]] <- paste0("Cat", 1:(maxK) )
##D dimnames(Xdes)[[4]] <- c( paste0( "b_", colnames(dat)[1:I] ), "a" )
##D # define item difficulties
##D for (ii in 1:I){
##D     Xdes[ii, 2,, ii ] <- -1
##D }
##D # theta design
##D for (tt in 1:TP){
##D     Xdes[1:I, 2, tt, I + 1] <- theta.k[tt]
##D }
##D 
##D # skill space definition
##D delta.designmatrix <- cbind( 1, theta.k^2 )
##D delta.fixed <- NULL
##D Xlambda.init <- c( stats::runif( I, -.8, .8 ), 1 )
##D Xlambda.fixed <- cbind( I+1, 1 )
##D # estimate model
##D mod1 <- CDM::slca( dat, Xdes=Xdes, delta.designmatrix=delta.designmatrix,
##D             delta.fixed=delta.fixed, Xlambda.fixed=Xlambda.fixed,
##D             Xlambda.init=Xlambda.init, decrease.increments=TRUE, maxiter=200 )
##D summary(mod1)
##D 
##D #*** Model 1b: Constraint the sum of item difficulties to zero
##D 
##D # change skill space definition
##D delta.designmatrix <- cbind( 1, theta.k, theta.k^2 )
##D delta.fixed <- NULL
##D # constrain sum of difficulties Xlambda parameters to zero
##D Xlambda.constr.V <- matrix( 1, nrow=I+1, ncol=1 )
##D Xlambda.constr.V[I+1,1] <- 0
##D Xlambda.constr.c <- c(0)
##D # estimate model
##D mod1b <- CDM::slca( dat, Xdes=Xdes, delta.designmatrix=delta.designmatrix,
##D             Xlambda.fixed=Xlambda.fixed, Xlambda.constr.V=Xlambda.constr.V,
##D             Xlambda.constr.c=Xlambda.constr.c  )
##D summary(mod1b)
##D 
##D #*** Model 2: Mixed Rasch model with two latent classes
##D NXlam <- 2*I +2
##D Xdes <- array( 0, dim=c(I, maxK, 2*TP,  NXlam ) )
##D dimnames(Xdes)[[1]] <- colnames(dat)
##D dimnames(Xdes)[[2]] <- paste0("Cat", 1:(maxK) )
##D dimnames(Xdes)[[4]] <- c( paste0( "bClass1_", colnames(dat)[1:I] ),
##D         paste0( "bClass2_", colnames(dat)[1:I] ), "aClass1", "aClass2" )
##D # define item difficulties
##D for (ii in 1:I){
##D     Xdes[ii, 2, 1:TP, ii ] <- -1  # first class
##D     Xdes[ii, 2, TP + 1:TP, I+ii ] <- -1  # second class
##D }
##D # theta design
##D for (tt in 1:TP){
##D     Xdes[1:I, 2, tt, 2*I+1 ] <- theta.k[tt]
##D     Xdes[1:I, 2, TP+tt, 2*I+2 ] <- theta.k[tt]
##D }
##D # skill space definition
##D delta.designmatrix <- matrix( 0, nrow=2*TP, ncol=4 )
##D delta.designmatrix[1:TP,1] <- 1
##D delta.designmatrix[1:TP,2] <- theta.k^2
##D delta.designmatrix[TP + 1:TP,3] <- 1
##D delta.designmatrix[TP+ 1:TP,4] <- theta.k^2
##D b1 <- stats::qnorm( colMeans(dat) )
##D Xlambda.init <- c( stats::runif( 2*I, -1.8, 1.8 ), 1,1 )
##D Xlambda.fixed <- cbind( c(2*I+1, 2*I+2), 1 )
##D # estimate model
##D mod2 <- CDM::slca( dat, Xdes=Xdes,  delta.designmatrix=delta.designmatrix,
##D             Xlambda.fixed=Xlambda.fixed, decrease.increments=TRUE,
##D             Xlambda.init=Xlambda.init, maxiter=1000 )
##D summary(mod2)
##D summary(mod1)
##D # latent class proportions
##D stats::aggregate( mod2$pi.k, list( rep(1:2, each=TP)), sum )
##D 
##D #*** Model 2b: Different parametrization with sum constraint on item difficulties
##D 
##D # skill space definition
##D delta.designmatrix <- matrix( 0, nrow=2*TP, ncol=6 )
##D delta.designmatrix[1:TP,1] <- 1
##D delta.designmatrix[1:TP,2] <- theta.k
##D delta.designmatrix[1:TP,3] <- theta.k^2
##D delta.designmatrix[TP+ 1:TP,4] <- 1
##D delta.designmatrix[TP+ 1:TP,5] <- theta.k
##D delta.designmatrix[TP+ 1:TP,6] <- theta.k^2
##D Xlambda.fixed <- cbind( c(2*I+1,2*I+2), c(1,1) )
##D b1 <- stats::qnorm( colMeans( dat ) )
##D Xlambda.init <- c( b1, b1 + stats::runif(I, -1, 1 ), 1, 1 )
##D # constraints on item difficulties
##D Xlambda.constr.V <- matrix( 0, nrow=NXlam, ncol=2)
##D Xlambda.constr.V[1:I, 1 ] <- 1
##D Xlambda.constr.V[I + 1:I, 2 ] <- 1
##D Xlambda.constr.c <- c(0,0)
##D # estimate model
##D mod2b <- CDM::slca( dat, Xdes=Xdes, delta.designmatrix=delta.designmatrix,
##D             Xlambda.fixed=Xlambda.fixed,  Xlambda.init=Xlambda.init,
##D             Xlambda.constr.V=Xlambda.constr.V, Xlambda.constr.c=Xlambda.constr.c,
##D             decrease.increments=TRUE, maxiter=1000 )
##D summary(mod2b)
##D stats::aggregate( mod2b$pi.k, list( rep(1:2, each=TP)), sum )
##D 
##D #*** Model 2c: Estimation with mRm package
##D library(mRm)
##D mod2c <- mRm::mrm(data.matrix=dat, cl=2)
##D plot(mod2c)
##D print(mod2c)
##D 
##D #*** Model 2d: Estimation with psychomix package
##D library(psychomix)
##D mod2d <- psychomix::raschmix(data=dat, k=2, verbose=TRUE )
##D summary(mod2d)
##D plot(mod2d)
##D 
##D #############################################################################
##D # EXAMPLE 4: Located latent class model, Rasch model
##D #############################################################################
##D 
##D set.seed(487)
##D library(sirt)
##D I <- 15  # I items
##D b1 <- seq( -2, 2, len=I)      # item difficulties
##D N <- 4000    # number of persons
##D # simulate 4 theta classes
##D theta0 <- c( -2.5, -1, 0.3, 1.3 )  # skill classes
##D probs0 <- c( .1, .4, .2, .3 )
##D TP <- length(theta0)
##D theta <- theta0[ rep(1:TP, round(probs0*N)  ) ]
##D dat <- sirt::sim.raschtype( theta, b1 )
##D 
##D #*** Model 1: Located latent class model with 4 classes
##D maxK <- 2
##D NXlam <- I + TP
##D Xdes <- array( 0, dim=c(I, maxK, TP,  NXlam ) )
##D dimnames(Xdes)[[1]] <- colnames(dat)
##D dimnames(Xdes)[[2]] <- paste0("Cat", 1:(maxK) )
##D dimnames(Xdes)[[3]] <- paste0("Class", 1:TP )
##D dimnames(Xdes)[[4]] <- c( paste0( "b_", colnames(dat)[1:I] ), paste0("theta", 1:TP) )
##D # define item difficulties
##D for (ii in 1:I){
##D     Xdes[ii, 2,, ii ] <- -1
##D }
##D # theta design
##D for (tt in 1:TP){
##D     Xdes[1:I, 2, tt, I + tt] <- 1
##D }
##D 
##D # skill space definition
##D delta.designmatrix <- diag(TP)
##D Xlambda.init <- c( - stats::qnorm( colMeans(dat) ), seq(-2,1,len=TP)  )
##D # constraint on item difficulties
##D Xlambda.constr.V <- matrix( 0, nrow=NXlam, ncol=1)
##D Xlambda.constr.V[1:I,1] <- 1
##D Xlambda.constr.c <- c(0)
##D delta.init <- matrix( c(1,1,1,1), TP, 1 )
##D # estimate model
##D mod1 <- CDM::slca( dat, Xdes=Xdes, delta.designmatrix=delta.designmatrix,
##D             delta.init=delta.init, Xlambda.init=Xlambda.init,
##D             Xlambda.constr.V=Xlambda.constr.V, Xlambda.constr.c=Xlambda.constr.c,
##D             decrease.increments=TRUE,  maxiter=400 )
##D summary(mod1)
##D # compare estimated and simulated theta class locations
##D cbind( mod1$Xlambda[ - c(1:I) ], theta0 )
##D # compare estimated and simulated latent class proportions
##D cbind( mod1$pi.k, probs0 )
##D 
##D #############################################################################
##D # EXAMPLE 5: DINA model with two skills
##D #############################################################################
##D 
##D set.seed(487)
##D N <- 3000   # number of persons
##D # define Q-matrix
##D I <- 9  # 9 items
##D NS <- 2 # 2 skills
##D TP <- 4 # number of skill classes
##D Q <- scan( nlines=3)
##D   1 0   1 0   1 0
##D   0 1   0 1   0 1
##D   1 1   1 1   1 1
##D Q <- matrix(Q, I, ncol=NS,byrow=TRUE)
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
##D # define Xlambda design matrix
##D maxK <- 2
##D NXlam <- 2*I
##D Xdes <- array( 0, dim=c(I, maxK, TP,  NXlam ) )
##D dimnames(Xdes)[[1]] <- colnames(dat)
##D dimnames(Xdes)[[2]] <- paste0("Cat", 1:(maxK) )
##D dimnames(Xdes)[[3]] <- c("S00","S10","S01","S11")
##D dimnames(Xdes)[[4]] <- c( paste0("guess",1:I ), paste0( "antislip", 1:I ) )
##D dimnames(Xdes)
##D # define item difficulties
##D for (ii in 1:I){
##D         # define latent responses
##D         latresp <- 1*( alpha0 %*% Q[ii,]==sum(Q[ii,]) )[,1]
##D         # model slipping parameters
##D         Xdes[ii, 2, latresp==1, I+ii ] <- 1
##D         # guessing parameters
##D         Xdes[ii, 2, latresp==0, ii ] <- 1
##D }
##D Xdes[1,2,,]
##D Xdes[7,2,,]
##D # skill space definition
##D delta.designmatrix <- diag(TP)
##D Xlambda.init <- c( rep( stats::qlogis( .2 ), I ), rep( stats::qlogis( .8 ), I ) )
##D 
##D # estimate DINA model with slca function
##D mod1 <- CDM::slca( dat, Xdes=Xdes, delta.designmatrix=delta.designmatrix,
##D             Xlambda.init=Xlambda.init, decrease.increments=TRUE, maxiter=400 )
##D summary(mod1)
##D 
##D # compare estimated and simulated latent class proportions
##D cbind( mod1$pi.k, probs0 )
##D # compare estimated and simulated guessing parameters
##D cbind( mod1$pjk[1,,2], guess )
##D # compare estimated and simulated slipping parameters
##D cbind( 1 - mod1$pjk[4,,2], slip )
##D 
##D #############################################################################
##D # EXAMPLE 6: Investigating differential item functioning in Rasch models
##D #            with regularization
##D #############################################################################
##D 
##D #---- simulate data
##D set.seed(987)
##D N <- 1000   # number of persons in a group
##D I <- 20    # number of items
##D #* population parameters of two groups
##D mu1 <- 0
##D mu2 <- .6
##D sd1 <- 1.4
##D sd2 <- 1
##D # item difficulties
##D b <- seq( -1.1, 1.1, len=I )
##D # define some DIF effects
##D dif <- rep(0,I)
##D dif[ c(3,6,9,12)] <- c( .6, -1, .75, -.35 )
##D print(dif)
##D #* simulate datasets
##D dat1 <- sirt::sim.raschtype( rnorm(N, mean=mu1, sd=sd1), b=b - dif /2 )
##D colnames(dat1) <- paste0("I", 1:I, "_G1")
##D dat2 <- sirt::sim.raschtype( rnorm(N, mean=mu2, sd=sd2), b=b + dif /2 )
##D colnames(dat2) <- paste0("I", 1:I, "_G2")
##D dat <- CDM::CDM_rbind_fill( dat1, dat2 )
##D dat <- data.frame( "group"=rep(1:2, each=N), dat )
##D 
##D #-- nodes for distribution
##D theta.k <- seq(-4, 4, len=11)
##D # define design matrix for lambda
##D nitems <- ncol(dat) - 1
##D maxK <- 2
##D TP <- length(theta.k)
##D NXlam <- 2*I + 1
##D Xdes <- array( 0, dim=c( nitems, maxK, TP,  NXlam  ) )
##D dimnames(Xdes)[[1]] <- colnames(dat)[-1]
##D dimnames(Xdes)[[2]] <- paste0("Cat", 0:(maxK-1) )
##D dimnames(Xdes)[[3]] <- paste0("Theta", 1:TP )
##D dimnames(Xdes)[[4]] <- c( paste0("b", 1:I ), paste0("dif", 1:I ), "const" )
##D # define theta design
##D for (ii in 1:nitems){
##D     Xdes[ii,2,,NXlam ] <- theta.k
##D }
##D # item intercepts and DIF effects
##D for (ii in 1:I){
##D     Xdes[c(ii,ii+I),2,, ii ] <- -1
##D     Xdes[ii,2,,ii+I] <- - 1/2
##D     Xdes[ii+I,2,,ii+I] <- 1/2
##D }
##D #--- skill space designmatrix
##D TP <- length(theta.k)
##D w1 <- stats::dnorm(theta.k)
##D w1 <- w1 / sum(w1)
##D delta.designmatrix <- matrix( 1, nrow=TP, ncol=2 )
##D delta.designmatrix[,2] <- log(w1)
##D 
##D # fixed lambda parameters
##D Xlambda.fixed <- cbind(NXlam, 1 )
##D # initial Xlambda parameters
##D dif_sim <- 0*stats::rnorm(I, sd=.2)
##D Xlambda.init <- c( - stats::qnorm( colMeans(dat1) ), dif_sim, 1 )
##D 
##D # delta.fixed
##D delta.fixed <- cbind( 1, 1, 0 )
##D # regularization parameter
##D regular_lam <- .2
##D # weighting vector: regularize only DIF effects
##D regular_w <- c( rep(0,I), rep(1,I), 0 )
##D 
##D #--- estimation model with scad penalty
##D mod1 <- CDM::slca( dat[,-1], group=dat$group, Xdes=Xdes,
##D             delta.designmatrix=delta.designmatrix, regular_type="scad",
##D             Xlambda.init=Xlambda.init, delta.fixed=delta.fixed, Xlambda.fixed=Xlambda.fixed,
##D             regular_lam=regular_lam, regular_w=regular_w )
##D # compare true and estimated DIF effects
##D cbind( "true"=dif, "estimated"=round(coef(mod1)[seq(I+1,2*I)],2) )
##D summary(mod1)
## End(Not run)



