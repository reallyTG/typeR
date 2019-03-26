library(Runuran)


### Name: dari.new
### Title: UNU.RAN generator based on Discrete Automatic Rejection
###   Inversion (DARI)
### Aliases: dari.new darid.new
### Keywords: datagen distribution

### ** Examples

## Create a sample of size 100 for a Binomial distribution
## with 1000 number if observations and probability 0.2
gen <- dari.new(pmf=dbinom, lb=0, ub=1000, size=1000, prob=0.2)
x <- ur(gen,100)

## Create a sample from a distribution with PMF
##  p(x) = 1/x^3, x >= 1  (Zipf distribution)
zipf <- function (x) { 1/x^3 }
gen <- dari.new(pmf=zipf, lb=1, ub=Inf)
x <- ur(gen,100)

## Alternative approach
distr <- udbinom(size=100,prob=0.3)
gen <- darid.new(distr)
x <- ur(gen,100)




