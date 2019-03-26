library(BoolFilter)


### Name: plotTrajectory
### Title: Plot state variables of Boolean Regulatory Systems
### Aliases: plotTrajectory

### ** Examples

data(p53net_DNAdsb1)

data <- simulateNetwork(p53net_DNAdsb1, n.data = 100, p = 0.02,
                        obsModel = list(type = 'Bernoulli',
                                        q = 0.05))


plotTrajectory(data$X,              
              labels = p53net_DNAdsb1$genes)
                        
                        
#View both (original state trajectory and observation) datasets overlayed
plotTrajectory(data$X,              
              labels = p53net_DNAdsb1$genes,
              dataset2 = data$Y,
              compare = TRUE)




