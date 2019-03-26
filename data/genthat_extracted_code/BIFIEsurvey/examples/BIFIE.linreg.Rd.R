library(BIFIEsurvey)


### Name: BIFIE.linreg
### Title: Linear Regression
### Aliases: BIFIE.linreg summary.BIFIE.linreg coef.BIFIE.linreg
###   vcov.BIFIE.linreg
### Keywords: Linear regression summary coef vcov

### ** Examples

#############################################################################
# EXAMPLE 1: Imputed TIMSS dataset
#############################################################################

data(data.timss1)
data(data.timssrep)

# create BIFIE.dat object
bdat <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
             wgtrep=data.timssrep[, -1 ] )

#**** Model 1: Linear regression for mathematics score
mod1 <- BIFIEsurvey::BIFIE.linreg( bdat, dep="ASMMAT", pre=c("one","books","migrant"),
              group="female" )
summary(mod1)

## Not run: 
##D # same model but specified with R formulas
##D mod1a <- BIFIEsurvey::BIFIE.linreg( bdat, formula=ASMMAT ~ books + migrant,
##D                group="female", group_values=0:1 )
##D summary(mod1a)
##D 
##D # compare result with lm function and first imputed dataset
##D dat1 <- data.timss1[[1]]
##D mod1b <- stats::lm( ASMMAT ~ 0 + as.factor(female) + as.factor(female):books +
##D                               as.factor(female):migrant,
##D                          data=dat1,  weights=dat1$TOTWGT )
##D summary(mod1b)
##D 
##D #**** Model 2: Like Model 1, but books is now treated as a factor
##D mod2 <- BIFIEsurvey::BIFIE.linreg( bdat, formula=ASMMAT ~ as.factor(books) + migrant)
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 2: PISA data | Nonlinear regression models
##D #############################################################################
##D 
##D data(data.pisaNLD)
##D data <- data.pisaNLD
##D 
##D #--- Create BIFIEdata object immediately using BIFIE.data.jack function
##D bdat <- BIFIEsurvey::BIFIE.data.jack( data.pisaNLD, jktype="RW_PISA", cdata=TRUE)
##D summary(bdat)
##D 
##D #****************************************************
##D #*** Model 1: linear regression
##D mod1 <- BIFIEsurvey::BIFIE.linreg( bdat, formula=MATH ~ HISEI )
##D summary(mod1)
##D 
##D #****************************************************
##D #*** Model 2: Cubic regression
##D mod2 <- BIFIEsurvey::BIFIE.linreg( bdat,
##D               formula=MATH ~ HISEI + I(HISEI^2) + I(HISEI^3) )
##D summary(mod2)
##D 
##D #****************************************************
##D #*** Model 3: B-spline regression
##D 
##D # test with design of HISEI values
##D dfr <- data.frame("HISEI"=16:90 )
##D des <- stats::model.frame( ~ splines::bs( HISEI, df=5 ), dfr )
##D des <- des$splines
##D plot( dfr$HISEI, des[,1], type="l", pch=1, lwd=2, ylim=c(0,1) )
##D for (vv in 2:ncol(des) ){
##D     lines( dfr$HISEI, des[,vv], lty=vv, col=vv, lwd=2)
##D }
##D 
##D # apply B-spline regression in BIFIEsurvey::BIFIE.linreg
##D mod3 <- BIFIEsurvey::BIFIE.linreg( bdat, formula=MATH ~ splines::bs(HISEI,df=5) )
##D summary(mod3)
##D 
##D #*** include transformed HISEI values for B-spline matrix in bdat
##D bdat2 <- BIFIEsurvey::BIFIE.data.transform( bdat, ~ 0 + splines::bs( HISEI, df=5 ))
##D bdat2$varnames[ bdat2$varsindex.added ] <- paste0("HISEI_bsdes",
##D             seq( 1, length( bdat2$varsindex.added ) ) )
##D 
##D #****************************************************
##D #*** Model 4: Nonparametric regression using BIFIE.by
##D 
##D ?BIFIE.by
##D 
##D #---- (1) test function with one dataset
##D dat1 <- bdat$dat1
##D vars <- c("MATH", "HISEI")
##D X <- dat1[,vars]
##D w <- bdat$wgt
##D X <- as.data.frame(X)
##D # estimate model
##D mod <- stats::loess( MATH ~ HISEI, weights=w, data=X )
##D 
##D # predict HISEI values
##D hisei_val <- data.frame( "HISEI"=seq(16,90) )
##D y_pred <- stats::predict( mod, hisei_val )
##D graphics::plot( hisei_val$HISEI, y_pred, type="l")
##D 
##D #--- (2) define loess function
##D loess_fct <- function(X,w){
##D     X1 <- data.frame( X, w )
##D     colnames(X1) <- c( vars, "wgt")
##D     X1 <- stats::na.omit(X1)
##D #    mod <- stats::lm( MATH ~ HISEI, weights=X1$wgt, data=X1 )
##D     mod <- stats::loess( MATH ~ HISEI, weights=X1$wgt, data=X1 )
##D     y_pred <- stats::predict( mod, hisei_val )
##D     return(y_pred)
##D }
##D 
##D #--- (3) estimate model
##D mod4 <-  BIFIEsurvey::BIFIE.by( bdat, vars, userfct=loess_fct )
##D summary(mod4)
##D 
##D # plot linear function pointwise and confidence intervals
##D graphics::plot( hisei_val$HISEI, mod4$stat$est, type="l", lwd=2,
##D         xlab="HISEI", ylab="PVMATH", ylim=c(430,670) )
##D graphics::lines( hisei_val$HISEI, mod4$stat$est - 1.96* mod4$stat$SE, lty=3 )
##D graphics::lines( hisei_val$HISEI, mod4$stat$est + 1.96* mod4$stat$SE, lty=3 )
## End(Not run)



