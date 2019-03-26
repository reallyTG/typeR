library(BurStFin)


### Name: slideWeight
### Title: Generate Time Weights Flexiibly
### Aliases: slideWeight
### Keywords: ts

### ** Examples

# examples assume number of observations is 200

# all weights either 0 or 1
rollwin50 <- slideWeight(200, observations=c(50,50))

# 50 with full weight, 100 more with partial weight
swght50.150 <- slideWeight(200, observations=c(50, 150))

# approximately default weights of var.shrink.eqcor and factor.model.stat
lindec3 <- slideWeight(200, fractions=c(-1/2, 3/2))



