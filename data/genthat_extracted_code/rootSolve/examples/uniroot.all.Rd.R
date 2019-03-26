library(rootSolve)


### Name: uniroot.all
### Title: Finds many (all) roots of one equation within an interval
### Aliases: uniroot.all
### Keywords: optimize

### ** Examples

## =======================================================================
##   Mathematical examples  
## =======================================================================

# a well-behaved case...
fun <- function (x) cos(2*x)^3

curve(fun(x), 0, 10,main = "uniroot.all")

All <- uniroot.all(fun, c(0, 10))
points(All, y = rep(0, length(All)), pch = 16, cex = 2)

# a difficult case...
f <- function (x) 1/cos(1+x^2)
AA <- uniroot.all(f, c(-5, 5))
curve(f(x), -5, 5, n = 500, main = "uniroot.all")
points(AA, rep(0, length(AA)), col = "red", pch = 16)

f(AA)  # !!!

## =======================================================================
## Ecological modelling example  
## =======================================================================

# Example from the book of Soetaert and Herman(2009)
# A practical guide to ecological modelling -
# using R as a simulation platform. Springer

r   <- 0.05
K   <- 10
bet <- 0.1
alf <- 1

# the model : density-dependent growth and sigmoid-type mortality rate
rate <- function(x, r = 0.05) r*x*(1-x/K) - bet*x^2/(x^2+alf^2)

# find all roots within the interval [0,10]
Eq   <- uniroot.all(rate, c(0, 10))

# jacobian evaluated at all roots: 
# This is just one value - and therefore jacobian = eigenvalue
# the sign of eigenvalue: stability of the root: neg=stable, 0=saddle, pos=unstable

eig <- vector()
for (i in 1:length(Eq)) 
  eig[i] <- sign (gradient(rate, Eq[i]))

curve(rate(x), ylab = "dx/dt", from = 0, to = 10,
      main = "Budworm model, roots", 
      sub = "Example from Soetaert and Herman, 2009")
abline(h = 0)
points(x = Eq, y = rep(0, length(Eq)), pch = 21, cex = 2,
       bg = c("grey", "black", "white")[eig+2] )
legend("topleft", pch = 22, pt.cex = 2,
       c("stable", "saddle", "unstable"),
       col = c("grey", "black", "white"), 
       pt.bg = c("grey", "black", "white"))
       
## =======================================================================
## Vectorisation:
## =======================================================================
# from R-help Digest, Vol 130, Issue 27
#https://stat.ethz.ch/pipermail/r-help/2013-December/364799.html

integrand1 <- function(x) 1/x*dnorm(x) 
integrand2 <- function(x) 1/(2*x-50)*dnorm(x) 
integrand3 <- function(x, C) 1/(x+C)

res <- function(C) {
  integrate(integrand1, lower = 1, upper = 50)$value + 
  integrate(integrand2, lower = 50, upper = 100)$value - 
  integrate(integrand3, C = C, lower = 1, upper = 100)$value
}

# uniroot passes one value at a time to the function, so res can be used as such
uniroot(res, c(1, 1000))

# Need to vectorise the function to use uniroot.all:
res <- Vectorize(res)
uniroot.all(res, c(1,1000))
       



