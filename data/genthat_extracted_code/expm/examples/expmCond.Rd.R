library(expm)


### Name: expmCond
### Title: Exponential Condition Number of a Matrix
### Aliases: expmCond
### Keywords: algebra math

### ** Examples

set.seed(101)
(A <- matrix(round(rnorm(3^2),1), 3,3))

eA <- expm.Higham08(A)
stopifnot(all.equal(eA, expm::expm(A), tolerance= 1e-15))

C1 <- expmCond(A, "exact")
C2 <- expmCond(A, "1.est")
C3 <- expmCond(A, "F.est")
all.equal(C1$expmCond1, C2$expmCond, tolerance= 1e-15)# TRUE
all.equal(C1$expmCondF, C3$expmCond)# relative difference of 0.001...



