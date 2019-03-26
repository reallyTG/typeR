library(BIFIEsurvey)


### Name: BIFIE.pathmodel
### Title: Path Model Estimation
### Aliases: BIFIE.pathmodel summary.BIFIE.pathmodel coef.BIFIE.pathmodel
###   vcov.BIFIE.pathmodel
### Keywords: Linear regression summary coef vcov

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Path model data.bifie01
##D #############################################################################
##D 
##D data(data.bifie01)
##D dat <- data.bifie01
##D # create dataset with replicate weights and plausible values
##D bifieobj <- BIFIEsurvey::BIFIE.data.jack( data=dat,  jktype="JK_TIMSS",
##D                 jkzone="JKCZONE", jkrep="JKCREP", wgt="TOTWGT",
##D                 pv_vars=c("ASMMAT","ASSSCI") )
##D 
##D #**************************************************************
##D #*** Model 1: Path model
##D lavmodel1 <- "
##D      ASMMAT ~ ASBG07A + ASBG07B  + ASBM03 + ASBM02A + ASBM02E
##D      # define latent variable with 2nd and 3rd item in reversed scoring
##D      ASBM03=~ 1*ASBM03A + (-1)*ASBM03B + (-1)*ASBM03C + 1*ASBM03D
##D      ASBG07A ~ ASBM02E
##D      ASBG07A ~~ .2*ASBG07A    # measurement error variance of .20
##D      ASBM02E ~~ .45*ASBM02E     # measurement error variance of .45
##D      ASBM02E ~ ASBM02A + ASBM02B
##D         "
##D #--- Model 1a: model calculated by gender
##D mod1a <- BIFIEsurvey::BIFIE.pathmodel( bifieobj, lavmodel1, group="female" )
##D summary(mod1a)
##D 
##D #--- Model 1b: Input of some known reliabilities
##D reliability <- c( "ASBM02B"=.6, "ASBM02A"=.8 )
##D mod1b <- BIFIEsurvey::BIFIE.pathmodel( bifieobj, lavmodel1, reliability=reliability)
##D summary(mod1b)
##D 
##D #**************************************************************
##D #*** Model 2: Linear regression with errors in predictors
##D 
##D # specify lavaan model
##D lavmodel2 <- "
##D      ASMMAT ~ ASBG07A + ASBG07B + ASBM03A
##D      ASBG07A ~~ .2*ASBG07A
##D         "
##D mod2 <- BIFIEsurvey::BIFIE.pathmodel( bifieobj, lavmodel2  )
##D summary(mod2)
## End(Not run)



