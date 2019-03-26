library(rotations)


### Name: weighted.mean.SO3
### Title: Weighted mean rotation
### Aliases: weighted.mean.Q4 weighted.mean.SO3

### ** Examples

Rs <- ruars(20, rvmises, kappa = 0.01)
mean(Rs)                   #Find the equal-weight projected mean
wt <- abs(1/mis.angle(Rs)) #Use the rotation misorientation angle as weight
weighted.mean(Rs, wt)      #as weight
rot.dist(mean(Rs))
rot.dist(weighted.mean(Rs, wt)) #usually much smaller than unweighted mean

#Can do the same thing with quaternions
Qs <- as.Q4(Rs)
mean(Qs)
wt <- abs(1/mis.angle(Qs))
weighted.mean(Qs, wt)
rot.dist(mean(Qs))
rot.dist(weighted.mean(Qs, wt))



