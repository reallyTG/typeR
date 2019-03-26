library(rotations)


### Name: skew.exp
### Title: Matrix exponential
### Aliases: skew.exp

### ** Examples

Rs <- ruars(20, rcayley)
lRs <- log(Rs)           #Take the matrix logarithm for rotation matrices
Rs2 <- skew.exp(lRs)     #Go back to rotation matrices
all.equal(Rs, Rs2)



