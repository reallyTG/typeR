library(rotations)


### Name: prentice
### Title: Transformation based asymptotic confidence region
### Aliases: prentice prentice.Q4 prentice.SO3

### ** Examples

Qs<-ruars(20, rcayley, kappa = 100, space = 'Q4')

#The prentice method can be accesed from the "region" function or the "prentice" function
region(Qs, method = "transformation", type = "asymptotic", alp = 0.1, estimator = "mean")
prentice(Qs, alp = 0.1)



