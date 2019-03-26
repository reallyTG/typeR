library(BoolFilter)


### Name: BKS
### Title: Boolean Kalman Smoother
### Aliases: BKS

### ** Examples

data(p53net_DNAdsb0)

obsModel = list(type = 'Bernoulli', q = 0.02)

#Simulate a network with Bernoulli observation noise
data <- simulateNetwork(p53net_DNAdsb0, n.data = 100, p = 0.02, obsModel)
          
#Derive the optimal estimate of state of the network using the BKS algorithm
Results <- BKS(data$Y, p53net_DNAdsb0, p = 0.02, obsModel)




