library(BAMBI)


### Name: densityplot.angmcmc
### Title: Density plots for angmcmc objects
### Aliases: densityplot.angmcmc

### ** Examples

# first fit a vmsin mixture model
# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_vmsinmix(tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
# now create density surface with the default first 1/3 as burn-in and thin = 1
library(lattice)
densityplot(fit.vmsin.20)
# the viewing angles can be changed through the arguments theta and phi
# (passed to persp from graphics)
densityplot(fit.vmsin.20, theta = 45, phi = 45)

# Now fit a vm mixture model
# illustration only - more iterations needed for convergence
fit.vm.20 <- fit_vmmix(wind$angle, ncomp = 3, n.iter =  20,
                             n.chains = 1)
densityplot(fit.vm.20)




