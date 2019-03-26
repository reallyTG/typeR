library(sirt)


### Name: rm.facets
### Title: Rater Facets Models with Item/Rater Intercepts and Slopes
### Aliases: rm.facets summary.rm.facets logLik.rm.facets anova.rm.facets
###   IRT.irfprob.rm.facets IRT.likelihood.rm.facets
###   IRT.posterior.rm.facets IRT.modelfit.rm.facets
###   IRT.factor.scores.rm.facets summary.IRT.modelfit.rm.facets
###   rm_proc_data
### Keywords: Rater model Facets model summary

### ** Examples

#############################################################################
# EXAMPLE 1: Partial Credit Model and Generalized partial credit model
#                   5 items and 1 rater
#############################################################################
data(data.ratings1)
dat <- data.ratings1

# select rater db01
dat <- dat[ paste(dat$rater)=="db01", ]

#****  Model 1: Partial Credit Model
mod1 <- sirt::rm.facets( dat[, paste0( "k",1:5) ], pid=dat$idstud )

#****  Model 2: Generalized Partial Credit Model
mod2 <- sirt::rm.facets( dat[, paste0( "k",1:5) ],  pid=dat$idstud, est.a.item=TRUE)

summary(mod1)
summary(mod2)

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Facets Model: 5 items, 7 raters
##D #############################################################################
##D 
##D data(data.ratings1)
##D dat <- data.ratings1
##D 
##D #****  Model 1: Partial Credit Model: no rater effects
##D mod1 <- sirt::rm.facets( dat[, paste0( "k",1:5) ], rater=dat$rater,
##D              pid=dat$idstud, est.b.rater=FALSE )
##D 
##D #****  Model 2: Partial Credit Model: intercept rater effects
##D mod2 <- sirt::rm.facets( dat[, paste0( "k",1:5) ], rater=dat$rater, pid=dat$idstud)
##D 
##D # extract individual likelihood
##D lmod1 <- IRT.likelihood(mod1)
##D str(lmod1)
##D # likelihood value
##D logLik(mod1)
##D # extract item response functions
##D pmod1 <- IRT.irfprob(mod1)
##D str(pmod1)
##D # model comparison
##D anova(mod1,mod2)
##D # absolute and relative model fit
##D smod1 <- IRT.modelfit(mod1)
##D summary(smod1)
##D smod2 <- IRT.modelfit(mod2)
##D summary(smod2)
##D IRT.compareModels( smod1, smod2 )
##D # extract factor scores (EAP is the default)
##D IRT.factor.scores(mod2)
##D # extract WLEs
##D IRT.factor.scores(mod2, type="WLE")
##D 
##D #****  Model 2a: compare results with TAM package
##D #   Results should be similar to Model 2
##D library(TAM)
##D mod2a <- TAM::tam.mml.mfr( resp=dat[, paste0( "k",1:5) ],
##D              facets=dat[, "rater", drop=FALSE],
##D              pid=dat$pid, formulaA=~ item*step + rater )
##D 
##D #****  Model 2b: Partial Credit Model: some fixed parameters
##D # fix rater parameters for raters 1, 4 and 5
##D b.rater.fixed <- rep(NA,7)
##D b.rater.fixed[ c(1,4,5) ] <- c(1,-.8,0)  # fixed parameters
##D # fix item parameters of first and second item
##D tau.item.fixed <- round( mod2$tau.item, 1 )    # use parameters from mod2
##D tau.item.fixed[ 3:5, ] <- NA    # free item parameters of items 3, 4 and 5
##D mod2b <- sirt::rm.facets( dat[, paste0( "k",1:5) ], rater=dat$rater,
##D              b.rater.fixed=b.rater.fixed, tau.item.fixed=tau.item.fixed,
##D              est.mean=TRUE, pid=dat$idstud)
##D summary(mod2b)
##D 
##D #****  Model 3: estimated rater slopes
##D mod3 <- sirt::rm.facets( dat[, paste0( "k",1:5) ], rater=dat$rater,
##D             est.a.rater=TRUE)
##D 
##D #****  Model 4: estimated item slopes
##D mod4 <- sirt::rm.facets( dat[, paste0( "k",1:5) ], rater=dat$rater,
##D              pid=dat$idstud, est.a.item=TRUE)
##D 
##D #****  Model 5: estimated rater and item slopes
##D mod5 <- sirt::rm.facets( dat[, paste0( "k",1:5) ], rater=dat$rater,
##D              pid=dat$idstud, est.a.rater=TRUE, est.a.item=TRUE)
##D summary(mod1)
##D summary(mod2)
##D summary(mod2a)
##D summary(mod3)
##D summary(mod4)
##D summary(mod5)
##D 
##D #****  Model 5a: Some fixed parameters in Model 5
##D # fix rater b parameters for raters 1, 4 and 5
##D b.rater.fixed <- rep(NA,7)
##D b.rater.fixed[ c(1,4,5) ] <- c(1,-.8,0)
##D # fix rater a parameters for first four raters
##D a.rater.fixed <- rep(NA,7)
##D a.rater.fixed[ c(1,2,3,4) ] <- c(1.1,0.9,.85,1)
##D # fix item b parameters of first item
##D tau.item.fixed <- matrix( NA, nrow=5, ncol=3 )
##D tau.item.fixed[ 1, ] <- c(-2,-1.5, 1 )
##D # fix item a parameters
##D a.item.fixed <- rep(NA,5)
##D a.item.fixed[ 1:4 ] <- 1
##D # estimate model
##D mod5a <- sirt::rm.facets( dat[, paste0( "k",1:5) ], rater=dat$rater,
##D              pid=dat$idstud, est.a.rater=TRUE, est.a.item=TRUE,
##D              tau.item.fixed=tau.item.fixed, b.rater.fixed=b.rater.fixed,
##D              a.rater.fixed=a.rater.fixed, a.item.fixed=a.item.fixed,
##D              est.mean=TRUE)
##D summary(mod5a)
##D 
##D #****  Model 6: Estimate rater model with reference rater 'db03'
##D mod6 <- sirt::rm.facets( dat[, paste0( "k",1:5) ], rater=dat$rater, est.a.item=TRUE,
##D              est.a.rater=TRUE, pid=dat$idstud, reference_rater="db03" )
##D summary(mod6)
##D 
##D #**** Model 7: Modelling rater-item-interactions
##D mod7 <- sirt::rm.facets( dat[, paste0( "k",1:5) ], rater=dat$rater, est.a.item=FALSE,
##D              est.a.rater=TRUE, pid=dat$idstud, reference_rater="db03",
##D              rater_item_int=TRUE)
##D summary(mod7)
## End(Not run)



