library(BoolFilter)


### Name: SIR_BKF
### Title: Particle Filter
### Aliases: SIR_BKF

### ** Examples

## No test: 
data(cellcycle)

obsModel = list(type = 'Gaussian', 
               model = c(mu0 = 1, sigma0 = 2, mu1 = 5, sigma1 = 2))

#generate data from Negative Binomial observation model for the
#10-gene Mammalian Cell Cycle Network
data <- simulateNetwork(cellcycle, n.data = 100, p = 0.02, obsModel)

#perform SIR-BKF algorithm
Results <- SIR_BKF(data$Y, N = 1000, alpha = 0.95, cellcycle, p = 0.02, obsModel)
                                          
## End(No test)                                        




