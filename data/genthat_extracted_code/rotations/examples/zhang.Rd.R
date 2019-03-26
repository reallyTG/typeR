library(rotations)


### Name: zhang
### Title: M-estimator theory pivotal bootstrap confidence region
### Aliases: zhang zhang.Q4 zhang.SO3

### ** Examples

Rs <- ruars(20, rcayley, kappa = 100)

#The zhang method can be accesed from the "region" function or the "zhang" function
#They will be different because it is a bootstrap.
region(Rs, method = "direct", type = "bootstrap", alp = 0.1, estimator = "mean")
zhang(Rs, estimator = "mean", alp = 0.1)



