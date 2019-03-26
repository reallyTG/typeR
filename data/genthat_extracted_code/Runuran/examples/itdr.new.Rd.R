library(Runuran)


### Name: itdr.new
### Title: UNU.RAN generator based on Inverse Transformed Density Rejection
###   (ITDR)
### Aliases: itdr.new itdrd.new
### Keywords: datagen distribution

### ** Examples

## Create a sample of size 100 for a Gamma(0.5) distribution
pdf <- function (x) { x^(-0.5)*exp(-x) }
dpdf <- function (x) { (-x^(-0.5) - 0.5*x^(-1.5))*exp(-x) }
gen <- itdr.new(pdf=pdf, dpdf=dpdf, lb=0, ub=Inf, pole=0)
x <- ur(gen,100)

## Alternative approach
distr <- udgamma(shape=0.5)
gen <- itdrd.new(distr)
x <- ur(gen,100)




