library(sppmix)


### Name: GetPMEst
### Title: Retrieve the Surface of Posterior Means
### Aliases: GetPMEst

### ** Examples

## No test: 
fit <- est_mix_damcmc(pp = spatstat::redwood, m = 3)
post_intsurf <- GetPMEst(fit, burnin = 1000)
plot(post_intsurf)
fit <- est_mix_bdmcmc(pp = spatstat::redwood, m = 5)
post_intsurf <- GetPMEst(fit, num_comp = 4, burnin = 1000)
plot(post_intsurf)
post_fixed = FixLS_da(fit,approx=FALSE, plot_result = TRUE)
plot(GetPMEst(post_fixed))
## End(No test)




