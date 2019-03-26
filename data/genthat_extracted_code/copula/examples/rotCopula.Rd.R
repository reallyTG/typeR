library(copula)


### Name: rotCopula
### Title: Construction and Class of Rotated aka Reflected Copulas
### Aliases: rotCopula rotCopula-class dim,rotCopula-method
### Keywords: distribution multivariate

### ** Examples

## Two-dimensional examples: First the Clayton(3) survival copula:
survC <- rotCopula(claytonCopula(3)) # default: flip = 'all TRUE'
contourplot2(survC, dCopula)

## Now, a reflected Clayton copula:
r10C  <- rotCopula(claytonCopula(3), flip = c(TRUE, FALSE))

contourplot2(r10C, dCopula, nlevels = 20, main = "dCopula(<rotCopula>)")
contourplot2(r10C, pCopula, nlevels = 20, main = "pCopula(<rotCopula>)")
rho(r10C)
tau(r10C) # -0.6

n <- 1000
u <- rCopula(n, r10C)
rho.n <- cor(u[,1], u[,2], method = "spearman")
tau.n <- cor(u[,1], u[,2], method = "kendall")

## "Calibration"
rc. <- rotCopula(claytonCopula(), flip = c(TRUE, FALSE))
iRho(rc., rho.n)
iTau(rc., tau.n)

## Fitting
fitCopula(rc., data = pobs(u), method = "irho")
fitCopula(rc., data = pobs(u), method = "itau")
fitCopula(rc., data = pobs(u), method = "mpl")

## Goodness-of-fit testing -- the first, parametric bootstrap, is *really* slow
## Not run: gofCopula(rc., x = u)
## No test: 
gofCopula(rc., x = u, simulation = "mult")
## End(No test)

## A four-dimensional example: a rotated Frank copula
rf <- rotCopula(frankCopula(10, dim = 4),
                flip = c(TRUE, FALSE, TRUE, FALSE))

n <- 1000
u <- rCopula(n, rf)
splom2(u)

pCopula(c(0.6,0.7,0.6,0.8), rf)
C.n(cbind(0.6,0.7,0.6,0.8),  u)

## Fitting
(rf. <- rotCopula(frankCopula(dim=4),
                  flip = c(TRUE, FALSE, TRUE, FALSE)))
## fitCopula(rf., data = pobs(u), method = "irho")
## FIXME above: not related to rotCopula but frankCopula
fitCopula(rf., data = pobs(u), method = "itau")
fitCopula(rf., data = pobs(u), method = "mpl")

## Goodness-of-fit testing (first ("PB") is really slow, see above):
## Not run: gofCopula(rf., x = u)
## No test: 
gofCopula(rf., x = u, simulation = "mult") # takes 3.7 sec [lynne, 2015]
## End(No test)



