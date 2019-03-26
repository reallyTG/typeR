library(BoolFilter)


### Name: BKF
### Title: Boolean Kalman Filter
### Aliases: BKF

### ** Examples

data(p53net_DNAdsb0)

obsModel = list(type = 'NB', 
                   s = 10.875, 
                  mu = 0.01, 
               delta = c(2, 2, 2, 2), 
                 phi = c(3, 3, 3, 3))

#Simulate a network with Negative-Binomial observation model
data <- simulateNetwork(p53net_DNAdsb0, n.data = 100, p = 0.02, obsModel)
          
#Derive the optimal estimate of the network using a BKF approach
Results <- BKF(data$Y, p53net_DNAdsb0, p = 0.02, obsModel)




