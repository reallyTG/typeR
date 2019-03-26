library(EpiModel)


### Name: dissolution_coefs
### Title: Dissolution Coefficients for Stochastic Network Models
### Aliases: dissolution_coefs
### Keywords: netUtils

### ** Examples

# Homogeneous dissolution model with no departures
dissolution_coefs(dissolution = ~offset(edges), duration = 25)

# Homogeneous dissolution model with departures
dissolution_coefs(dissolution = ~offset(edges), duration = 25,
                  d.rate = 0.001)

# Heterogeneous dissolution model in which same-race edges have
# shorter duration compared to mixed-race edges, with no departures
dissolution_coefs(dissolution = ~offset(edges) + offset(nodematch("race")),
                  duration = c(20, 10))

# Heterogeneous dissolution model in which same-race edges have
# shorter duration compared to mixed-race edges, with departures
dissolution_coefs(dissolution = ~offset(edges) + offset(nodematch("race")),
                  duration = c(20, 10), d.rate = 0.001)





