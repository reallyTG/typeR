library(copula)


### Name: gofEVCopula
### Title: Goodness-of-fit Tests for Bivariate Extreme-Value Copulas
### Aliases: gofEVCopula
### Keywords: htest models multivariate

### ** Examples

n <- 100; N <- 1000 # realistic (but too large currently for CRAN checks)
n <-  60; N <-  200 # (time (and tree !) saving ...)
x <- rCopula(n, claytonCopula(3))

## No test: 
## Does the Gumbel family seem to be a good choice?
gofEVCopula(gumbelCopula(), x, N=N)
## End(No test)

## The same with different (and cheaper) estimation methods:
gofEVCopula(gumbelCopula(), x, N=N, method="itau")
gofEVCopula(gumbelCopula(), x, N=N, method="irho")

## No test: 
## The same with different extreme-value copulas
gofEVCopula(galambosCopula(), x, N=N)
gofEVCopula(galambosCopula(), x, N=N, method="itau")
gofEVCopula(galambosCopula(), x, N=N, method="irho")

gofEVCopula(huslerReissCopula(), x, N=N)
gofEVCopula(huslerReissCopula(), x, N=N, method="itau")
gofEVCopula(huslerReissCopula(), x, N=N, method="irho")

gofEVCopula(tevCopula(df.fixed=TRUE), x, N=N)
gofEVCopula(tevCopula(df.fixed=TRUE), x, N=N, method="itau")
gofEVCopula(tevCopula(df.fixed=TRUE), x, N=N, method="irho")
## End(No test)



