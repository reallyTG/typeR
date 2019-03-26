library(robustreg)


### Name: robustRegH
### Title: Robust Fitting of Linear Models using Huber Psi Function
### Aliases: robustRegH
### Keywords: regression

### ** Examples

data(stackloss)
robustRegH(stack.loss~Air.Flow+Water.Temp,data=stackloss)

#If X matrix contained large values of H matrix (high influence points)
robustRegH(stack.loss~Air.Flow+Water.Temp,data=stackloss,m=FALSE)



