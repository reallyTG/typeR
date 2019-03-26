library(neuRosim)


### Name: temporalnoise
### Title: Generate temporally correlated noise
### Aliases: temporalnoise
### Keywords: low-level noise

### ** Examples

d <- c(10,10,10)
sigma <- 5
nscan <- 100
rho <- c(0.3,-0.7)
out <- temporalnoise(d, nscan, sigma, rho, verbose=FALSE)
## Don't show: 
rm(d,sigma,nscan,rho,out)
## End(Don't show)



