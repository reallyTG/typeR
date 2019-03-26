library(BoolFilter)


### Name: MMAE
### Title: Multiple Model Adaptive Estimation
### Aliases: MMAE

### ** Examples


#load potential networks
data(p53net_DNAdsb0)
data(p53net_DNAdsb1)

net1 <- p53net_DNAdsb0
net2 <- p53net_DNAdsb1

#define observation model
observation = list(type = 'NB', s = 10.875, mu = 0.01, delta = c(2, 2, 2, 2), phi = c(3, 3, 3, 3))

#simulate data using one of the networks and a given 'p'
data <- simulateNetwork(net1, n.data = 100, p = 0.02, obsModel = observation)
       
#run MMAE to determine model selection and parameter estimation
MMAE(data, net=c("net1","net2"), p=c(0.02,0.1,0.15), threshold=0.8, obsModel = observation)





