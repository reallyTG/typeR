library(rotations)


### Name: rot.dist
### Title: Rotational distance
### Aliases: rot.dist rot.dist.Q4 rot.dist.SO3

### ** Examples

rs <- rcayley(20, kappa = 10)
Rs <- genR(rs, S = id.SO3)
dEs <- rot.dist(Rs,id.SO3)
dRs <- rot.dist(Rs, id.SO3 , method = "intrinsic")

#The intrinsic distance between the true central orientation and each observation
#is the same as the absolute value of observations' respective misorientation angles
all.equal(dRs, abs(rs))              #TRUE

#The extrinsic distance is related to the intrinsic distance
all.equal(dEs, 2*sqrt(2)*sin(dRs/2)) #TRUE



