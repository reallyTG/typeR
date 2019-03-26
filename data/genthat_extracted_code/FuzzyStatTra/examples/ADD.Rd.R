library(FuzzyStatTra)


### Name: ADD
### Title: Average Distance Deviation of a trapezoidal fuzzy sample with
###   respect to a fuzzy number
### Aliases: ADD
### Keywords: univar

### ** Examples

# Example 1:
F=SimulCASE1(10)
U=Mean(F)
ADD(F,U,1)

# Example 2:
F=SimulCASE1(100)
U=Median1norm(F)
ADD(F,U,2,2,1,1)

# Example 3:
F=SimulCASE1(100)
U=matrix(c(1,2,3,2),nrow=1)
ADD(F,U,1)

# Example 4:
F=matrix(1:4,nrow=2)
U=matrix(1:4,nrow=1)
ADD(F,U,3,1,1,1)



