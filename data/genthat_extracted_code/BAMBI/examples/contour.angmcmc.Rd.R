library(BAMBI)


### Name: contour.angmcmc
### Title: Contour plot for angmcmc objects with bivariate data
### Aliases: contour.angmcmc

### ** Examples

# first fit a vmsin mixture model
# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
# now create a contour plot
contour(fit.vmsin.20)




