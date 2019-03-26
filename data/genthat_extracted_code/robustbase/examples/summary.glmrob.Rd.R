library(robustbase)


### Name: summary.glmrob
### Title: Summarizing Robust Fits of Generalized Linear Models
### Aliases: summary.glmrob vcov.glmrob print.summary.glmrob
### Keywords: regression nonlinear robust

### ** Examples

data(epilepsy)
Rmod <- glmrob(Ysum ~ Age10 + Base4*Trt, family = poisson,
               data = epilepsy, method= "Mqle")
ss <- summary(Rmod)
ss ## calls print.summary.glmrob()
str(ss) ## internal STRucture of summary object



