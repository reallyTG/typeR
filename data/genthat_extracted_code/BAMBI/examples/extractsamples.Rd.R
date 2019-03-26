library(BAMBI)


### Name: extractsamples
### Title: Extract MCMC samples for parameters from an angmcmc object
### Aliases: extractsamples

### ** Examples

# first fit a vmsin mixture model
# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
# extract Markov chain realizations for kappa1 from component 1
extr_kappa1_1 <- extractsamples(fit.vmsin.20, "kappa1", 1)
# for kappa1 from component from all components
extr_kappa1 <- extractsamples(fit.vmsin.20, "kappa1")
# for all parameters in component 1
extr_1 <- extractsamples(fit.vmsin.20, comp.label = 1)




