library(BAMBI)


### Name: plot.angmcmc
### Title: Summary plots for angmcmc objects
### Aliases: plot.angmcmc

### ** Examples

# first fit a vmsin mixture model
# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
plot(fit.vmsin.20, press.enter = FALSE)



