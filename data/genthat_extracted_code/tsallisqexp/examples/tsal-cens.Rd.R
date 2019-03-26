library(tsallisqexp)


### Name: tsal.tail
### Title: The Tsallis Distribution with a censoring parameter
###   (tail-conditional)
### Aliases: tsal.tail dtsal.tail ptsal.tail qtsal.tail rtsal.tail
### Keywords: distribution

### ** Examples


#####
# (1) density function
x <- seq(0, 5, length=24)

cbind(x, dtsal(x, 1/2, 1/4))

#####
# (2) distribution function

cbind(x, ptsal(x, 1/2, 1/4))




		



