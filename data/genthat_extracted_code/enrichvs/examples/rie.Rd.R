library(enrichvs)


### Name: rie
### Title: Function to culculate the Robust Initial Enhancement (RIE)
### Aliases: rie

### ** Examples

x <- rnorm(1000)  # random scores for 1000 compounds
y <- c(rep(1,50), rep(0,950))     # activity labels for "x"
rie(x, y)

data(dud_egfr)
rie(dud_egfr$energy, dud_egfr$label, decreasing=FALSE)




