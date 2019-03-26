library(BoolFilter)


### Name: p53net_DNAdsb1
### Title: p53 Negative-Feedback Gene Regulatory Boolean Network
### Aliases: p53net_DNAdsb1

### ** Examples

data(p53net_DNAdsb1)

data <- simulateNetwork(p53net_DNAdsb1, n.data = 100, p = .02,
                      obsModel = list(type = 'Bernoulli', 
                                      q = 0.05))



