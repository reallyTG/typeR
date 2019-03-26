library(EpiModel)


### Name: plot.netdx
### Title: Plot Dynamic Network Model Diagnostics
### Aliases: plot.netdx
### Keywords: plot

### ** Examples

## Not run: 
##D # Network initialization and model parameterization
##D nw <- network.initialize(100, directed = FALSE)
##D nw <- set.vertex.attribute(nw, "sex", rbinom(100, 1, 0.5))
##D formation <- ~edges + nodematch("sex")
##D target.stats <- c(50, 40)
##D coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 50)
##D 
##D # Estimate the model
##D est <- netest(nw, formation, target.stats, coef.diss, verbose = FALSE)
##D 
##D # Static diagnostics
##D dx1 <- netdx(est, nsims = 1e4, dynamic = FALSE,
##D              nwstats.formula = ~edges + meandeg + concurrent +
##D                                 nodefactor("sex", base = 0) +
##D                                 nodematch("sex"))
##D dx1
##D 
##D # Plot diagnostics
##D plot(dx1)
##D plot(dx1, stats = c("edges", "concurrent"), mean.col = "black",
##D      sim.lines = TRUE, plots.joined = FALSE)
##D plot(dx1, stats = "edges", method = "b",
##D      col = "seagreen3", grid = TRUE)
##D 
##D # Dynamic diagnostics
##D dx2 <- netdx(est, nsims = 10, nsteps = 500,
##D              nwstats.formula = ~edges + meandeg + concurrent +
##D                                 nodefactor("sex", base = 0) +
##D                                 nodematch("sex"))
##D dx2
##D 
##D # Formation statistics plots, joined and separate
##D plot(dx2, grid = TRUE)
##D plot(dx2, type = "formation", plots.joined = TRUE)
##D plot(dx2, type = "formation", sims = 1, plots.joined = TRUE,
##D      qnts = FALSE, sim.lines = TRUE, mean.line = FALSE)
##D plot(dx2, type = "formation", plots.joined = FALSE,
##D      stats = c("edges", "concurrent"), grid = TRUE)
##D 
##D plot(dx2, method = "b", col = "bisque", grid = TRUE)
##D plot(dx2, method = "b", stats = "meandeg", col = "dodgerblue")
##D 
##D # Duration statistics plot
##D plot(dx2, type = "duration", mean.col = "black", grid = TRUE)
##D plot(dx2, type = "duration", sims = 10, mean.line = FALSE, sim.line = TRUE,
##D      sim.col = "steelblue", sim.lwd = 3, targ.lty = 1, targ.lwd = 0.5)
##D 
##D # Dissolution statistics plot
##D plot(dx2, type = "dissolution", mean.col = "black", grid = TRUE)
##D plot(dx2, type = "dissolution", method = "b", col = "pink1")
## End(Not run)




