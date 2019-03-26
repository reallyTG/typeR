library(BAMBI)


### Name: paramtrace
### Title: Trace plot for parameters from an angmcmc object
### Aliases: paramtrace

### ** Examples

# first fit a vmsin mixture model
# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
# trace plot for kappa1 in component 1
paramtrace(fit.vmsin.20, "kappa1", 1)
# for kappa1 in all components
paramtrace(fit.vmsin.20, "kappa1", press.enter = FALSE)
# for all parameters in component 1
paramtrace(fit.vmsin.20, comp.label = 1, press.enter = FALSE)




