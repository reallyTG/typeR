library(Runuran)


### Name: tdr.new
### Title: UNU.RAN generator based on Transformed Density Rejection (TDR)
### Aliases: tdr.new tdrd.new
### Keywords: datagen distribution

### ** Examples

## Create a sample of size 100 for a Gaussian distribution
pdf <- function (x) { exp(-0.5*x^2) }
gen <- tdr.new(pdf=pdf, lb=-Inf, ub=Inf)
x <- ur(gen,100)

## Create a sample of size 100 for a 
## Gaussian distribution (use logPDF)
logpdf <- function (x) { -0.5*x^2 }
gen <- tdr.new(pdf=logpdf, islog=TRUE, lb=-Inf, ub=Inf)
x <- ur(gen,100)

## Same example but additionally provide derivative of log-density
## to prevent possible round-off errors
logpdf <- function (x) { -0.5*x^2 }
dlogpdf <- function (x) { -x }
gen <- tdr.new(pdf=logpdf, dpdf=dlogpdf, islog=TRUE, lb=-Inf, ub=Inf)
x <- ur(gen,100)

## Draw sample from Gaussian distribution with mean 1 and
## standard deviation 2. Use 'dnorm'.
gen <- tdr.new(pdf=dnorm, lb=-Inf, ub=Inf, mean=1, sd=2)
x <- ur(gen,100)

## Draw a sample from a truncated Gaussian distribution
## on domain [5,Inf)
logpdf <- function (x) { -0.5*x^2 }
gen <- tdr.new(pdf=logpdf, lb=5, ub=Inf, islog=TRUE)
x <- ur(gen,100)

## Alternative approach
distr <- udnorm()
gen <- tdrd.new(distr)
x <- ur(gen,100)




