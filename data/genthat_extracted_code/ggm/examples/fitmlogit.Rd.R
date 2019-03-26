library(ggm)


### Name: fitmlogit
### Title: Multivariate logistic models
### Aliases: fitmlogit
### Keywords: multivariate logistic model

### ** Examples
    
data(surdata)                     
out1 <- fitmlogit(A ~X, B ~ Z, cbind(A, B) ~ X*Z, data = surdata)     
out1$beta
out2 <- fitmlogit(A ~X, B ~ Z, cbind(A, B) ~ 1, data = surdata)        
out2$beta



