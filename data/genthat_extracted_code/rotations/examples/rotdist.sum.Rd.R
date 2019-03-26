library(rotations)


### Name: rotdist.sum
### Title: Sample distance
### Aliases: rotdist.sum rotdist.sum.Q4 rotdist.sum.SO3

### ** Examples

Rs <- ruars(20, rvmises, kappa = 10)

SE1 <- median(Rs)                      #Projected median
SE2 <- mean(Rs)                        #Projected mean
SR2 <- mean(Rs, type = "geometric")    #Geometric mean

#I will use "rotdist.sum" to verify these three estimators minimize the
#loss function they are designed to minimize relative to the other esimators.
#All of the following statements should evaluate to "TRUE"

#The projected mean minimizes the sum of squared Euclidean distances
rotdist.sum(Rs, S = SE2, p = 2) < rotdist.sum(Rs, S = SE1, p = 2)
rotdist.sum(Rs, S = SE2, p = 2) < rotdist.sum(Rs, S = SR2, p = 2)

#The projected median minimizes the sum of first order Euclidean distances
rotdist.sum(Rs, S = SE1, p = 1) < rotdist.sum(Rs, S = SE2, p = 1)
rotdist.sum(Rs, S = SE1, p = 1) < rotdist.sum(Rs, S = SR2, p = 1)

#The geometric mean minimizes the sum of squared Riemannian distances
rotdist.sum(Rs, S = SR2, p = 2, method = "intrinsic") <
                 rotdist.sum(Rs, S = SE1, p = 2, method = "intrinsic")
rotdist.sum(Rs, S = SR2, p = 2, method = "intrinsic") <
                 rotdist.sum(Rs, S = SE2, p = 2, method = "intrinsic")



