library(lintools)


### Name: is_totally_unimodular
### Title: Test for total unimodularity of a matrix.
### Aliases: is_totally_unimodular

### ** Examples


# Totally unimodular matrix, reduces to nothing
A <- matrix(c(
 1,1,0,0,0,
 -1,0,0,1,0,
 0,0,01,1,0,
 0,0,0,-1,1),nrow=5)
is_totally_unimodular(A)

# Totally unimodular matrix, by Heller-Tompson criterium
A <- matrix(c(
 1,1,0,0,
 0,0,1,1,
 1,0,1,0,
 0,1,0,1),nrow=4)
is_totally_unimodular(A)

# Totally unimodular matrix, by Raghavachani recursive criterium
A <- matrix(c(
    1,1,1,
    1,1,0,
    1,0,1))
is_totally_unimodular(A)







