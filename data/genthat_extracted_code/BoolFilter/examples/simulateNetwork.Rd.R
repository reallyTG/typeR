library(BoolFilter)


### Name: simulateNetwork
### Title: Simulate Boolean Network
### Aliases: simulateNetwork

### ** Examples

data(p53net_DNAdsb1)

#generate data from poisson observation model
dataPoisson <- simulateNetwork(p53net_DNAdsb1, n.data = 100, p = 0.02, 
                          obsModel = list(type = 'Poisson',
                                          s = 10.875, 
                                          mu = 0.01, 
                                          delta = c(2,2,2,2)))

#generate data from Bernoulli observation model
dataBernoulli <- simulateNetwork(p53net_DNAdsb1, n.data = 100, p = 0.02, 
                          obsModel = list(type = 'Bernoulli',
                                          q = 0.05))



