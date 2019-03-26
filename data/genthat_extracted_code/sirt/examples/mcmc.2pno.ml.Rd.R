library(sirt)


### Name: mcmc.2pno.ml
### Title: Random Item Response Model / Multilevel IRT Model
### Aliases: mcmc.2pno.ml
### Keywords: Markov Chain Monte Carlo (MCMC) Multilevel item response
###   model Multilevel DIF

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Dataset Multilevel data.ml1 - dichotomous items
##D #############################################################################
##D data(data.ml1)
##D dat <- data.ml1[,-1]
##D group <- data.ml1$group
##D # just for a try use a very small number of iterations
##D burnin <- 50 ; iter <- 100
##D 
##D #***
##D # Model 1: 1PNO with no cluster item effects
##D mod1 <- sirt::mcmc.2pno.ml( dat, group, est.b.Var="n", burnin=burnin, iter=iter )
##D summary(mod1)    # summary
##D plot(mod1,layout=2,ask=TRUE) # plot results
##D # write results to coda file
##D mcmclist2coda( mod1$mcmcobj, name="data.ml1_mod1" )
##D 
##D #***
##D # Model 2: 1PNO with cluster item effects of item difficulties
##D mod2 <- sirt::mcmc.2pno.ml( dat, group, est.b.Var="i", burnin=burnin, iter=iter )
##D summary(mod2)
##D plot(mod2, ask=TRUE, layout=2 )
##D 
##D #***
##D # Model 3: 2PNO with cluster item effects of item difficulties but
##D #          joint item slopes
##D mod3 <- sirt::mcmc.2pno.ml( dat, group, est.b.Var="i", est.a.M="h",
##D               burnin=burnin, iter=iter )
##D summary(mod3)
##D 
##D #***
##D # Model 4: 2PNO with cluster item effects of item difficulties and
##D #          cluster item effects with a jointly estimated SD
##D mod4 <- sirt::mcmc.2pno.ml( dat, group, est.b.Var="i", est.a.M="h",
##D                 est.a.Var="j", burnin=burnin, iter=iter )
##D summary(mod4)
##D 
##D #############################################################################
##D # EXAMPLE 2: Dataset Multilevel data.ml2 - polytomous items
##D #            assuming a normal distribution for polytomous items
##D #############################################################################
##D data(data.ml2)
##D dat <- data.ml2[,-1]
##D group <- data.ml2$group
##D # set iterations for all examples (too few!!)
##D burnin <- 100 ; iter <- 500
##D 
##D #***
##D # Model 1: no intercept variance, no slopes
##D mod1 <- sirt::mcmc.2pno.ml( dat=dat, group=group, est.b.Var="n",
##D              burnin=burnin, iter=iter, link="normal",  progress.iter=20  )
##D summary(mod1)
##D 
##D #***
##D # Model 2a: itemwise intercept variance, no slopes
##D mod2a <- sirt::mcmc.2pno.ml( dat=dat, group=group, est.b.Var="i",
##D             burnin=burnin, iter=iter,link="normal",  progress.iter=20  )
##D summary(mod2a)
##D 
##D #***
##D # Model 2b: homogeneous intercept variance, no slopes
##D mod2b <- sirt::mcmc.2pno.ml( dat=dat, group=group, est.b.Var="j",
##D               burnin=burnin, iter=iter,link="normal",  progress.iter=20  )
##D summary(mod2b)
##D 
##D #***
##D # Model 3: intercept variance and slope variances
##D #          hierarchical item and slope parameters
##D mod3 <- sirt::mcmc.2pno.ml( dat=dat, group=group,
##D                est.b.M="h", est.b.Var="i", est.a.M="h", est.a.Var="i",
##D                burnin=burnin, iter=iter,link="normal",  progress.iter=20  )
##D summary(mod3)
##D 
##D #############################################################################
##D # EXAMPLE 3: Simulated random effects model | dichotomous items
##D #############################################################################
##D set.seed(7698)
##D 
##D #*** model parameters
##D sig2.lev2 <- .3^2   # theta level 2 variance
##D sig2.lev1 <- .8^2   # theta level 1 variance
##D G <- 100            # number of groups
##D n <- 20             # number of persons within a group
##D I <- 12             # number of items
##D #*** simuate theta
##D theta2 <- stats::rnorm( G, sd=sqrt(sig2.lev2) )
##D theta1 <- stats::rnorm( n*G, sd=sqrt(sig2.lev1) )
##D theta  <- theta1 + rep( theta2, each=n )
##D #*** item difficulties
##D b <- seq( -2, 2, len=I )
##D #*** define group identifier
##D group <- 1000 + rep(1:G, each=n )
##D #*** SD of group specific difficulties for items 3 and 5
##D sigma.item <- rep(0,I)
##D sigma.item[c(3,5)] <- 1
##D #*** simulate group specific item difficulties
##D b.class <- sapply( sigma.item, FUN=function(sii){ stats::rnorm( G, sd=sii ) } )
##D b.class <- b.class[ rep( 1:G,each=n ), ]
##D b <- matrix( b, n*G, I, byrow=TRUE ) + b.class
##D #*** simulate item responses
##D m1 <- stats::pnorm( theta - b )
##D dat <- 1 * ( m1 > matrix( stats::runif( n*G*I ), n*G, I ) )
##D 
##D #*** estimate model
##D mod <- sirt::mcmc.2pno.ml( dat, group=group, burnin=burnin, iter=iter,
##D             est.b.M="n", est.b.Var="i", progress.iter=20)
##D summary(mod)
##D plot(mod, layout=2, ask=TRUE )
## End(Not run)



