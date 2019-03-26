library(chi2x3way)


### Name: chi2x3way
### Title: Chi-square and Marcotorchino's index for three-way contingency
###   tables
### Aliases: chi2x3way
### Keywords: partition chi-squared index Marcotorchino index

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
## The function is currently defined as
data(olive)
chi2x3way(olive, scen = 2, indextype = "tauM", simulation = FALSE, nboots = 100, nran = 1000,
pi = rep(1/dim(olive)[[1]],dim(olive)[[1]]), pj = rep(1/dim(olive)[[2]],dim(olive)[[2]]),
pk = rep(1/dim(olive)[[3]],dim(olive)[[3]]), digits = 3)



