library(sirt)


### Name: rm.sdt
### Title: Hierarchical Rater Model Based on Signal Detection Theory
###   (HRM-SDT)
### Aliases: rm.sdt summary.rm.sdt logLik.rm.sdt anova.rm.sdt
###   IRT.irfprob.rm.sdt IRT.likelihood.rm.sdt IRT.posterior.rm.sdt
###   IRT.modelfit.rm.sdt summary.IRT.modelfit.rm.sdt
###   IRT.factor.scores.rm.sdt plot.rm.sdt
### Keywords: Rater model Signal detection model summary plot

### ** Examples

#############################################################################
# EXAMPLE 1: Hierarchical rater model (HRM-SDT) data.ratings1
#############################################################################
data(data.ratings1)
dat <- data.ratings1

## Not run: 
##D # Model 1: Partial Credit Model: no rater effects
##D mod1 <- sirt::rm.sdt( dat[, paste0( "k",1:5) ], rater=dat$rater,
##D             pid=dat$idstud, est.c.rater="n", d.start=100,  est.d.rater="n" )
##D summary(mod1)
##D 
##D # Model 2: Generalized Partial Credit Model: no rater effects
##D mod2 <- sirt::rm.sdt( dat[, paste0( "k",1:5) ], rater=dat$rater,
##D             pid=dat$idstud, est.c.rater="n", est.d.rater="n",
##D             est.a.item=TRUE, d.start=100)
##D summary(mod2)
##D 
##D # Model 3: Equal effects in SDT
##D mod3 <- sirt::rm.sdt( dat[, paste0( "k",1:5) ], rater=dat$rater,
##D             pid=dat$idstud, est.c.rater="e", est.d.rater="e")
##D summary(mod3)
##D 
##D # Model 4: Rater effects in SDT
##D mod4 <- sirt::rm.sdt( dat[, paste0( "k",1:5) ], rater=dat$rater,
##D             pid=dat$idstud, est.c.rater="r", est.d.rater="r")
##D summary(mod4)
##D 
##D #############################################################################
##D # EXAMPLE 2: HRM-SDT data.ratings3
##D #############################################################################
##D 
##D data(data.ratings3)
##D dat <- data.ratings3
##D dat <- dat[ dat$rater < 814, ]
##D psych::describe(dat)
##D 
##D # Model 1: item- and rater-specific effects
##D mod1 <- sirt::rm.sdt( dat[, paste0( "crit",c(2:4)) ], rater=dat$rater,
##D             pid=dat$idstud, est.c.rater="a", est.d.rater="a" )
##D summary(mod1)
##D plot(mod1)
##D 
##D # Model 2: Differing number of categories per variable
##D mod2 <- sirt::rm.sdt( dat[, paste0( "crit",c(2:4,6)) ], rater=dat$rater,
##D             pid=dat$idstud, est.c.rater="a", est.d.rater="a")
##D summary(mod2)
##D plot(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 3: Hierarchical rater model with discrete skill spaces
##D #############################################################################
##D 
##D data(data.ratings3)
##D dat <- data.ratings3
##D dat <- dat[ dat$rater < 814, ]
##D psych::describe(dat)
##D 
##D # Model 1: Discrete theta skill space with values of 0,1,2 and 3
##D mod1 <- sirt::rm.sdt( dat[, paste0( "crit",c(2:4)) ], theta.k=0:3, rater=dat$rater,
##D             pid=dat$idstud, est.c.rater="a", est.d.rater="a", skillspace="discrete" )
##D summary(mod1)
##D plot(mod1)
##D 
##D # Model 2: Modelling of one item by using a discrete skill space and
##D #          fixed item parameters
##D 
##D # fixed tau and a parameters
##D tau.item.fixed <- cbind( 1, 1:3,  100*cumsum( c( 0.5, 1.5, 2.5)) )
##D a.item.fixed <- cbind( 1, 100 )
##D # fit HRM-SDT
##D mod2 <- sirt::rm.sdt( dat[, "crit2", drop=FALSE], theta.k=0:3, rater=dat$rater,
##D             tau.item.fixed=tau.item.fixed,a.item.fixed=a.item.fixed, pid=dat$idstud,
##D             est.c.rater="a", est.d.rater="a", skillspace="discrete" )
##D summary(mod2)
##D plot(mod2)
## End(Not run)



