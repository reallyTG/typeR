library(Runuran)


### Name: pinv.new
### Title: UNU.RAN generator based on Polynomial interpolation of INVerse
###   CDF (PINV)
### Aliases: pinv.new pinvd.new
### Keywords: datagen distribution

### ** Examples

## Create a sample of size 100 for a Gaussian distribution
pdf <- function (x) { exp(-0.5*x^2) }
gen <- pinv.new(pdf=pdf, lb=-Inf, ub=Inf)
x <- ur(gen,100)

## Create a sample of size 100 for a 
## Gaussian distribution (use logPDF)
logpdf <- function (x) { -0.5*x^2 }
gen <- pinv.new(pdf=logpdf, islog=TRUE, lb=-Inf, ub=Inf)
x <- ur(gen,100)

## Draw sample from Gaussian distribution with mean 1 and
## standard deviation 2. Use 'dnorm'.
gen <- pinv.new(pdf=dnorm, lb=-Inf, ub=Inf, mean=1, sd=2)
x <- ur(gen,100)

## Draw a sample from a truncated Gaussian distribution
## on domain [2,Inf)
gen <- pinv.new(pdf=dnorm, lb=2, ub=Inf)
x <- ur(gen,100)

## Improve the accuracy of the approximation
gen <- pinv.new(pdf=dnorm, lb=-Inf, ub=Inf, uresolution=1e-15)
x <- ur(gen,100)

## We have to provide a 'center' when PDF (almost) vanishes at 0.
gen <- pinv.new(pdf=dgamma, lb=0, ub=Inf, center=4, shape=5)
x <- ur(gen,100)

## We also can force a smoother approximation
gen <- pinv.new(pdf=dnorm, lb=-Inf, ub=Inf, smooth=TRUE)
x <- ur(gen,100)

## Alternative approach
distr <- udnorm()
gen <- pinvd.new(distr)
x <- ur(gen,100)




