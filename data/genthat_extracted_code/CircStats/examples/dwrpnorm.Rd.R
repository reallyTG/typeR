library(CircStats)


### Name: dwrpnorm
### Title: Wrapped Normal Density Function
### Aliases: dwrpnorm
### Keywords: distribution

### ** Examples

# Values for which to evaluate density
theta <- c(1:500)*2*pi/500
#Compute wrapped normal density function
density <- c(1:500)
for(i in 1:500) density[i] <- dwrpnorm(theta[i], pi, .75)
plot(theta, density)
#Approximate area under density curve
sum(density*2*pi/500)



