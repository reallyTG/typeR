library(BoolFilter)


### Name: BoolFilter-package
### Title: Optimal Estimation of Partially-Observed Boolean Dynamical
###   Systems
### Aliases: BoolFilter-package BoolFilter

### ** Examples


data(p53net_DNAdsb0)
 
#Simulate data from a Bernoulli observation model
data <- simulateNetwork(p53net_DNAdsb0, n.data = 100, p = 0.02,
                        obsModel = list(type = "Bernoulli",
                                          p = 0.02))
                            
#Derive an estimate of the network using a BKF approach
Results <- BKF(data$Y, p53net_DNAdsb0, .02,
                        obsModel = list(type = "Bernoulli",
                                          p = 0.02))
                        
#View network approximation vs. correct trajectory
plotTrajectory(Results$Xhat,
                labels = p53net_DNAdsb0$genes,
                dataset2 = data$X,
                compare = TRUE)




