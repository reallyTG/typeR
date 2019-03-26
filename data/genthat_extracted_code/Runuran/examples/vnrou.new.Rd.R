library(Runuran)


### Name: vnrou.new
### Title: UNU.RAN generator based on Multivariate Naive Ratio-Of-Uniforms
###   method (VNROU)
### Aliases: vnrou.new
### Keywords: datagen distribution

### ** Examples

## Create a sample of size 100 for a Gaussian distribution
mvpdf <- function (x) { exp(-sum(x^2)) }
gen <- vnrou.new(dim=2, pdf=mvpdf)
x <- ur(gen,100)

## Use mode of Gaussian distribution to accelerate set-up.
mvpdf <- function (x) { exp(-sum(x^2)) }
gen <- vnrou.new(dim=2, pdf=mvpdf, mode=c(0,0))
x <- ur(gen,100)

## Gaussian distribution restricted to the rectangle [1,2]x[1,2]
##  (don't forget to provide a point inside domain using 'center')
mvpdf <- function (x) { exp(-sum(x^2)) }
gen <- vnrou.new(dim=2, pdf=mvpdf, ll=c(1,1), ur=c(2,2), center=c(1.5,1.5))
x <- ur(gen,100)




