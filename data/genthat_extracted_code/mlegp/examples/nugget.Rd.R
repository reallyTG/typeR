library(mlegp)


### Name: mlegp-nugget-related
### Title: Gaussian Process Nugget Related Functions
### Aliases: nugget varPerReps estimateNugget anyReps
### Keywords: htest

### ** Examples


x = matrix(c(1,1,2,3,3))   # the design matrix
y = matrix(c(5,6,7,0,10))  # output

anyReps(x)
varPerReps(x,y)
estimateNugget(x,y)




