library(rotations)


### Name: chang
### Title: M-estimator asymptotic confidence region
### Aliases: chang chang.Q4 chang.SO3

### ** Examples

Rs <- ruars(20, rcayley, kappa = 100)

#The chang method can be accesed from the "region" function or the "chang" function
region(Rs, method = "direct", type = "asymptotic", alp = 0.1, estimator = "mean")
chang(Rs, estimator = "mean", alp = 0.1)



