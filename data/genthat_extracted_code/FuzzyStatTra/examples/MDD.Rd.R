library(FuzzyStatTra)


### Name: MDD
### Title: Median Distance Deviation of a trapezoidal fuzzy sample with
###   respect to a fuzzy number
### Aliases: MDD
### Keywords: univar robust

### ** Examples

# Example 1:
F=SimulCASE3(10)
U=Mean(F)
MDD(F,U,3,1,2,1)

# Example 2:
F=SimulCASE2(10)
U=Median1norm(F)
MDD(F,U,2)

# Example 3:
F=SimulCASE1(100)
U=matrix(c(1,2,3,2),nrow=1)
MDD(F,U,1)

# Example 4:
F=SimulCASE1(100)
U=array(1:60,dim=c(10,2,3))
MDD(F,U,2,1,2,1)




