library(BIFIEsurvey)


### Name: BIFIE.logistreg
### Title: Logistic Regression
### Aliases: BIFIE.logistreg summary.BIFIE.logistreg coef.BIFIE.logistreg
###   vcov.BIFIE.logistreg
### Keywords: Logistic regression summary coef vcov

### ** Examples

#############################################################################
# EXAMPLE 1: TIMSS dataset | Logistic regression
#############################################################################

data(data.timss2)
data(data.timssrep)

# create BIFIE.dat object
bdat <- BIFIEsurvey::BIFIE.data( data.list=data.timss2, wgt=data.timss2[[1]]$TOTWGT,
                      wgtrep=data.timssrep[, -1 ] )

#**** Model 1: Logistic regression - prediction of migrational background
res1 <- BIFIEsurvey::BIFIE.logistreg( BIFIEobj=bdat, dep="migrant",
           pre=c("one","books","lang"), group="female", se=FALSE )
summary(res1)

## Not run: 
##D # same model, but with formula specification and standard errors
##D res1a <- BIFIEsurvey::BIFIE.logistreg( BIFIEobj=bdat,
##D               formula=migrant ~ books + lang, group="female"  )
##D summary(res1a)
##D 
##D #############################################################################
##D # SIMULATED EXAMPLE 2: Comparison of stats::glm and BIFIEsurvey::BIFIE.logistreg
##D #############################################################################
##D 
##D #*** (1) simulate data
##D set.seed(987)
##D N <- 300
##D x1 <- stats::rnorm(N)
##D x2 <- stats::runif(N)
##D ypred <- -0.75+.2*x1 + 3*x2
##D y <- 1*( stats::plogis(ypred) > stats::runif(N) )
##D data <- data.frame( "y"=y, "x1"=x1, "x2"=x2 )
##D 
##D #*** (2) estimation logistic regression using glm
##D mod1 <- stats::glm( y ~ x1 + x2, family="binomial")
##D 
##D #*** (3) estimation logistic regression using BIFIEdata
##D # create BIFIEdata object by defining 30 Jackknife zones
##D bifiedata <- BIFIEsurvey::BIFIE.data.jack( data, jktype="JK_RANDOM", ngr=30 )
##D summary(bifiedata)
##D # estimate logistic regression
##D mod2 <- BIFIEsurvey::BIFIE.logistreg( bifiedata, formula=y ~ x1+x2 )
##D 
##D #*** (4) compare results
##D summary(mod2)    # BIFIE.logistreg
##D summary(mod1)   # glm
## End(Not run)



