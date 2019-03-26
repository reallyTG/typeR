library(neuRosim)


### Name: spatialnoise
### Title: Generate spatially correlated noise
### Aliases: spatialnoise
### Keywords: low-level noise

### ** Examples

d <- c(10,10,10)
sigma <- 5
nscan <- 100
rhospat <- 0.7
out <- spatialnoise(d, sigma, nscan, method="corr", rho=rhospat, verbose=FALSE)
## Don't show: 
rm(d,sigma,nscan,rhospat,out)
## End(Don't show)



