library(rotations)


### Name: fisheretal
### Title: Transformation based pivotal bootstrap confidence region
### Aliases: fisheretal fisheretal.Q4 fisheretal.SO3

### ** Examples

Qs<-ruars(20, rcayley, kappa = 100, space = 'Q4')

#The Fisher et al. method can be accesed from the "region" function or the "fisheretal" function
region(Qs, method = "transformation", type = "bootstrap", alp = 0.1,
symm = TRUE, estimator = "mean")
fisheretal(Qs, alp = 0.1, boot = TRUE, symm = TRUE)



