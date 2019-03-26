library(smacpod)


### Name: plot.logrrenv
### Title: Plots objects produced by the 'logrr' function.
### Aliases: plot.logrrenv

### ** Examples

data(grave)
logrrsim = logrr(grave, nsim = 9)
plot(logrrsim)
# no border or ribben (legend).  Simple color scheme.
plot(logrrsim, col = c("blue", "white", "orange"), ribbon = FALSE, box = FALSE) 
# alternate color scheme
plot(logrrsim, col = topo.colors(12))



