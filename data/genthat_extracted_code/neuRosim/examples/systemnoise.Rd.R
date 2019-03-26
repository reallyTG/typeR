library(neuRosim)


### Name: systemnoise
### Title: Generate system noise
### Aliases: systemnoise
### Keywords: low-level noise

### ** Examples

d <- c(10,10,10)
sigma <- 5
nscan <- 100
out <- systemnoise(d, nscan, type="rician", sigma, verbose=FALSE)
## Don't show: 
rm(d,sigma,nscan,out)
## End(Don't show)



