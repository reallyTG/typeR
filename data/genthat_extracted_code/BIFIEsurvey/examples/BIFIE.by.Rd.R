library(BIFIEsurvey)


### Name: BIFIE.by
### Title: Statistics for User Defined Functions
### Aliases: BIFIE.by summary.BIFIE.by coef.BIFIE.by vcov.BIFIE.by
### Keywords: User defined function summary coef vcov

### ** Examples

#############################################################################
# EXAMPLE 1: Imputed TIMSS dataset
#############################################################################

data(data.timss1)
data(data.timssrep)

# create BIFIE.dat object
bifieobj <- BIFIEsurvey::BIFIE.data( data.list=data.timss1, wgt=data.timss1[[1]]$TOTWGT,
           wgtrep=data.timssrep[, -1 ] )

#****************************
#*** Model 1: Weighted means (as a toy example)
userfct <- function(X,w){
        pars <- c( stats::weighted.mean( X[,1], w ),
                     stats::weighted.mean(X[,2], w )   )
        return(pars)
                        }
res1 <-  BIFIEsurvey::BIFIE.by( bifieobj, vars=c("ASMMAT", "migrant", "books"),
                userfct=userfct, userparnames=c("MW_MAT", "MW_Migr"),
                group="female" )
summary(res1)

# evaluate function in pure R implementation using the use_Rcpp argument
res1b <-  BIFIEsurvey::BIFIE.by( bifieobj, vars=c("ASMMAT", "migrant", "books" ),
                userfct=userfct, userparnames=c("MW_MAT", "MW_Migr"),
                group="female", use_Rcpp=FALSE )
summary(res1b)

#--- statistical inference for a derived parameter (see ?BIFIE.derivedParameters)
# define gender difference for mathematics score (divided by 100)
derived.parameters <- list(
        "gender_diff"=~ 0 + I( ( MW_MAT_female1 - MW_MAT_female0 ) / 100 )
                            )
# inference derived parameter
res1d <- BIFIEsurvey::BIFIE.derivedParameters( res1,
                derived.parameters=derived.parameters )
summary(res1d)

## Not run: 
##D #****************************
##D #**** Model 2: Robust linear model
##D 
##D # (1) start from scratch to formulate the user function for X and w
##D dat1 <- bifieobj$dat1
##D vars <- c("ASMMAT", "migrant", "books" )
##D X <- dat1[,vars]
##D w <- bifieobj$wgt
##D library(MASS)
##D # ASMMAT ~ migrant + books
##D mod <- MASS::rlm( X[,1] ~  as.matrix( X[, -1 ] ), weights=w )
##D coef(mod)
##D # (2) define a user function "my_rlm"
##D my_rlm <- function(X,w){
##D     mod <- MASS::rlm( X[,1] ~  as.matrix( X[, -1 ] ), weights=w )
##D     return( coef(mod) )
##D                 }
##D # (3) estimate model
##D res2 <-  BIFIEsurvey::BIFIE.by( bifieobj, vars, userfct=my_rlm,
##D                 group="female", group_values=0:1)
##D summary(res2)
##D # estimate model without computing standard errors
##D res2a <-  BIFIEsurvey::BIFIE.by( bifieobj, vars, userfct=my_rlm,
##D                 group="female", se=FALSE)
##D summary(res2a)
##D 
##D # define a user function with formula language
##D my_rlm2 <- function(X,w){
##D     colnames(X) <- vars
##D     X <- as.data.frame(X)
##D     mod <- MASS::rlm( ASMMAT ~  migrant + books, weights=w, data=X)
##D     return( coef(mod) )
##D                 }
##D # estimate model
##D res2b <-  BIFIEsurvey::BIFIE.by( bifieobj, vars, userfct=my_rlm2,
##D                 group="female", group_values=0:1)
##D summary(res2b)
##D 
##D 
##D #****************************
##D #**** Model 3: Number of unique values for variables in BIFIEdata
##D 
##D #*** define variables for which the number of unique values should be calculated
##D vars <- c( "female", "books","ASMMAT" )
##D #*** define a user function extracting these unqiue values
##D userfct <- function(X,w){
##D         pars <- apply( X, 2, FUN=function(vv){
##D                      length( unique(vv))  } )
##D         # Note that weights are (of course) ignored in this function
##D         return(pars)
##D                         }
##D #*** extract number of unique values
##D res3 <-  BIFIEsurvey::BIFIE.by( bifieobj, vars=vars, userfct=userfct,
##D               userparnames=paste0( vars, "_Nunique"),  se=FALSE )
##D summary(res3)
##D   ##   Statistical Inference for User Definition Function
##D   ##               parm Ncases  Nweight    est
##D   ##   1 female_Nunique   4668 78332.99    2.0
##D   ##   2  books_Nunique   4668 78332.99    5.0
##D   ##   3 ASMMAT_Nunique   4668 78332.99 4613.4
##D # number of unique values in each of the five imputed datasets
##D res3$output$parsrepM
##D   ##        [,1] [,2] [,3] [,4] [,5]
##D   ##   [1,]    2    2    2    2    2
##D   ##   [2,]    5    5    5    5    5
##D   ##   [3,] 4617 4619 4614 4609 4608
##D 
##D #****************************
##D #**** Model 4: Estimation of a lavaan model with BIFIE.by
##D 
##D #* estimate model in lavaan
##D 
##D data0 <- data.timss1[[1]]
##D # define lavaan model
##D lavmodel <- "
##D   ASSSCI ~ likesc
##D   ASSSCI ~~ ASSSCI
##D   likesc ~ female
##D   likesc ~~ likesc
##D   female ~~ female
##D "
##D 
##D mod0 <- lavaan::lavaan(lavmodel, data=data0, sampling.weights="TOTWGT")
##D summary(mod0, stand=TRUE, fit.measures=TRUE)
##D 
##D #* construct input for BIFIE.by
##D vars <- c("ASSSCI","likesc","female","TOTWGT")
##D X <- data0[,vars]
##D mod0 <- lavaan::lavaan(lavmodel, data=X, sampling.weights="TOTWGT")
##D w <- data0$TOTWGT
##D 
##D #* define user function
##D userfct <- function(X,w){
##D   X1 <- as.data.frame(X)
##D   colnames(X1) <- vars
##D   X1$studwgt <- w
##D   mod0 <- lavaan::lavaan(lavmodel, data=X1, sampling.weights="TOTWGT")
##D   pars <- coef(mod0)
##D   # extract some fit statistics
##D   pars2 <- lavaan::fitMeasures(mod0)
##D   pars <- c(pars, pars2[c("cfi","tli")])
##D   return(pars)
##D }
##D 
##D #* test function
##D res0 <- userfct(X,w)
##D userparnames <- names(res0)
##D 
##D #* estimate lavaan model with replicated sampling weights
##D res1 <-  BIFIEsurvey::BIFIE.by( bifieobj, vars=vars, userfct=userfct,
##D                   userparnames=userparnames, use_Rcpp=FALSE )
##D summary(res1)
## End(Not run)



