library(sirt)


### Name: IRT.mle
### Title: Person Parameter Estimation
### Aliases: IRT.mle
### Keywords: Person parameters

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Generalized partial credit model
##D #############################################################################
##D 
##D data(data.ratings1)
##D dat <- data.ratings1
##D 
##D # estimate model
##D mod1 <- sirt::rm.facets( dat[, paste0( "k",1:5) ], rater=dat$rater,
##D              pid=dat$idstud, maxiter=15)
##D # extract dataset and item parameters
##D data <- mod1$procdata$dat2.NA
##D a <- mod1$ipars.dat2$a
##D b <- mod1$ipars.dat2$b
##D theta0 <- mod1$person$EAP
##D # define item response function for item ii
##D calc.pcm <- function( theta, a, b, ii ){
##D     K <- ncol(b)
##D     N <- length(theta)
##D     matrK <- matrix( 0:K, nrow=N, ncol=K+1, byrow=TRUE)
##D     eta <- a[ii] * theta * matrK - matrix( c(0,b[ii,]), nrow=N, ncol=K+1, byrow=TRUE)
##D     eta <- exp(eta)
##D     probs <- eta / rowSums(eta, na.rm=TRUE)
##D     return(probs)
##D }
##D arg.list <- list("a"=a, "b"=b )
##D 
##D # MLE
##D abil1 <- sirt::IRT.mle( data, irffct=calc.pcm, theta=theta0, arg.list=arg.list )
##D str(abil1)
##D # WLE
##D abil2 <- sirt::IRT.mle( data, irffct=calc.pcm, theta=theta0, arg.list=arg.list, type="WLE")
##D str(abil2)
##D # MAP with prior distribution N(.2, 1.3)
##D abil3 <- sirt::IRT.mle( data, irffct=calc.pcm, theta=theta0, arg.list=arg.list,
##D               type="MAP", mu=.2, sigma=1.3 )
##D str(abil3)
##D 
##D #############################################################################
##D # EXAMPLE 2: Rasch model
##D #############################################################################
##D 
##D data(data.read)
##D dat <- data.read
##D I <- ncol(dat)
##D 
##D # estimate Rasch model
##D mod1 <- sirt::rasch.mml2( dat )
##D summary(mod1)
##D 
##D # define item response function
##D irffct <- function( theta, b, ii){
##D     eta <- exp( theta - b[ii] )
##D     probs <- eta / ( 1 + eta )
##D     probs <- cbind( 1 - probs, probs )
##D     return(probs)
##D }
##D # initial person parameters and item parameters
##D theta0 <- mod1$person$EAP
##D arg.list <- list( "b"=mod1$item$b  )
##D 
##D # estimate WLE
##D abil <- sirt::IRT.mle( data=dat, irffct=irffct, arg.list=arg.list,
##D             theta=theta0, type="WLE")
##D # compare with wle.rasch function
##D theta <- sirt::wle.rasch( dat, b=mod1$item$b )
##D cbind( abil[,1], theta$theta, abil[,2], theta$se.theta )
##D 
##D #############################################################################
##D # EXAMPLE 3: Ramsay quotient model
##D #############################################################################
##D 
##D data(data.read)
##D dat <- data.read
##D I <- ncol(dat)
##D 
##D # estimate Ramsay model
##D mod1 <- sirt::rasch.mml2( dat, irtmodel="ramsay.qm" )
##D summary(mod1)
##D # define item response function
##D irffct <- function( theta, b, K, ii){
##D     eta <- exp( theta / b[ii] )
##D     probs <- eta / ( K[ii] + eta )
##D     probs <- cbind( 1 - probs, probs )
##D     return(probs)
##D }
##D # initial person parameters and item parameters
##D theta0 <- exp( mod1$person$EAP )
##D arg.list <- list( "b"=mod1$item2$b, "K"=mod1$item2$K )
##D # estimate MLE
##D res <- sirt::IRT.mle( data=dat, irffct=irffct, arg.list=arg.list, theta=theta0,
##D             maxval=20, maxiter=50)
## End(Not run)



