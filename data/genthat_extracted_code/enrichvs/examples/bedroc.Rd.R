library(enrichvs)


### Name: bedroc
### Title: Function to culculate the Boltzmann-Enhanced Discrimination of
###   ROC (BEDROC)
### Aliases: bedroc

### ** Examples

x <- rnorm(1000)  # random scores for 1000 compounds
y <- c(rep(1,50), rep(0,950))     # activity labels for "x"
bedroc(x, y)

data(dud_egfr)
bedroc(dud_egfr$energy, dud_egfr$label, decreasing=FALSE)



