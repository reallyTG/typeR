library(intccr)


### Name: bssmle_se
### Title: Bootstrap varince-covariance estimation
### Aliases: bssmle_se
### Keywords: bssmle_se

### ** Examples

attach(simdata)
est.vcov <- intccr:::bssmle_se(formula = Surv2(v, u, c) ~ z1 + z2, data = simdata,
                               alpha = c(1, 1), do.par = FALSE, nboot = 1)



