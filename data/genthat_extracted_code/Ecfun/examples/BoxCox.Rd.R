library(Ecfun)


### Name: BoxCox
### Title: Box-Cox power transformation and its inverse
### Aliases: BoxCox invBoxCox
### Keywords: manip

### ** Examples

##
## 1.  A simple example to check the two algorithms 
##
Days <- 0:9
bc1 <- BoxCox(Days, c(0.01, 1))
# Taylor expansion used for obs 1:7; expm1 for 8:10 

# check 
GM <- exp(mean(log(abs(Days+1))))

bc0 <- (((Days+1)^0.01)-1)/0.01
bc1. <- (bc0 / (GM^(0.01-1)))  
# log(Days+1) ranges from 0 to 4.4 
# lambda = 0.01 will invoke both the obvious
# algorithm and the alternative assumed to be 
# more accurate for (lambda(log(y)) < 0.02).  
attr(bc1., 'lambda') <- c(0.01, 1)  
attr(bc1., 'rescale') <- TRUE 
attr(bc1., 'GeometricMean') <- GM 
class(bc1.) <- 'BoxCox'

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(bc1, bc1.)
## Don't show: 
)
## End(Don't show)

##
## 2.  The "boxcox" function in the MASS package 
##     computes a maximum likelihood estimate with  
##     BoxCox(Days+1, lambda=0.21) 
##     with a 95 percent confidence interval of 
##     approximately (0.08, 0.35)
##
bcDays1 <- BoxCox(MASS::quine$Days, c(0.21, 1))

# check 
GeoMean <- exp(mean(log(abs(MASS::quine$Days+1))))

bcDays1. <- ((((MASS::quine$Days+1)^0.21)-1) / 
               (0.21*GeoMean^(0.21-1)))  
# log(Days+1) ranges from 0 to 4.4 
attr(bcDays1., 'lambda') <- c(0.21, 1)  
attr(bcDays1., 'rescale') <- TRUE 
attr(bcDays1., 'GeometricMean') <- GeoMean 
class(bcDays1.) <- 'BoxCox'

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(bcDays1, bcDays1.)
## Don't show: 
)
## End(Don't show)

iDays <- invBoxCox(bcDays1)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(iDays, MASS::quine$Days)
## Don't show: 
)
## End(Don't show)

##
## 3.  Easily computed example 
##
bc2 <- BoxCox(c(1, 4), 2)

# check 
bc2. <- (c(1, 4)^2-1)/4
attr(bc2., 'lambda') <- 2
attr(bc2., 'rescale') <- TRUE 
attr(bc2., 'GeometricMean') <- 2 
class(bc2.) <- 'BoxCox'

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(bc2, bc2.)
## Don't show: 
)
## End(Don't show)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(invBoxCox(bc2), c(1, 4))
## Don't show: 
)
## End(Don't show)

##
## 4.  plot(BoxCox())
##
y0 <- seq(-2, 2, .1)
z2 <- BoxCox(y0, 2, rescale=FALSE)
plot(y0, z2)

# check 
z2. <- (sign(y0)*y0^2-1)/2

attr(z2., 'lambda') <- 2
attr(z2., 'sign.y') <- sign(y0, 1)
attr(z2., 'rescale') <- FALSE 
attr(z2., 'GeometricMean') <- 0
class(z2.) <- 'BoxCox'

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(z2, z2.)
## Don't show: 
)
## End(Don't show)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(invBoxCox(z2), y0)
## Don't show: 
)
## End(Don't show)




