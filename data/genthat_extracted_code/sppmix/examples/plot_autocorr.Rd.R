library(sppmix)


### Name: plot_autocorr
### Title: Checking convergence: autocorrelation plot
### Aliases: plot_autocorr

### ** Examples

## No test: 
truemix_surf <- rmixsurf(m = 3, lambda=100, xlim = c(-3,3), ylim = c(-3,3))
plot(truemix_surf)
genPPP=rsppmix(intsurf = truemix_surf, truncate = FALSE)
fit <- est_mix_damcmc(pp = genPPP, m = 3)
plot_autocorr(fit$genps[,1])
plot_autocorr(fit$genps[,2])
plot_autocorr(fit$genps[,3])
## End(No test)




