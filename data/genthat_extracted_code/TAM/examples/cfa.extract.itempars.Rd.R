library(TAM)


### Name: cfa.extract.itempars
### Title: Extracting Item Parameters from a Fitted 'cfa' Object in
###   'lavaan'
### Aliases: cfa.extract.itempars
### Keywords: Confirmatory factor analysis

### ** Examples

#############################################################################
# EXAMPLE 1: CFA data.Students
#############################################################################

library(lavaan)
library(CDM)

data(data.Students, package="CDM")
dat <- data.Students

dat1 <- dat[, paste0( "mj", 1:4 ) ]

#*** Model 1: Unidimensional model scale mj
lavmodel <- "
   mj=~ mj1 + mj2 + mj3 + mj4
   mj ~~ mj
     "
mod1 <- lavaan::cfa( lavmodel, data=dat1, std.lv=TRUE )
summary(mod1, standardized=TRUE, rsquare=TRUE )
# extract parameters
res1 <- TAM::cfa.extract.itempars( mod1 )

## Not run: 
##D #*** Model 2: Scale mj - explicit modelling of item intercepts
##D lavmodel <- "
##D    mj=~ mj1 + mj2 + mj3 + mj4
##D    mj ~~ mj
##D    mj1 ~ 1
##D      "
##D mod2 <- lavaan::cfa( lavmodel, data=dat1, std.lv=TRUE )
##D summary(mod2, standardized=TRUE, rsquare=TRUE )
##D res2 <- TAM::cfa.extract.itempars( mod2 )
##D 
##D #*** Model 3: Tau-parallel measurements scale mj
##D lavmodel <- "
##D    mj=~ a*mj1 + a*mj2 + a*mj3 + a*mj4
##D    mj ~~ 1*mj
##D    mj1 ~ b*1
##D    mj2 ~ b*1
##D    mj3 ~ b*1
##D    mj4 ~ b*1
##D      "
##D mod3 <- lavaan::cfa( lavmodel, data=dat1, std.lv=TRUE )
##D summary(mod3, standardized=TRUE, rsquare=TRUE )
##D res3 <- TAM::cfa.extract.itempars( mod3 )
##D 
##D #*** Model 4: Two-dimensional CFA with scales mj and sc
##D dat2 <- dat[, c(paste0("mj",1:4), paste0("sc",1:4)) ]
##D # lavaan model with shortage "__" operator
##D lavmodel <- "
##D    mj=~ mj1__mj4
##D    sc=~ sc1__sc4
##D    mj ~~ sc
##D    mj ~~ 1*mj
##D    sc ~~ 1*sc
##D      "
##D lavmodel <- TAM::lavaanify.IRT( lavmodel, data=dat2 )$lavaan.syntax
##D cat(lavmodel)
##D mod4 <- lavaan::cfa( lavmodel, data=dat2, std.lv=TRUE )
##D summary(mod4, standardized=TRUE, rsquare=TRUE )
##D res4 <- TAM::cfa.extract.itempars( mod4 )
## End(Not run)



