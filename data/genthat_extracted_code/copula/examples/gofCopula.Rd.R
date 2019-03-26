library(copula)


### Name: gofCopula
### Title: Goodness-of-fit Tests for Copulas
### Aliases: gofCopula gofCopula-methods gofCopula,copula-method
###   gofCopula,parCopula-method gofCopula,rotCopula-method gofMB gofPB
### Keywords: htest models goodness-of-fit multivariate

### ** Examples

## The following example is available in batch through
## demo(gofCopula)
## No test: 
n <- 200; N <- 1000 # realistic (but too large for interactive use)
n <-  60; N <-  200 # (time (and tree !) saving ...)

## A two-dimensional data example ----------------------------------
set.seed(271)
x <- rCopula(n, claytonCopula(3))

## Does the Gumbel family seem to be a good choice (statistic "Sn")?
gofCopula(gumbelCopula(), x, N=N)
## With "SnC", really s..l..o..w.. --- with "SnB", *EVEN* slower
gofCopula(gumbelCopula(), x, N=N, method = "SnC", trafo.method = "cCopula")
## What about the Clayton family?
gofCopula(claytonCopula(), x, N=N)

## Similar with a different estimation method
gofCopula(gumbelCopula (), x, N=N, estim.method="itau")
gofCopula(claytonCopula(), x, N=N, estim.method="itau")


## A three-dimensional example  ------------------------------------
x <- rCopula(n, tCopula(c(0.5, 0.6, 0.7), dim = 3, dispstr = "un"))

## Does the Gumbel family seem to be a good choice?
g.copula <- gumbelCopula(dim = 3)
gofCopula(g.copula, x, N=N)
## What about the t copula?
t.copula <- tCopula(dim = 3, dispstr = "un", df.fixed = TRUE)
if(FALSE) ## this is *VERY* slow currently
  gofCopula(t.copula, x, N=N)

## The same with a different estimation method
gofCopula(g.copula, x, N=N, estim.method="itau")
if(FALSE) # still really slow
  gofCopula(t.copula, x, N=N, estim.method="itau")

## The same using the multiplier approach
gofCopula(g.copula, x, N=N, simulation="mult")
gofCopula(t.copula, x, N=N, simulation="mult")
if(FALSE) # no yet possible
    gofCopula(t.copula, x, N=N, simulation="mult", estim.method="itau")
## End(No test)



