library(ratematrix)


### Name: likelihoodFunction
### Title: Likelihood function for the multivariate Brownian motion model
### Aliases: likelihoodFunction

### ** Examples

## No test: 
data( centrarchidae )
root <- colMeans( centrarchidae$data )
Rlist <- list( rbind(c(0.5, 0.1),c(0.1,0.5)), rbind(c(0.5, 0),c(0,0.5)) )
likelihoodFunction(data = centrarchidae$data, phy = centrarchidae$phy.map, root = root
                   , R = Rlist)
## Get the likelihood for a single regime model:
phy.single <- mergeSimmap(phy = centrarchidae$phy.map, drop.regimes = TRUE)
Rsingle <- rbind(c(0.5, 0.1),c(0.1,0.5))
likelihoodFunction(data = centrarchidae$data, phy = phy.single, root = root, R = Rsingle)
## End(No test)



