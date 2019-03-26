library(robustbase)


### Name: epilepsy
### Title: Epilepsy Attacks Data Set
### Aliases: epilepsy
### Keywords: datasets

### ** Examples

data(epilepsy)
str(epilepsy)
pairs(epilepsy[,c("Ysum","Base4","Trt","Age10")])

Efit1 <- glm(Ysum ~ Age10 + Base4*Trt, family=poisson, data=epilepsy)
summary(Efit1)

## Robust Fit :
Efit2 <- glmrob(Ysum ~ Age10 + Base4*Trt, family=poisson, data=epilepsy,
                method = "Mqle",
                tcc=1.2, maxit=100)
summary(Efit2)



