library(tsallisqexp)


### Name: tsal
### Title: The Tsallis Distribution
### Aliases: tsal dtsal ptsal qtsal rtsal tsal.mean
### Keywords: distribution

### ** Examples


#####
# (1) density function
x <- seq(0, 5, length=24)

cbind(x, dtsal(x, 1/2, 1/4))

#####
# (2) distribution function

cbind(x, ptsal(x, 1/2, 1/4))




		



