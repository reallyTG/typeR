library(immer)


### Name: immer_hrm
### Title: Hierarchical Rater Model (Patz et al., 2002)
### Aliases: immer_hrm summary.immer_hrm plot.immer_hrm logLik.immer_hrm
###   IRT.likelihood.immer_hrm IRT.posterior.immer_hrm anova.immer_hrm
### Keywords: Hierarchical rater model plot summary

### ** Examples

## Not run: 
##D library(sirt)
##D library(TAM)
##D 
##D #############################################################################
##D # EXAMPLE 1: Simulated data using the immer::immer_hrm_simulate() function
##D #############################################################################
##D 
##D # define data generating parameters
##D set.seed(1997)
##D N <- 500  # number of persons
##D I <- 4    # number of items
##D R <- 3    # number of raters
##D K <- 3    # maximum score
##D sigma <- 2  # standard deviation
##D theta <- stats::rnorm( N, sd=sigma )  # abilities
##D # item intercepts
##D b <- outer( seq( -1.5, 1.5, len=I), seq( -2, 2, len=K), "+" )
##D # item loadings
##D a <- rep(1,I)
##D # rater severity parameters
##D phi <- matrix( c(-.3, -.2, .5), nrow=I, ncol=R, byrow=TRUE )
##D phi <- phi + stats::rnorm( phi, sd=.3 )
##D phi <- phi - rowMeans(phi)
##D # rater variability parameters
##D psi <- matrix( c(.1, .4, .8), nrow=I, ncol=R, byrow=TRUE )
##D # simulate HRM data
##D data <- immer::immer_hrm_simulate( theta, a, b, phi=phi, psi=psi )
##D pid <- data$pid
##D rater <- data$rater
##D dat <- data[, - c(1:2) ]
##D 
##D #----------------------------------------------------------------
##D #*** Model 1: estimate HRM with equal item slopes
##D iter <- 3000
##D burnin <- 500
##D mod1 <- immer::immer_hrm( dat, pid, rater, iter=iter,  burnin=burnin )
##D summary(mod1)
##D plot(mod1,layout=2,ask=TRUE)
##D 
##D # relations among convergence diagnostic statistics
##D par(mfrow=c(1,2))
##D plot( mod1$summary.mcmcobj$PercVarRatio, log(mod1$summary.mcmcobj$effSize), pch=16)
##D plot( mod1$summary.mcmcobj$PercVarRatio, mod1$summary.mcmcobj$Rhat, pch=16)
##D par(mfrow=c(1,1))
##D 
##D # extract individual likelihood
##D lmod1 <- IRT.likelihood(mod1)
##D str(lmod1)
##D # extract log-likelihood value
##D logLik(mod1)
##D 
##D # write coda files into working directory
##D sirt::mcmclist2coda(mod1$mcmcobj, name="hrm_mod1")
##D 
##D #----------------------------------------------------------------
##D #*** Model 2: estimate HRM with estimated item slopes
##D mod2 <- immer::immer_hrm( dat, pid, rater, iter=iter,  burnin=burnin,
##D             est.a=TRUE, est.sigma=FALSE)
##D summary(mod2)
##D plot(mod2,layout=2,ask=TRUE)
##D 
##D # model comparison
##D anova( mod1, mod2 )
##D 
##D #----------------------------------------------------------------
##D #*** Model 3: Some prior specifications
##D prior <- list()
##D # prior on mu
##D prior$mu$M <- .7
##D prior$mu$SD <- 5
##D # fixed item parameters for first item
##D prior$b$M <-  matrix( 0, nrow=4, ncol=3 )
##D prior$b$M[1,] <- c(-2,0,2)
##D prior$b$SD <-  matrix( 10, nrow=4, ncol=3 )
##D prior$b$SD[1,] <- 1E-4
##D # estimate model
##D mod3 <- immer::immer_hrm( dat, pid, rater, iter=iter,  burnin=burnin, prior=prior)
##D summary(mod3)
##D plot(mod3)
##D 
##D #----------------------------------------------------------------
##D #*** Model 4: Multi-faceted Rasch models in TAM package
##D 
##D # create facets object
##D facets <- data.frame( "rater"=rater )
##D 
##D #-- Model 4a: only main rater effects
##D form <- ~ item*step + rater
##D mod4a <- TAM::tam.mml.mfr( dat, pid=pid, facets=facets, formulaA=form)
##D summary(mod4a)
##D 
##D #-- Model 4b: item specific rater effects
##D form <- ~ item*step + item*rater
##D mod4b <- TAM::tam.mml.mfr( dat, pid=pid, facets=facets, formulaA=form)
##D summary(mod4b)
##D 
##D #----------------------------------------------------------------
##D #*** Model 5: Faceted Rasch models with sirt::rm.facets
##D 
##D #--- Model 5a: Faceted Rasch model with only main rater effects
##D mod5a <- sirt::rm.facets( dat, pid=pid, rater=rater )
##D summary(mod5a)
##D 
##D #--- Model 5b: allow rater slopes for different rater discriminations
##D mod5b <- sirt::rm.facets( dat, pid=pid, rater=rater, est.a.rater=TRUE )
##D summary(mod5b)
##D 
##D #############################################################################
##D # EXAMPLE 2: data.ratings1 (sirt package)
##D #############################################################################
##D 
##D data(data.ratings1, package="sirt")
##D dat <- data.ratings1
##D 
##D # set number of iterations and burnin iterations
##D set.seed(87)
##D iter <- 1000
##D burnin <- 500
##D # estimate model
##D mod <- immer::immer_hrm( dat[,  paste0("k",1:5) ], pid=dat$idstud, rater=dat$rater,
##D              iter=iter, burnin=burnin )
##D summary(mod)
##D plot(mod, layout=1, ask=TRUE)
##D plot(mod, layout=2, ask=TRUE)
## End(Not run)



