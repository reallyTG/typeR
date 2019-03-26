library(intccr)


### Name: bssmle
### Title: B-spline Sieve Maximum Likelihood Estimation
### Aliases: bssmle
### Keywords: bssmle

### ** Examples

est.simdata <- intccr:::bssmle(Surv2(v, u, c) ~ z1 + z2, data = simdata, alpha = c(1, 1))
newdata <- intccr::dataprep(data = longdata, ID = "id", time = "t",
                            event = "c", Z = c("z1", "z2"))
est.longdata <- intccr:::bssmle(Surv2(v, u, c) ~ z1 + z2, data = newdata, alpha = c(1, 1))



