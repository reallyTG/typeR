library(distr)


### Name: DiscreteDistribution
### Title: Generating function "DiscreteDistribution"
### Aliases: DiscreteDistribution
### Keywords: distribution

### ** Examples

# Dirac-measure at 0
D1 <- DiscreteDistribution(supp = 0)
D1
# simple discrete distribution
D2 <- DiscreteDistribution(supp = c(1:5), prob = c(0.1, 0.2, 0.3, 0.2, 0.2))
D2

plot(D2)



