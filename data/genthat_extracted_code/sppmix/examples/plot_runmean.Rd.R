library(sppmix)


### Name: plot_runmean
### Title: Checking convergence: running means plot
### Aliases: plot_runmean

### ** Examples

## No test: 
truemix_surf <- rmixsurf(m = 3, lambda=100, xlim = c(-3,3), ylim = c(-3,3))
plot(truemix_surf)
genPPP=rsppmix(intsurf = truemix_surf, truncate = FALSE)
fit <- est_mix_damcmc(pp = genPPP, m = 3)
plot_runmean(fit$genps[,1])
plot_runmean(fit$genps[,2])
plot_runmean(fit$genps[,3])
## End(No test)




