library(mvinfluence)


### Name: mpower
### Title: General Matrix Power
### Aliases: mpower %^%
### Keywords: array

### ** Examples

M <- matrix(sample(1:9), 3,3)
mpower(M,2)
mpower(M,4)

# make a symmetric matrix
MM <- crossprod(M)
mpower(MM, -1)
Mhalf <- mpower(MM, 1/2)
all.equal(MM, Mhalf %*% Mhalf)




