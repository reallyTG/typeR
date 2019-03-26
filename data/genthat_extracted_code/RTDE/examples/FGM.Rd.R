library(RTDE)


### Name: FGM
### Title: The Eyraud Farlie Gumbel Morgenstern Distribution
### Aliases: FGM dFGM pFGM qFGM rFGM
### Keywords: distribution

### ** Examples


#####
# (1) density function
u <- v <- seq(0, 1, length=25)

cbind(u, v, dFGM(u, v, 1/2))
cbind(u, v, outer(u, v, dFGM, alpha=1/2))


#####
# (2) distribution function

cbind(u, v, pFGM(u, v, 1/2))
cbind(u, v, outer(u, v, pFGM, alpha=1/2))




		



