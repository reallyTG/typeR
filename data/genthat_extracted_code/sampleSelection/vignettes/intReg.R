### R code from vignette source 'intReg.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: intReg.Rnw:203-214
###################################################
library( "mvtnorm" )
library( "maxLik" )
x1 <- 0.4
x2 <- -0.3
rho <- -0.6
sigma <-  matrix( c( 1, rho, rho, 1 ), nrow = 2 )

dens <- dmvnorm( c( x1, x2 ), sigma = sigma )
print( dens )
all.equal( dens, ( 2 * pi * sqrt( 1 - rho^2 ) )^(-1) *
   exp( - ( x1^2 - 2 * rho * x1 * x2 + x2^2 ) / ( 2 * ( 1 - rho^2 ) ) ) )


###################################################
### code chunk number 2: intReg.Rnw:260-263
###################################################
all.equal( dens, dnorm( x1, rho * x2, sqrt( 1 - rho^2 ) ) * dnorm(x2) )
all.equal( dens, ( dnorm( ( x1 - rho * x2 ) / sqrt( 1 - rho^2 ) ) /
   sqrt( 1 - rho^2 ) ) * dnorm(x2) )


###################################################
### code chunk number 3: intReg.Rnw:273-313
###################################################
funX2 <- function( a2 ) {
   prob <- pmvnorm( upper = c( x1, a2 ), sigma = sigma )
   return( prob )
}
grad <- c( numericGradient( funX2, x2 ) )
print( grad )

funX1 <- function( a1 ) {
   dens <- rep( NA, length( a1 ) )
   for( i in 1:length( a1 ) ) {
      dens[i] <- dmvnorm( c( a1[i], x2 ), sigma = sigma )
   }
   return( dens )
}
all.equal( grad, integrate( funX1, lower = -Inf, upper = x1 )$value )


funX1a <- function( a1 ) {
   dens <- rep( NA, length( a1 ) )
   for( i in 1:length( a1 ) ) {
      dens[i] <- ( dnorm( ( a1[i] - rho * x2 ) / sqrt( 1 - rho^2 ) ) /
            sqrt(1-rho^2) ) * dnorm(x2)
   }
   return( dens )
}
all.equal( grad, integrate( funX1a, lower = -Inf, upper = x1 )$value )

funX1b <- function( a1 ) {
   dens <- rep( NA, length( a1 ) )
   for( i in 1:length( a1 ) ) {
      dens[i] <- dnorm( ( a1[i] - rho * x2 ) / sqrt( 1 - rho^2 ) ) /
         sqrt(1-rho^2)
   }
   return( dens )
}
all.equal( grad,
   integrate( funX1b, lower = -Inf, upper = x1 )$value * dnorm(x2) )

all.equal( grad,
   pnorm( ( x1 - rho * x2 ) / sqrt( 1 - rho^2 ) ) * dnorm( x2 ) )


###################################################
### code chunk number 4: intReg.Rnw:485-502
###################################################
# Numerical gradient of the PDF w.r.t. rho
funrho <- function( p ) {
   prob <- dmvnorm( x = c( x1, x2 ),
      sigma = matrix( c( 1, p, p, 1 ), nrow = 2 ) )
   return( prob )
}
grad <- c( numericGradient( funrho, rho ) )
print( grad )

# Comparison with analytical gradient for rho
efun <- exp(-(x1^2 - 2 * rho * x1 * x2 + x2^2)/(2*(1 - rho^2)))

all.equal( grad, 
( (-((2*rho*(-2*rho*x1*x2+x1^2+x2^2) - 2*x1*x2*(1-rho^2)) * efun)/
    (2*(1-rho^2)^(3/2) )) +
    ((rho*efun)/(sqrt(1-rho^2))) ) /
    (2*pi*(1-rho^2)) )


###################################################
### code chunk number 5: intReg.Rnw:504-524
###################################################
#Eq??
all.equal(grad,
    (1/(2*pi)) * (
    ((((-4*rho*(x1^2-2*rho*x1*x2+x2^2)-2*(1-rho^2)*(-2*x1*x2))/(4*(1-rho^2)^2)) * 
            efun * sqrt(1-rho^2))/(1-rho^2)) - 
            ((-(rho/(sqrt(1-rho^2)))*efun)/(1-rho^2))
    ))
#Eq??
all.equal(grad,
    (1/(2*pi)) * 
    ((rho/((1-rho^2)^(3/2))) - ((rho*(x1^2-rho*x1*x2+x2^2)-x1*x2)/
            ((1-rho^2)^(5/2)))) * efun
    )

