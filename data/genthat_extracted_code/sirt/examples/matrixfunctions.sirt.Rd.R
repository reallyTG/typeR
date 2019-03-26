library(sirt)


### Name: matrixfunctions.sirt
### Title: Some Matrix Functions
### Aliases: rowMaxs.sirt rowMins.sirt rowCumsums.sirt colCumsums.sirt
###   rowIntervalIndex.sirt rowKSmallest.sirt rowKSmallest2.sirt
### Keywords: Matrix utilities

### ** Examples

#############################################################################
# EXAMPLE 1: a small toy example (I)
#############################################################################
set.seed(789)
N1 <- 10 ; N2 <- 4
M1 <- round( matrix( runif(N1*N2), nrow=N1, ncol=N2), 1 )

rowMaxs.sirt(M1)      # rowwise maximum
rowMins.sirt(M1)      # rowwise minimum
rowCumsums.sirt(M1)   # rowwise cumulative sum

# row index for exceeding a certain threshold value
matr <- M1
matr <- matr / rowSums( matr )
matr <- sirt::rowCumsums.sirt( matr )
rn <- runif(N1)    # generate random numbers
rowIntervalIndex.sirt(matr,rn)

# select the two smallest values
rowKSmallest.sirt(matr=M1, K=2)
rowKSmallest2.sirt(matr=M1, K=2)



