library(RTDE)


### Name: Frank
### Title: The Frank Distribution
### Aliases: Frank dfrank pfrank qfrank rfrank
### Keywords: distribution

### ** Examples


#####
# (1) density function
u <- v <- seq(0, 1, length=25)

cbind(u, v, dfrank(u, v, 1/2))
cbind(u, v, outer(u, v, dfrank, alpha=1/2))


#####
# (2) distribution function

cbind(u, v, pfrank(u, v, 1/2))
cbind(u, v, outer(u, v, pfrank, alpha=1/2))




		



