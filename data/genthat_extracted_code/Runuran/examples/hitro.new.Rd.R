library(Runuran)


### Name: hitro.new
### Title: UNU.RAN generator based on Hit-and-Run sampler (HITRO)
### Aliases: hitro.new
### Keywords: datagen distribution

### ** Examples

## Create a sample of size 100 for a 
## Gaussian distribution
mvpdf <- function (x) { exp(-sum(x^2)) }
gen <- hitro.new(dim=2, pdf=mvpdf)
x <- ur(gen,100)

## Use mode of Gaussian distribution.
## Reduce auto-correlation by thinning and burn-in.
##  mode at (0,0)
##  thinning factor 3
##    (only every 3rd vector in the sequence is returned)
##  burn-in of length 1000
##    (the first 100 vectors in the sequence are discarded)
mvpdf <- function (x) { exp(-sum(x^2)) }
gen <- hitro.new(dim=2, pdf=mvpdf, mode=c(0,0), thinning=3, burnin=1000)
x <- ur(gen,100)

## Gaussian distribution restricted to the rectangle [1,2]x[1,2]
##  (don't forget to provide a starting point using 'center')
mvpdf <- function (x) { exp(-sum(x^2)) }
gen <- hitro.new(dim=2, pdf=mvpdf, center=c(1.1,1.1), ll=c(1,1), ur=c(2,2))
x <- ur(gen,100)




