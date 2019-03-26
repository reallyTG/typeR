library(sirt)


### Name: mcmc.3pno.testlet
### Title: 3PNO Testlet Model
### Aliases: mcmc.3pno.testlet
### Keywords: Testlet model Testlets Markov Chain Monte Carlo (MCMC)

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Dataset Reading
##D #############################################################################
##D data(data.read)
##D dat <- data.read
##D I <- ncol(dat)
##D 
##D # set burnin and total number of iterations here (CHANGE THIS!)
##D burnin <- 200
##D iter <- 500
##D 
##D #***
##D # Model 1: 1PNO model
##D mod1 <- sirt::mcmc.3pno.testlet( dat,  est.slope=FALSE, est.guess=FALSE,
##D             burnin=burnin, iter=iter )
##D summary(mod1)
##D plot(mod1,ask=TRUE) # plot MCMC chains in coda style
##D plot(mod1,ask=TRUE, layout=2) # plot MCMC output in different layout
##D 
##D #***
##D # Model 2: 3PNO model with Beta(5,17) prior for guessing parameters
##D mod2 <- sirt::mcmc.3pno.testlet( dat,  guess.prior=c(5,17),
##D                burnin=burnin, iter=iter )
##D summary(mod2)
##D 
##D #***
##D # Model 3: Rasch (1PNO) testlet model
##D testlets <- substring( colnames(dat), 1, 1 )
##D mod3 <- sirt::mcmc.3pno.testlet( dat,  testlets=testlets,  est.slope=FALSE,
##D            est.guess=FALSE, burnin=burnin, iter=iter )
##D summary(mod3)
##D 
##D #***
##D # Model 4: 3PNO testlet model with (almost) fixed guessing parameters .25
##D mod4 <- sirt::mcmc.3pno.testlet( dat,  guess.prior=1000*c(25,75), testlets=testlets,
##D               burnin=burnin, iter=iter )
##D summary(mod4)
##D plot(mod4, ask=TRUE, layout=2)
##D 
##D #############################################################################
##D # EXAMPLE 2: Simulated data according to the Rasch testlet model
##D #############################################################################
##D set.seed(678)
##D 
##D N <- 3000   # number of persons
##D I <- 4      # number of items per testlet
##D TT <- 3     # number of testlets
##D 
##D ITT <- I*TT
##D b <- round( stats::rnorm( ITT, mean=0, sd=1 ), 2 )
##D sd0 <- 1 # sd trait
##D sdt <- seq( 0, 2, len=TT ) # sd testlets
##D 
##D # simulate theta
##D theta <- stats::rnorm( N, sd=sd0 )
##D # simulate testlets
##D ut <- matrix(0,nrow=N, ncol=TT )
##D for (tt in 1:TT){
##D     ut[,tt] <- stats::rnorm( N, sd=sdt[tt] )
##D }
##D ut <- ut[, rep(1:TT,each=I) ]
##D # calculate response probability
##D prob <- matrix( stats::pnorm( theta + ut + matrix( b, nrow=N, ncol=ITT,
##D             byrow=TRUE ) ), N, ITT)
##D Y <- (matrix( stats::runif(N*ITT), N, ITT) < prob )*1
##D colMeans(Y)
##D 
##D # define testlets
##D testlets <- rep(1:TT, each=I )
##D 
##D burnin <- 300
##D iter <- 1000
##D 
##D #***
##D # Model 1: 1PNO model (without testlet structure)
##D mod1 <- sirt::mcmc.3pno.testlet( dat=Y,  est.slope=FALSE, est.guess=FALSE,
##D             burnin=burnin, iter=iter, testlets=testlets )
##D summary(mod1)
##D 
##D summ1 <- mod1$summary.mcmcobj
##D # compare item parameters
##D cbind( b, summ1[ grep("b", summ1$parameter ), "Mean" ] )
##D # Testlet standard deviations
##D cbind( sdt, summ1[ grep("sigma\.testlet", summ1$parameter ), "Mean" ] )
##D 
##D #***
##D # Model 2: 1PNO model (without testlet structure)
##D mod2 <- sirt::mcmc.3pno.testlet( dat=Y,  est.slope=TRUE, est.guess=FALSE,
##D            burnin=burnin, iter=iter, testlets=testlets )
##D summary(mod2)
##D 
##D summ2 <- mod2$summary.mcmcobj
##D # compare item parameters
##D cbind( b, summ2[ grep("b\[", summ2$parameter ), "Mean" ] )
##D # item discriminations
##D cbind( sd0, summ2[ grep("a\[", summ2$parameter ), "Mean" ] )
##D # Testlet standard deviations
##D cbind( sdt, summ2[ grep("sigma\.testlet", summ2$parameter ), "Mean" ] )
##D 
##D #############################################################################
##D # EXAMPLE 3: Simulated data according to the 2PNO testlet model
##D #############################################################################
##D set.seed(678)
##D 
##D N <- 3000    # number of persons
##D I <- 3      # number of items per testlet
##D TT <- 5    # number of testlets
##D 
##D ITT <- I*TT
##D b <- round( stats::rnorm( ITT, mean=0, sd=1 ), 2 )
##D a <- round( stats::runif( ITT, 0.5, 2 ),2)
##D sdt <- seq( 0, 2, len=TT ) # sd testlets
##D sd0 <- 1
##D 
##D # simulate theta
##D theta <- stats::rnorm( N, sd=sd0 )
##D # simulate testlets
##D ut <- matrix(0,nrow=N, ncol=TT )
##D for (tt in 1:TT){
##D    ut[,tt] <- stats::rnorm( N, sd=sdt[tt] )
##D }
##D ut <- ut[, rep(1:TT,each=I) ]
##D # calculate response probability
##D bM <- matrix( b, nrow=N, ncol=ITT, byrow=TRUE )
##D aM <- matrix( a, nrow=N, ncol=ITT, byrow=TRUE )
##D prob <- matrix( stats::pnorm( aM*theta + ut + bM ), N, ITT)
##D Y <- (matrix( stats::runif(N*ITT), N, ITT) < prob )*1
##D colMeans(Y)
##D 
##D # define testlets
##D testlets <- rep(1:TT, each=I )
##D 
##D burnin <- 500
##D iter <- 1500
##D 
##D #***
##D # Model 1: 2PNO model
##D mod1 <- sirt::mcmc.3pno.testlet( dat=Y,  est.slope=TRUE, est.guess=FALSE,
##D              burnin=burnin, iter=iter, testlets=testlets )
##D summary(mod1)
##D 
##D summ1 <- mod1$summary.mcmcobj
##D # compare item parameters
##D cbind( b, summ1[ grep("b\[", summ1$parameter ), "Mean" ] )
##D # item discriminations
##D cbind( a, summ1[ grep("a\[", summ1$parameter ), "Mean" ] )
##D # Testlet standard deviations
##D cbind( sdt, summ1[ grep("sigma\.testlet", summ1$parameter ), "Mean" ] )
## End(Not run)



