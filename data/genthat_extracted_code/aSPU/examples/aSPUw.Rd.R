library(aSPU)


### Name: aSPUw
### Title: Inverse variance weighted Sum of Powered Score tests (SPUw) and
###   adaptive SPUw (aSPUw) test for single trait - SNP set association.
### Aliases: aSPUw

### ** Examples


data(exdat)
out <- aSPUw(exdat$Y, exdat$X, pow = c(1:8, Inf), n.perm = 1000)

out$Ts
# This is a vector of Test Statistics for SPU and aSPU tests.
# SPU1 to SPUInf corresponds with the option pow=c(1:8, Inf)
# They are SPU test statistics.
# The last element aSPU is minimum of them, aSPU statistic.

out$pvs
# This is a vector of p-values for SPU and aSPU tests.
# SPU1 to SPUInf corresponds with the option pow=c(1:8, Inf)
# They are p-values for corresponding SPU tests.
# The last element is p-value of aSPU test.




