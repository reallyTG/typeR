library(gam)


### Name: gam.exact
### Title: A method for gam producing asymptotically exact standard errors
###   for linear estimates
### Aliases: gam.exact
### Keywords: models regression nonparametric smooth

### ** Examples

set.seed(31)
n     <- 200
x     <- rnorm(n)
y     <- rnorm(n)
a     <- rep(1:10,length=n)
b     <- rnorm(n)
z     <- 1.4 + 2.1*a + 1.2*b + 0.2*sin(x/(3*max(x))) + 0.3*cos(y/(5*max(y))) + 0.5 * rnorm(n)
dat   <- data.frame(x,y,a,b,z,testit=b*2)
### Model 1: Basic
Gam.o <- gam(z ~ a + b + s(x,3) + s(y,5), data=dat)
coefficients(summary.glm(Gam.o))
gam.exact(Gam.o)
### Model 2: Poisson
Gam.o <- gam(round(abs(z)) ~ a + b + s(x,3) + s(y,5), data=dat,family=poisson)
coefficients(summary.glm(Gam.o))
gam.exact(Gam.o)



