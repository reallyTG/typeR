library(BIFIEsurvey)


### Name: BIFIE.twolevelreg
### Title: Two Level Regression
### Aliases: BIFIE.twolevelreg summary.BIFIE.twolevelreg
###   coef.BIFIE.twolevelreg vcov.BIFIE.twolevelreg
### Keywords: Multilevel regression summary coef vcov

### ** Examples

## Not run: 
##D library(lme4)
##D 
##D #############################################################################
##D # EXAMPLE 1: Dataset data.bifie01 | TIMSS 2011
##D #############################################################################
##D 
##D data(data.bifie01)
##D dat <- data.bifie01
##D set.seed(987)
##D 
##D # create dataset with replicate weights and plausible values
##D bdat1 <- BIFIEsurvey::BIFIE.data.jack( data=dat, jktype="JK_TIMSS", jkzone="JKCZONE",
##D             jkrep="JKCREP", wgt="TOTWGT", pv_vars=c("ASMMAT","ASSSCI") )
##D 
##D # create dataset without plausible values and ignoring weights
##D bdat2 <- BIFIEsurvey::BIFIE.data.jack( data=dat, jktype="JK_RANDOM", ngr=10 )
##D #=> standard errors from ML estimation
##D 
##D #***********************************************
##D # Model 1: Random intercept model
##D 
##D #--- Model 1a: without weights, first plausible value
##D mod1a <- BIFIEsurvey::BIFIE.twolevelreg( BIFIEobj=bdat2, dep="ASMMAT01",
##D                 formula.fixed=~ 1, formula.random=~ 1, idcluster="idschool",
##D                 wgtlevel2="one", se=FALSE )
##D summary(mod1a)
##D 
##D #--- Model 1b: estimation in lme4
##D mod1b <- lme4::lmer( ASMMAT01 ~ 1 + ( 1 | idschool), data=dat, REML=FALSE)
##D summary(mod1b)
##D 
##D #--- Model 1c: Like Model 1a but for five plausible values and ML inference
##D mod1c <- BIFIEsurvey::BIFIE.twolevelreg( BIFIEobj=bdat1, dep="ASMMAT",
##D                 formula.fixed=~ 1, formula.random=~ 1, idcluster="idschool",
##D                 wgtlevel2="one",  se=FALSE )
##D summary(mod1c)
##D 
##D #--- Model 1d: weights and sampling design and all plausible values
##D mod1d <- BIFIEsurvey::BIFIE.twolevelreg( BIFIEobj=bdat1, dep="ASMMAT",
##D                 formula.fixed=~ 1, formula.random=~ 1, idcluster="idschool",
##D                 wgtlevel2="SCHWGT" )
##D summary(mod1d)
##D 
##D #***********************************************
##D # Model 2: Random slope model
##D 
##D #--- Model 2a: without weights
##D mod2a <- BIFIEsurvey::BIFIE.twolevelreg( BIFIEobj=bdat2, dep="ASMMAT01",
##D                 formula.fixed=~  female +  ASBG06A, formula.random=~ ASBG06A,
##D                 idcluster="idschool", wgtlevel2="one",  se=FALSE )
##D summary(mod2a)
##D 
##D #--- Model 2b: estimation in lme4
##D mod2b <- lme4::lmer( ASMMAT01 ~ female +  ASBG06A + ( 1 + ASBG06A | idschool),
##D                    data=dat, REML=FALSE)
##D summary(mod2b)
##D 
##D #--- Model 2c: weights and sampling design and all plausible values
##D mod2c <- BIFIEsurvey::BIFIE.twolevelreg( BIFIEobj=bdat1, dep="ASMMAT",
##D                 formula.fixed=~  female +  ASBG06A, formula.random=~ ASBG06A,
##D                 idcluster="idschool", wgtlevel2="SCHWGT", maxiter=500, se=FALSE)
##D summary(mod2c)
##D 
##D #--- Model 2d: Uncorrelated intecepts and slopes
##D 
##D # constraint for zero covariance between intercept and slope
##D recov_constraint <- matrix( c(1,2,0), ncol=3 )
##D mod2d <- BIFIEsurvey::BIFIE.twolevelreg( BIFIEobj=bdat2, dep="ASMMAT01",
##D                 formula.fixed=~ female +  ASBG06A, formula.random=~ ASBG06A,
##D                 idcluster="idschool", wgtlevel2="one",  se=FALSE,
##D                 recov_constraint=recov_constraint )
##D summary(mod2d)
##D 
##D #--- Model 2e: Fixed entries in the random effects covariance matrix
##D 
##D # two constraints for random effects covariance
##D # Cov(Int, Slo)=0  # zero slope for intercept and slope
##D # Var(Slo)=10      # slope variance of 10
##D recov_constraint <- matrix( c(1,2,0,
##D                       2,2,10), ncol=3, byrow=TRUE)
##D mod2e <- BIFIEsurvey::BIFIE.twolevelreg( BIFIEobj=bdat2, dep="ASMMAT01",
##D                 formula.fixed=~  female +  ASBG06A, formula.random=~ ASBG06A,
##D                 idcluster="idschool", wgtlevel2="one",  se=FALSE,
##D                 recov_constraint=recov_constraint )
##D summary(mod2e)
##D 
##D #############################################################################
##D # SIMULATED EXAMPLE 2: Two-level regression with random slopes
##D #############################################################################
##D 
##D #--- (1) simulate data
##D set.seed(9876)
##D NC <- 100    # number of clusters
##D Nj <- 20     # number of persons per cluster
##D iccx <- .4   # intra-class correlation predictor
##D theta <- c( 0.7, .3 )    # fixed effects
##D Tmat <- diag( c(.3, .1 ) ) # variances of random intercept and slope
##D sig2 <- .60    # residual variance
##D N <- NC*Nj
##D idcluster <- rep( 1:NC, each=Nj )
##D dat1 <- data.frame("idcluster"=idcluster )
##D dat1$X <- rep( stats::rnorm( NC, sd=sqrt(iccx) ), each=Nj ) +
##D                  stats::rnorm( N, sd=sqrt( 1 - iccx) )
##D dat1$Y <- theta[1] + rep( stats::rnorm(NC, sd=sqrt(Tmat[1,1] ) ), each=Nj ) +
##D       theta[2] + rep( stats::rnorm(NC, sd=sqrt(Tmat[2,2])), each=Nj )) * dat1$X +
##D       stats::rnorm(N, sd=sqrt(sig2) )
##D 
##D #--- (2) create design object
##D bdat1 <- BIFIEsurvey::BIFIE.data.jack( data=dat1, jktype="JK_GROUP", jkzone="idcluster")
##D summary(bdat1)
##D 
##D #*** Model 1: Random slope model (ML standard errors)
##D 
##D #- estimation using BIFIE.twolevelreg
##D mod1a <- BIFIEsurvey::BIFIE.twolevelreg( BIFIEobj=bdat1, dep="Y",
##D                 formula.fixed=~ 1+X, formula.random=~ 1+X, idcluster="idcluster",
##D                 wgtlevel2="one",  se=FALSE )
##D summary(mod1a)
##D 
##D #- estimation in lme4
##D mod1b <- lme4::lmer( Y ~ X + ( 1+X | idcluster), data=dat1, REML=FALSE  )
##D summary(mod1b)
##D 
##D #- using Jackknife for inference
##D mod1c <- BIFIEsurvey::BIFIE.twolevelreg( BIFIEobj=bdat1, dep="Y",
##D                 formula.fixed=~ 1+X, formula.random=~ 1+X, idcluster="idcluster",
##D                 wgtlevel2="one",  se=TRUE )
##D summary(mod1c)
##D 
##D # extract coefficients
##D coef(mod1a)
##D coef(mod1c)
##D # covariance matrix
##D vcov(mod1a)
##D vcov(mod1c)
## End(Not run)



