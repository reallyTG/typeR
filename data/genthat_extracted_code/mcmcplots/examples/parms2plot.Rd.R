library(mcmcplots)


### Name: parms2plot
### Title: Matches groups of parameters to plot in MCMC diagnostics plots.
### Aliases: parms2plot
### Keywords: utilities

### ** Examples

prm <- c(paste("gamma[", 1:30, "]", sep=""), paste("alpha[", 1:20, "]", sep=""))

parms2plot(prm, NULL, NULL, NULL)      # returns all
parms2plot(prm, NULL, NULL, 5)         # returns 5 randomly from each group
parms2plot(prm, NULL, NULL, c(5, 10))  # 5 from gamma, 10 from alpha
parms2plot(prm, NULL, NULL, c(10, NA)) # 10 from gamma, all from alpha
parms2plot(prm, "alpha", NULL, NULL)   # all alphas
parms2plot(prm, "gamma", NULL, NULL)   # all gammas
parms2plot(prm, NULL, "alpha\\[1[[:digit:]]\\]$", NULL)   # alpha[10]-alpha[19]
parms2plot(prm, "gamma", "alpha\\[1[[:digit:]]\\]$", NULL)  # all gamma and alpha[10]-alpha[19]



