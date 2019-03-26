library(deducorrect)


### Name: isTotallyUnimodular
### Title: Test for total unimodularity of a matrix.
### Aliases: isTotallyUnimodular

### ** Examples


# Totally unimodular matrix, reduces to nothing
A <- matrix(c(
 1,1,0,0,0,
 -1,0,0,1,0,
 0,0,01,1,0,
 0,0,0,-1,1),nrow=5)
isTotallyUnimodular(A)

# Totally unimodular matrix, by Heller-Tompson criterium
A <- matrix(c(
 1,1,0,0,
 0,0,1,1,
 1,0,1,0,
 0,1,0,1),nrow=4)
isTotallyUnimodular(A)

# Totally unimodular matrix, by Raghavachani recursive criterium
A <- matrix(c(
    1,1,1,
    1,1,0,
    1,0,1))
isTotallyUnimodular(A)







