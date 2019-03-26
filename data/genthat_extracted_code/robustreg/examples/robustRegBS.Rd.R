library(robustreg)


### Name: robustRegBS
### Title: Robust Fitting of Linear Models using Bisquare Psi Function
### Aliases: robustRegBS
### Keywords: regression

### ** Examples

data(stackloss)
robustRegBS(stack.loss~Air.Flow+Water.Temp,data=stackloss)

#If X matrix contained large values of H matrix (high influence points)
robustRegBS(stack.loss~Air.Flow+Water.Temp,data=stackloss,m=FALSE)



