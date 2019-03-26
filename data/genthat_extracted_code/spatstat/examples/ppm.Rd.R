library(spatstat)


### Name: ppm
### Title: Fit Point Process Model to Data
### Aliases: ppm ppm.formula
### Keywords: spatial models

### ** Examples

 # fit the stationary Poisson process
 # to point pattern 'nztrees'

 ppm(nztrees ~ 1)

 ## Not run: 
##D  Q <- quadscheme(nztrees) 
##D  ppm(Q ~ 1) 
##D  # equivalent.
##D  
## End(Not run)

fit1 <- ppm(nztrees ~ x)
 # fit the nonstationary Poisson process 
 # with intensity function lambda(x,y) = exp(a + bx)
 # where x,y are the Cartesian coordinates
 # and a,b are parameters to be estimated

fit1
coef(fit1)
coef(summary(fit1))

## Not run: 
##D  ppm(nztrees ~ polynom(x,2))
## End(Not run)
## Don't show: 
 ppm(nztrees ~ polynom(x,2), nd=16)
## End(Don't show)

 # fit the nonstationary Poisson process 
 # with intensity function lambda(x,y) = exp(a + bx + cx^2)

 ## Not run: 
##D  library(splines)
##D  ppm(nztrees ~ bs(x,df=3))
##D  
## End(Not run)
 #       WARNING: do not use predict.ppm() on this result
 # Fits the nonstationary Poisson process 
 # with intensity function lambda(x,y) = exp(B(x))
 # where B is a B-spline with df = 3

## Not run: 
##D  ppm(nztrees ~ 1, Strauss(r=10), rbord=10)
## End(Not run)
## Don't show: 
 ppm(nztrees ~ 1, Strauss(r=10), rbord=10, nd=16)
## End(Don't show)
 # Fit the stationary Strauss process with interaction range r=10
 # using the border method with margin rbord=10

## Not run: 
##D  ppm(nztrees ~ x, Strauss(13), correction="periodic")
## End(Not run)
## Don't show: 
 ppm(nztrees ~ x, Strauss(13), correction="periodic", nd=16)
## End(Don't show)
 # Fit the nonstationary Strauss process with interaction range r=13
 # and exp(first order potential) =  activity = beta(x,y) = exp(a+bx)
 # using the periodic correction.


# Compare Maximum Pseudolikelihood, Huang-Ogata and Variational Bayes fits:
## Not run: ppm(swedishpines ~ 1, Strauss(9))

## Not run: ppm(swedishpines ~ 1, Strauss(9), method="ho")
## Don't show: 
ppm(swedishpines ~ 1, Strauss(9), method="ho", nd=16, nsim=8)
## End(Don't show)

ppm(swedishpines ~ 1, Strauss(9), method="VBlogi")

 # COVARIATES
 #
 X <- rpoispp(42)
 weirdfunction <- function(x,y){ 10 * x^2 + 5 * sin(10 * y) }
 #
 # (a) covariate values as function
 ppm(X ~ y + weirdfunction)
 #
 # (b) covariate values in pixel image
 Zimage <- as.im(weirdfunction, unit.square())
 ppm(X ~ y + Z, covariates=list(Z=Zimage))
 #
 # (c) covariate values in data frame
 Q <- quadscheme(X)
 xQ <- x.quad(Q)
 yQ <- y.quad(Q)
 Zvalues <- weirdfunction(xQ,yQ)
 ppm(Q ~  y + Z, data=data.frame(Z=Zvalues))
 # Note Q not X

 # COVARIATE FUNCTION WITH EXTRA ARGUMENTS
 #
f <- function(x,y,a){ y - a }
ppm(X ~ x + f, covfunargs=list(a=1/2))

 # COVARIATE: inside/outside window
 b <- owin(c(0.1, 0.6), c(0.1, 0.9))
 ppm(X ~ b)

 ## MULTITYPE POINT PROCESSES ### 
 # fit stationary marked Poisson process
 # with different intensity for each species
## Not run: ppm(lansing ~  marks, Poisson())
## Don't show: 
  ama <- amacrine[square(0.7)]
  a <- ppm(ama ~  marks, Poisson(), nd=16)
## End(Don't show)

 # fit nonstationary marked Poisson process
 # with different log-cubic trend for each species
## Not run: ppm(lansing ~  marks * polynom(x,y,3), Poisson())
## Don't show: 
b <- ppm(ama ~  marks * polynom(x,y,2), Poisson(), nd=16)
## End(Don't show)




