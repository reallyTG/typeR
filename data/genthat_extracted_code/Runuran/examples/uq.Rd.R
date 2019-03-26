library(Runuran)


### Name: uq
### Title: Quantile function for "unuran" object
### Aliases: uq
### Keywords: distribution datagen

### ** Examples

## Compute quantiles of normal distribution using method 'PINV'
gen <- pinv.new(pdf=dnorm, lb=-Inf, ub=Inf)
uq(gen,seq(0,1,0.05))

## Compute quantiles of user-defined distribution using method 'PINV'
pdf <- function (x) { exp(-x) }
gen <- pinv.new(pdf=pdf, lb=0, ub=Inf, uresolution=1.e-12)
uq(gen,seq(0,1,0.05))

## Compute quantiles of binomial distribution using method 'DGT'
gen <- dgt.new(pv=dbinom(0:1000,1000,0.4), from=0)
uq(gen,seq(0,1,0.05))


## Compute quantiles of normal distribution using method 'HINV'
## (using 'advanced' interface)
gen <- unuran.new("normal()","hinv")
uq(gen,0.975)
uq(gen,c(0.025,0.975))

## Compute quantiles of user-defined distributio using method 'HINV'
## (using 'advanced' interface)
cdf <- function (x) { 1.-exp(-x) }
pdf <- function (x) { exp(-x) }
dist <- new("unuran.cont", cdf=cdf, pdf=pdf, lb=0, ub=Inf)
gen <- unuran.new(dist, "hinv; u_resolution=1.e-12")
uq(gen,seq(0,1,0.05))




