library(Rsurrogate)


### Name: delta.surv.estimate
### Title: Calculates treatment effect in a survival setting
### Aliases: delta.surv.estimate
### Keywords: univar nonparametric survival

### ** Examples

data(d_example_surv)
names(d_example_surv)
delta.surv.estimate(xone = d_example_surv$x1, xzero = d_example_surv$x0,  
deltaone = d_example_surv$delta1, deltazero = d_example_surv$delta0, t = 3)



