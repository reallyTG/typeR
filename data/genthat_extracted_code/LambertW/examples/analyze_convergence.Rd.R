library(LambertW)


### Name: analyze_convergence
### Title: Analyze convergence of Lambert W estimators
### Aliases: analyze_convergence plot.convergence_LambertW_fit
###   summary.convergence_LambertW_fit

### ** Examples

## Not run: 
##D 
##D sim.data <- list("Lambert W x Gaussian" = 
##D                     rLambertW(n = 100, distname = "normal", 
##D                               theta = list(gamma = 0.1, beta = c(1, 2))),
##D                  "Cauchy" = rcauchy(n = 100))
##D # do not use lapply() as it does not work well with match.call() in
##D # bootstrap()
##D igmm.ests <- list()
##D conv.analyses <- list()
##D for (nn in names(sim.data)) {
##D   igmm.ests[[nn]] <- IGMM(sim.data[[nn]], type = "s")
##D   conv.analyses[[nn]] <- analyze_convergence(igmm.ests[[nn]])
##D }
##D plot.lists <- lapply(conv.analyses, plot)
##D for (nn in names(plot.lists)) {
##D   plot.lists[[nn]] <- lapply(plot.lists[[nn]], "+", ggtitle(nn))
##D }
##D 
##D require(gridExtra)
##D for (jj in seq_along(plot.lists[[1]])) {
##D   grid.arrange(plot.lists[[1]][[jj]], plot.lists[[2]][[jj]], ncol = 2)
##D }
## End(Not run)




