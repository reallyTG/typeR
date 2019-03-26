library(bootstrap)


### Name: patch
### Title: The Patch Data
### Aliases: patch
### Keywords: datasets

### ** Examples

str(patch) 
 theta <- function(ind){
      Y <- patch[ind,"y"]
      Z <- patch[ind,"z"]
      mean(Y)/mean(Z) }
patch.boot <- bootstrap(1:8, 2000, theta)
names(patch.boot)          
hist(patch.boot$thetastar)
abline(v=c(-0.2, 0.2), col="red2")
theta(1:8) #sample plug-in estimator
abline(v=theta(1:8) , col="blue")
# The bootstrap bias estimate:
mean(patch.boot$thetastar) - theta(1:8)
sd(patch.boot$thetastar) # bootstrapped standard error



