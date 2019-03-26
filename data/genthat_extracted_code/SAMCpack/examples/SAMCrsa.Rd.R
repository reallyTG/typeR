library(SAMCpack)


### Name: SAMCrsa
### Title: A Resampling-based Stochastic Approximation Method for Analysis
###   of Large Geostatitical data
### Aliases: SAMCrsa

### ** Examples

##### load example data pre-loaded
data(gdata)

##### run RSA
output = SAMCrsa(gdata$coords, gdata$y, gdata$X, nsubset=50, stepscale=40, niter=100, warm=20)




