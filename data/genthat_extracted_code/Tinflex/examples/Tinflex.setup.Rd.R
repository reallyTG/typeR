library(Tinflex)


### Name: Tinflex.setup
### Title: Create Tinflex Generator Object
### Aliases: Tinflex.setup
### Keywords: distribution datagen

### ** Examples

## Example 1: Bimodal density
##   Density  f(x) = exp( -|x|^alpha + s*|x|^beta + eps*|x|^2 )
##   with alpha > beta >= 2 and s, eps > 0

alpha <- 4.2
beta <- 2.1
s <- 1
eps <- 0.1

## Log-density and its derivatives.
lpdf   <- function(x) { -abs(x)^alpha + s*abs(x)^beta + eps*abs(x)^2 }
dlpdf  <- function(x) { (sign(x) * (-alpha*abs(x)^(alpha-1)
                           + s*beta*abs(x)^(beta-1) + 2*eps*abs(x))) }
d2lpdf <- function(x) { (-alpha*(alpha-1)*abs(x)^(alpha-2)
                          + s*beta*(beta-1)*abs(x)^(beta-2) + 2*eps) }

## Parameter cT=0 (default):
##   There are two inflection points on either side of 0.
ib <- c(-Inf, 0, Inf)

## Create generator object.
gen <- Tinflex.setup(lpdf, dlpdf, d2lpdf, ib=c(-Inf,0,Inf), rho=1.1)

## Print data about generator object.
print(gen)

## Draw a random sample
Tinflex.sample(gen, n=10)

## Inspect hat and squeeze visually in original scale
plot(gen, from=-2.5, to=2.5)
## ... and in transformed (log) scale.
plot(gen, from=-2.5, to=2.5, is.trans=TRUE)

## -------------------------------------------------------------------
## Example 2: Exponential Power Distribution
##   Density  f(x) = exp( -|x|^alpha )
##   with alpha > 0  [ >= 0.015 due to limitations of FPA ]

alpha <- 0.5

## Log-density and its derivatives.
lpdf   <- function(x) { -abs(x)^alpha }
dlpdf  <- function(x) { if (x==0) {0} else {-sign(x) * alpha*abs(x)^(alpha-1)}}
d2lpdf <- function(x) { -alpha*(alpha-1)*abs(x)^(alpha-2) }

## Parameter cT=-0.5:
##   There are two inflection points on either side of 0 and
##   a cusp at 0. Thus we need a partition point that separates
##   the inflection points from the cusp.
ib <- c(-Inf, -(1-alpha)/2, 0, (1-alpha)/2, Inf)

## Create generator object with c = -0.5.
gen <- Tinflex.setup(lpdf, dlpdf, d2lpdf, ib=ib, cT=-0.5, rho=1.1)

## Print data about generator object.
print(gen)

## Draw a random sample.
Tinflex.sample(gen, n=10)

## Inspect hat and squeeze visually in original scale
plot(gen, from=-4, to=4)
## ... and in transformed (log) scale.
plot(gen, from=-4, to=4, is.trans=TRUE)

## -------------------------------------------------------------------
## Example 3: Generalized Inverse Gaussian Distribution
##   Density  f(x) = x^(lambda-1) * exp(-omega/2 * (x+1/x))   x>= 0
##   with 0 < lambda < 1 and 0 < omega <= 0.5

la <- 0.4     ## lambda
om <- 1.e-7   ## omega

## Log-density and its derivatives.
lpdf   <- function(x) { ifelse (x==0., -Inf, ((la - 1) * log(x) - om/2*(x+1/x))) }
dlpdf  <- function(x) { if (x==0) { Inf} else {(om + 2*(la-1)*x-om*x^2)/(2*x^2)} }
d2lpdf <- function(x) { if (x==0) {-Inf} else {-(om - x + la*x)/x^3} }

## Parameter cT=0 near 0 and cT=-0.5 at tail:
ib <- c(0, (3/2*om/(1-la) + 2/9*(1-la)/om), Inf)
cT <- c(0,-0.5)

## Create generator object.
gen <- Tinflex.setup(lpdf, dlpdf, d2lpdf, ib=ib, cT=cT, rho=1.1)

## Print data about generator object.
print(gen)

## Draw a random sample.
Tinflex.sample(gen, n=10)

## Inspect hat and squeeze visually in original scale
plot(gen, from=0, to=5)



