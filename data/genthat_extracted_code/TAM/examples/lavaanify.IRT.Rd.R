library(TAM)


### Name: lavaanify.IRT
### Title: Slight Extension of the 'lavaan' Syntax, with Focus on Item
###   Response Models
### Aliases: lavaanify.IRT
### Keywords: lavaan

### ** Examples

library(lavaan)

#############################################################################
# EXAMPLE 1: lavaan syntax with guessing and slipping parameters
#############################################################################

# define model in lavaan
lavmodel <- "
    F=~ A1+c*A2+A3+A4
    # define slipping parameters for A1 and A2
    A1 + A2 ?=s1
    # joint guessing parameter for A1 and A2
    A1+A2 ?=c1*g1
    A3 | 0.75*t1
    # fix guessing parameter to .25 and
    # slipping parameter to .01 for item A3
    A3 ?=.25*g1+.01*s1
    A4 ?=c2*g1
    A1 | a*t1
    A2 | b*t1
      "

# process lavaan syntax
lavpartable <- TAM::lavaanify.IRT(lavmodel)$lavpartable
  ##     id lhs op rhs user group free ustart exo label eq.id unco
  ##  1   1   F=~  A1    1     1    1     NA   0           0    1
  ##  2   2   F=~  A2    1     1    2     NA   0     c     0    2
  ##  3   3   F=~  A3    1     1    3     NA   0           0    3
  ##  4   4   F=~  A4    1     1    4     NA   0           0    4
  ##  5   5  A3  |  t1    1     1    0   0.75   0           0    0
  ##  6   6  A1  |  t1    1     1    5     NA   0     a     0    5
  ##  7   7  A2  |  t1    1     1    6     NA   0     b     0    6
  ##  8   8  A1 ?=s1    1     1    7     NA   0           0    7
  ##  9   9  A2 ?=s1    1     1    8     NA   0           0    8
  ##  10 10  A1 ?=g1    1     1    9     NA   0    c1     1    9
  ##  11 11  A2 ?=g1    1     1    9     NA   0    c1     1   10
  ##  12 12  A3 ?=g1    1     1    0   0.25   0           0    0
  ##  13 13  A3 ?=s1    1     1    0   0.01   0           0    0
  ##  14 14  A4 ?=g1    1     1   10     NA   0    c2     0   11

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Usage of "__" and "?=" operators
##D #############################################################################
##D 
##D library(sirt)
##D data(data.read, package="sirt")
##D dat <- data.read
##D items <- colnames(dat)
##D 
##D lavmodel <- "
##D    F1=~ A1+A2+ A3+lam4*A4
##D    # equal item loadings for items B1 to B4
##D    F2=~ lam5*B1__B4
##D    # different labelled item loadings of items C1 to C4
##D    F3=~ lam9__lam12*C1__C4
##D    # item intercepts
##D    B1__B2 | -0.5*t1
##D    B3__C1 | int6*t1
##D    # guessing parameters
##D    C1__C3 ?=g1
##D    C4 + B1__B3 ?=0.2*g1
##D    # slipping parameters
##D    A1__B1 + B3__C2 ?=slip1*s1
##D    # residual variances
##D    B1__B3 ~~ errB*B1__B3
##D    A2__A4 ~~ erra1__erra3*A2__A4
##D     "
##D lav2 <- TAM::lavaanify.IRT( lavmodel, data=dat)
##D lav2$lavpartable
##D cat( lav2$lavaan.syntax )
##D 
##D #** simplified example
##D lavmodel <- "
##D    F1=~ A1+lam4*A2+A3+lam4*A4
##D    F2=~ lam5__lam8*B1__B4
##D    F1 ~~ F2
##D    F1 ~~ 1*F1
##D    F2 ~~ 1*F2
##D     "
##D lav3 <- TAM::lavaanify.IRT( lavmodel, data=dat)
##D lav3$lavpartable
##D cat( lav3$lavaan.syntax )
##D 
##D #############################################################################
##D # EXAMPLE 3: Nonlinear terms
##D #############################################################################
##D 
##D #*** define items
##D items <- paste0("I",1:12)
##D 
##D #*** define lavaan model
##D lavmodel <- "
##D    F1=~ I1__I5
##D    F2=~ I6__I9
##D    F3=~ I10__I12
##D    # I3, I4 and I7 load on interaction of F1 and F2
##D    I(F1*F2)=~ a*I3+a*I4
##D    I(F1*F2)=~ I7
##D    # I3 and I5 load on squared factor F1
##D    I(F1^2)=~ I3 + I5
##D    # I1 regression on B spline version of factor F1
##D    I( bs(F1,4) )=~ I1
##D    F2 ~ F1 + b*I(F1^2) + I(F1>0)
##D    F3 ~ F1 + F2 + 1.4*I(F1*F2) + b*I(F1^2) + I(F2^2 )
##D    # F3 ~ F2 + I(F2^2)      # this line is ignored in the lavaan model
##D    F1 ~~ 1*F1
##D     "
##D 
##D #*** process lavaan syntax
##D lav3 <- TAM::lavaanify.IRT( lavmodel, items=items)
##D 
##D #*** inspect results
##D lav3$lavpartable
##D cat( lav3$lavaan.syntax )
##D lav3$nonlin_syntable
##D lav3$nonlin_factors
##D 
##D #############################################################################
##D # EXAMPLE 4: Using lavaanify.IRT for estimation with lavaan
##D #############################################################################
##D 
##D data(data.big5, package="sirt")
##D # extract first 10 openness items
##D items <- which( substring( colnames(data.big5), 1, 1 )=="O"  )[1:10]
##D dat <- as.data.frame( data.big5[, items ] )
##D   ##   > colnames(dat)
##D   ##    [1] "O3"  "O8"  "O13" "O18" "O23" "O28" "O33" "O38" "O43" "O48"
##D apply(dat,2,var)  # variances
##D 
##D #*** Model 1: Confirmatory factor analysis with one factor
##D lavmodel <- "
##D    O=~ O3__O48   # convenient syntax for defining the factor for all items
##D    O ~~ 1*O
##D    "
##D # process lavaan syntax
##D res <- TAM::lavaanify.IRT( lavmodel, data=dat )
##D # estimate lavaan model
##D mod1 <- lavaan::lavaan( model=res$lavaan.syntax, data=dat)
##D summary(mod1, standardized=TRUE, fit.measures=TRUE, rsquare=TRUE )
## End(Not run)

