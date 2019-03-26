library(EpiModel)


### Name: netdx
### Title: Dynamic Network Model Diagnostics
### Aliases: netdx

### ** Examples

## Not run: 
##D # Network initialization and model parameterization
##D nw <- network.initialize(100, directed = FALSE)
##D formation <- ~edges
##D target.stats <- 50
##D coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 25)
##D 
##D # Estimate the model
##D est <- netest(nw, formation, target.stats, coef.diss, verbose = FALSE)
##D 
##D # Static diagnostics on the ERGM fit
##D dx1 <- netdx(est, nsims = 1e4, dynamic = FALSE,
##D              nwstats.formula = ~edges + meandeg + concurrent)
##D dx1
##D plot(dx1, method = "b", stats = c("edges", "concurrent"))
##D 
##D # Dynamic diagnostics on the STERGM approximation
##D dx2 <- netdx(est, nsims = 5, nsteps = 500,
##D              nwstats.formula = ~edges + meandeg + concurrent,
##D              set.control.ergm = control.simulate.ergm(MCMC.burnin = 1e6))
##D dx2
##D plot(dx2, stats = c("edges", "meandeg"), plots.joined = FALSE)
##D plot(dx2, type = "duration")
##D plot(dx2, type = "dissolution", qnts.col = "orange2")
##D plot(dx2, type = "dissolution", method = "b", col = "bisque")
## End(Not run)




