library(RTDE)


### Name: Frechet
### Title: The Frechet Distribution
### Aliases: Frechet dfrechet pfrechet qfrechet rfrechet dufrechet
###   pufrechet qufrechet rufrechet
### Keywords: distribution

### ** Examples


#####
# (1) density function
x <- seq(0, 5, length=24)

cbind(x, dfrechet(x, 1/2, 1/4))

#####
# (2) distribution function

cbind(x, pfrechet(x, 1/2, 1/4))




		



