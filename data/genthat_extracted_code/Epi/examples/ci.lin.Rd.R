library(Epi)


### Name: ci.lin
### Title: Compute linear functions of parameters with standard errors and
###   confidence limits
### Aliases: ci.lin ci.mat ci.exp ci.pred ci.ratio Wald
### Keywords: models regression

### ** Examples

# Bogus data:
f <- factor( sample( letters[1:5], 200, replace=TRUE ) )
g <- factor( sample( letters[1:3], 200, replace=TRUE ) )
x <- rnorm( 200 )
y <- 7 + as.integer( f ) * 3 + 2 * x + 1.7 * rnorm( 200 )

# Fit a simple model:
mm <- lm( y ~ x + f + g )
ci.lin( mm )
ci.lin( mm, subset=3:6, diff=TRUE, fnam=FALSE )
ci.lin( mm, subset=3:6, diff=TRUE, fnam=TRUE )
ci.lin( mm, subset="f", diff=TRUE, fnam="f levels:" )
print( ci.lin( mm, subset="g", diff=TRUE, fnam="gee!:", vcov=TRUE ) )

# Use character defined subset to get ALL contrasts:
ci.lin( mm, subset="f", diff=TRUE )

# Suppose the x-effect differs across levels of g:
mi <- update( mm, . ~ . + g:x )
ci.lin( mi )
# RR a vs. b by x:
nda <- data.frame( x=-3:3, g="a", f="b" )
ndb <- data.frame( x=-3:3, g="b", f="b" )
# 
ci.lin( mi, list(nda,ndb) )
# Same result if f column is omitted because "f" columns are identical
ci.lin( mi, list(nda[,-3],ndb[,-3]) )
# However, Crashes if knots in spline is supplied, and non-factor omitted
xk <- -1:1
xi <- c(-0.5,0.5)
ww <- rnorm(200)
mi <- update( mm, . ~ . -x +ww + Ns(x,knots=xk) + g:Ns(x,knots=xi) )
# Will crash 
try( cbind( nda$x, ci.lin( mi, list(nda,ndb) ) ) )
# Must specify num vars (not factors) omitted from nda, ndb
cbind( nda$x, ci.lin( mi, list(nda,ndb), xvars="ww" ) )

# A Wald test of whether the g-parameters are 0
Wald( mm, subset="g" )
# Wald test of whether the three first f-parameters are equal:
( CM <- rbind( c(1,-1,0,0), c(1,0,-1,0)) )
Wald( mm, subset="f", ctr.mat=CM )
# or alternatively
( CM <- rbind( c(1,-1,0,0), c(0,1,-1,0)) )
Wald( mm, subset="f", ctr.mat=CM )

# Confidence intervals for ratio of rates
# Rates and ci supplied, but only the range (lower and upper ci) is used
ci.ratio( cbind(10,8,12.5), cbind(5,4,6.25) )
ci.ratio( cbind(8,12.5), cbind(4,6.25) )

# Beware of the offset when making predictions with ci.pred and ci.exp
## Not run: 
##D library( mgcv )
##D data( mortDK )
##D m.arg  <- glm( dt ~ age , offset=log(risk) , family=poisson, data=mortDK )
##D m.form <- glm( dt ~ age + offset(log(risk)), family=poisson, data=mortDK )
##D a.arg  <- gam( dt ~ age , offset=log(risk) , family=poisson, data=mortDK )
##D a.form <- gam( dt ~ age + offset(log(risk)), family=poisson, data=mortDK )
##D 
##D nd <- data.frame( age=60:65, risk=100 )
##D round( ci.pred( m.arg , nd ), 4 )
##D round( ci.pred( m.form, nd ), 4 )
##D round( ci.exp ( m.arg , nd ), 4 )
##D round( ci.exp ( m.form, nd ), 4 )
##D round( ci.pred( a.arg , nd ), 4 )
##D round( ci.pred( a.form, nd ), 4 )
##D round( ci.exp ( a.arg , nd ), 4 )
##D round( ci.exp ( a.form, nd ), 4 )
##D 
##D nd <- data.frame( age=60:65 )
##D try( ci.pred( m.arg , nd ) )
##D try( ci.pred( m.form, nd ) )
##D try( ci.exp ( m.arg , nd ) )
##D try( ci.exp ( m.form, nd ) )
##D try( ci.pred( a.arg , nd ) )
##D try( ci.pred( a.form, nd ) )
##D try( ci.exp ( a.arg , nd ) )
##D try( ci.exp ( a.form, nd ) )
## End(Not run)
# The offset may be given as an argument (offset=log(risk))
# or as a term (+offset(log)), and depending on whether we are using a
# glm or a gam Poisson model and whether we use ci.pred or ci.exp to
# predict rates the offset is either used or ignored and either
# required or not; the state of affairs can be summarized as:
#
#                     offset
#                     -------------------------------------
#                     usage                 required?
#                     ------------------    ---------------                      
# function  model     argument   term       argument   term
# ---------------------------------------------------------
# ci.pred   glm       used       used       yes        yes
#           gam       ignored    used       no         yes
#  		      
# ci.exp    glm       ignored    ignored    no         yes
#           gam       ignored    ignored    no         yes
# ---------------------------------------------------------



