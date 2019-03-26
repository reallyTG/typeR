library(BAMBI)


### Name: quantile.angmcmc
### Title: Quantile estimates for parameters from an angmcmc object
### Aliases: quantile.angmcmc

### ** Examples

# first fit a vmsin mixture model
# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
# 0.025th quantiles
(quant_025 <- quantile(fit.vmsin.20, prob = 0.025))
# 0.975th quantiles
(quant_975 <- quantile(fit.vmsin.20, prob = 0.975))
# default quantiles
(quant_def <- quantile(fit.vmsin.20))