#Eq??
all.equal(grad,
    (1/(2*pi*sqrt(1-rho^2))) * 
    (((rho/(1-rho^2)) - ((rho*(x1^2-rho*x1*x2+x2^2)-x1*x2)/
            ((1-rho^2)^2))) * efun)
    )


###################################################
### code chunk number 6: intReg.Rnw:527-553
###################################################
# Numerical gradient of the CDF w.r.t. rho
cdfRho <- function( p, xa = x1, xb = x2 ) {
   prob <- pmvnorm( upper = c( xa, xb ),
      sigma = matrix( c( 1, p, p, 1 ), nrow = 2 ) )
   return( prob )
}
grad <- c( numericGradient( cdfRho, rho ) )
print( grad )

# comparison with analytical gradient
all.equal( grad, dmvnorm( x = c( x1, x2 ),
      sigma = matrix( c( 1, rho, rho, 1 ), nrow = 2 ) ) )

# comparisons with other values
compDerivRho <- function( xa, xb, p ) {
   dn <- c( numericGradient( cdfRho, p, xa = xa, xb = xb ) )
   da <- dmvnorm( x = c( xa, xb ),
      sigma = matrix( c( 1, p, p, 1 ), nrow = 2 ) )
   return( all.equal( dn, da ) )
}
compDerivRho( x1, x2, rho )
compDerivRho( 0.5, x2, rho )
compDerivRho( 2.5, x2, rho )
compDerivRho( x1, -2, rho )
compDerivRho( x1, x2, 0.2 )
compDerivRho( x1, x2, 0.98 ) 


###################################################
### code chunk number 7: intReg.Rnw:967-998
###################################################
library( "mvtnorm" )
# number of observations
nObs <- 300
# parameters
betaS <- c( 1, 1, -1 )
betaO <- c( 10, 4 )
rho <- 0.4
sigma <- 5
# boundaries of the intervals
bound <- c(-Inf,5,15,Inf)

# set 'seed' of the pseudo random number generator
# in order to always generate the same pseudo random numbers
set.seed(123)
# generate variables x1 and x2
dat <- data.frame( x1 = rnorm( nObs ), x2 = rnorm( nObs ) )
# variance-covariance matrix of the two error terms
vcovMat <- matrix( c( 1, rho*sigma, rho*sigma, sigma^2 ), nrow = 2 )
# generate the two error terms
eps <- rmvnorm( nObs, sigma = vcovMat )
dat$epsS <- eps[,1]
dat$epsO <- eps[,2]
# generate the selection variable
dat$yS <- with( dat, betaS[1] + betaS[2] * x1 + betaS[3] * x2 + epsS ) > 0
table( dat$yS )
# generate the unobserved/latent outcome variable
dat$yOu <- with( dat, betaO[1] + betaO[2] * x1 + epsO )
dat$yOu[ !dat$yS ] <- NA
# obtain the intervals of the outcome variable
dat$yO <- cut( dat$yOu, bound )
table( dat$yO )


###################################################
### code chunk number 8: intReg.Rnw:1008-1012
###################################################
library( "sampleSelection" )
res <- selection( yS ~ x1 + x2, yO ~ x1, data = dat, boundaries = bound )
res
summary( res )


###################################################
### code chunk number 9: intReg.Rnw:1021-1025
###################################################
res2 <- selection( yS ~ x1 + x2, yO ~ x1, data = dat, boundaries = bound, 
   start = "2step" )
res2
summary( res2 )


###################################################
### code chunk number 10: intReg.Rnw:1030-1035
###################################################
# compare starting values (small differences)
cbind( res$start, res2$start, res$start - res2$start )

# combare estimated coefficients (virtually identical)
cbind( coef( res ), coef( res2 ), coef( res ) - coef( res2 ) )


###################################################
### code chunk number 11: intReg.Rnw:1042-1043
###################################################
data( "Smoke" )


###################################################
### code chunk number 12: intReg.Rnw:1047-1048
###################################################
bounds <- c( 0, 5, 10, 20, 50, Inf )


###################################################
### code chunk number 13: intReg.Rnw:1052-1054
###################################################
SmokeRes1 <- selection( smoker ~ educ + age, 
  cigs_intervals ~ educ, data = Smoke, boundaries = bounds )


###################################################
### code chunk number 14: intReg.Rnw:1058-1061
###################################################
SmokeRes2 <- selection( smoker ~ educ + age + restaurn, 
  cigs_intervals ~ educ + income + restaurn, data = Smoke, 
  boundaries = bounds )


###################################################
### code chunk number 15: intReg.Rnw:1067-1070
###################################################
library( "lmtest" )
lrtest( SmokeRes1, SmokeRes2 )
waldtest( SmokeRes1, SmokeRes2 )


