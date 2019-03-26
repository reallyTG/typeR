library(Runuran)


### Name: srou.new
### Title: UNU.RAN generator based on Simple Ratio-Of-Uniforms Method
###   (SROU)
### Aliases: srou.new sroud.new
### Keywords: datagen distribution

### ** Examples

## Create a sample of size 100 for a Gaussian distribution.
pdf <- function (x) { exp(-0.5*x^2) }
gen <- srou.new(pdf=pdf, lb=-Inf, ub=Inf, mode=0, area=2.506628275)
x <- ur(gen,100)

## Create a sample of size 100 for a Gaussian distribution.
## Use 'dnorm'.
gen <- srou.new(pdf=dnorm, lb=-Inf, ub=Inf, mode=0, area=1)
x <- ur(gen,100)

## Alternative approach
distr <- udnorm()
gen <- sroud.new(distr)
x <- ur(gen,100)




