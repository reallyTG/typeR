library(lmomco)


### Name: cmlmomco
### Title: Conditional Mean Residual Quantile Function of the Distributions
### Aliases: cmlmomco
### Keywords: quantile function conditional mean quantile function
###   lifetime/reliability analysis The lmomco functions

### ** Examples

# It is easiest to think about residual life as starting at the origin, units in days.
A <- vec2par(c(0.0, 2649, 2.11), type="gov") # so set lower bounds = 0.0
qlmomco(0.5, A)  # The median lifetime = 1261 days
rmlmomco(0.5, A) # The average remaining life given survival to the median = 861 days
cmlmomco(0.5, A) # The average total life given survival to the median = 2122 days

# Now create with a nonzero origin
A <- vec2par(c(100, 2649, 2.11), type="gov") # so set lower bounds = 0.0
qlmomco(0.5, A)  # The median lifetime = 1361 days
rmlmomco(0.5, A) # The average remaining life given survival to the median = 861 days
cmlmomco(0.5, A) # The average total life given survival to the median = 2222 days

# Mean life (mu), which shows up in several expressions listed under rmlmomco.
mu1 <- cmlmomco(0,A)
mu2 <- par2lmom(A)$lambdas[1]
mu3 <- reslife.lmoms(0,A)$lambdas[1]
# Each mu is 1289.051 days.



