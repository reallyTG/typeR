library(sppmix)


### Name: plot_convdiags
### Title: Checking convergence visually
### Aliases: plot_convdiags

### ** Examples

## No test: 
truemix_surf <- rmixsurf(m = 3, lambda=100, xlim = c(-3,3), ylim = c(-3,3))
plot(truemix_surf)
genPPP=rsppmix(intsurf = truemix_surf, truncate = FALSE)
fit = est_mix_damcmc(pp = genPPP, m = 3)
plot_convdiags(fit)
## End(No test)




