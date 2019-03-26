library(Runuran)


### Name: ars.new
### Title: UNU.RAN generator based on Adaptive Rejection Sampling (ARS)
### Aliases: ars.new arsd.new
### Keywords: datagen distribution

### ** Examples

## Create a sample of size 100 for a 
## Gaussian distribution (use logPDF)
lpdf <- function (x) { -0.5*x^2 }
gen <- ars.new(logpdf=lpdf, lb=-Inf, ub=Inf)
x <- ur(gen,100)

## Same example but additionally provide derivative of log-density
## to prevent possible round-off errors
lpdf <- function (x) { -0.5*x^2 }
dlpdf <- function (x) { -x }
gen <- ars.new(logpdf=lpdf, dlogpdf=dlpdf, lb=-Inf, ub=Inf)
x <- ur(gen,100)

## Draw a sample from a truncated Gaussian distribution
## on domain [100,Inf)
lpdf <- function (x) { -0.5*x^2 }
gen <- ars.new(logpdf=lpdf, lb=50, ub=Inf)
x <- ur(gen,100)

## Alternative approach
distr <- udnorm()
gen <- arsd.new(distr)
x <- ur(gen,100)




