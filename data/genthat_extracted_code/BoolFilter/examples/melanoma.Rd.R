library(BoolFilter)


### Name: melanoma
### Title: Melanoma Regulatory Network
### Aliases: melanoma

### ** Examples

data(melanoma)

data <- simulateNetwork(melanoma, n.data = 100, p = .02,
                      obsModel = list(type = 'Bernoulli', 
                                      q = 0.05))



