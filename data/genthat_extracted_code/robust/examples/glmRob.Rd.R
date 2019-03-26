library(robust)


### Name: glmRob
### Title: Fit a Robust Generalized Linear Model
### Aliases: glmRob
### Keywords: robust regression models

### ** Examples

data(breslow.dat)

glmRob(sumY ~ Age10 + Base4*Trt, family = poisson(),
       data = breslow.dat, method = "cubif")



