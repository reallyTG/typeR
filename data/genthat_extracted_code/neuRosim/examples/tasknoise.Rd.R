library(neuRosim)


### Name: tasknoise
### Title: Generate task-related noise
### Aliases: tasknoise
### Keywords: low-level noise

### ** Examples

d <- c(10,10,10)
sigma <- 5
nscan <- 100
act <- array(rep(0, prod(d)*nscan), dim=c(d,nscan))
act[2:4,2:4,2:4,c(20:30,40:50,60:70)] <- 1
out <- tasknoise(act, sigma)
## Don't show: 
rm(d,sigma,nscan,act,out)
## End(Don't show)



