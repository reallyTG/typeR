library(MMeM)


### Name: MMeM_reml
### Title: Multivariate REML Method
### Aliases: MMeM_reml

### ** Examples


data(simdata)
T.start <- matrix(c(10,5,5,15),2,2)
E.start <- matrix(c(10,1,1,3),2,2)
results_reml <- MMeM_reml(fml = c(V1,V2) ~ X_vec + (1|Z_vec), data = simdata,
factor_X = TRUE, T.start = T.start, E.start = E.start, maxit = 10)