#############################################################################
# EXAMPLE 5: lavaanify.IRT with do statements
#############################################################################

lavmodel <- "
  DO(1,6,1)
    F=~ I%
  DOEND
  DO(1,5,2)
    A=~ I%
  DOEND
  DO(2,6,2)
    B=~ I%
  DOEND
  F ~~ 1*F
  A ~~ 1*A
  B ~~ 1*B
  F ~~ 0*A
  F ~~ 0*B
  A ~~ 0*B
   "
res <- TAM::lavaanify.IRT( lavmodel, items=paste("I",1:6) )
cat(res$lavaan.syntax)

#############################################################################
# EXAMPLE 6: Single indicator models with measurement error (MEASERR operator)
#############################################################################

# define lavaan model
lavmodel <- "
  ytrue ~ xtrue + z
  # exogeneous variable error-prone y with error variance .20
  MEASERR1(ytrue,y,.20)
  # exogeneous variable error-prone x with error variance .35
  MEASERR0(xtrue,x,.35)
  ytrue ~~ ytrue
    "
# observed items
items <- c("y","x","z")
# lavaanify
res <- TAM::lavaanify.IRT( lavmodel, items )
cat(res$lavaan.syntax)
  ##   > cat(res$lavaan.syntax)
  ##   ytrue~xtrue
  ##   ytrue~z
  ##   ytrue=~1*y
  ##   y~~0.2*y
  ##   xtrue=~1*x
  ##   x~~0.35*x
  ##   xtrue~~xtrue
  ##   ytrue~~ytrue
  ##   z~~z



