library(lmomco)


### Name: hlmomco
### Title: Hazard Functions of the Distributions
### Aliases: hlmomco
### Keywords: hazard function lifetime/reliability analysis The lmomco
###   functions The lmomco function mimics of R nomenclature

### ** Examples

my.lambda <- 100
para <- vec2par(c(0,my.lambda), type="exp")

x <- seq(40:60)
hlmomco(x,para) # returns vector of 0.01
# because the exponential distribution has a constant
# failure rate equal to 1/scale or 1/100 as in this example.



