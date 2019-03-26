library(HPbayes)


### Name: loop.optim
### Title: Optimizer step for estimating the Heligman-Pollard Parameters
###   using the Bayesian Melding with IMIS-opt procedure
### Aliases: loop.optim
### Keywords: misc

### ** Examples

#Generate a prior and numbers of death and persons at risk#
## Not run: 
##D q0 <- prior.form()
##D lx <- c(1974, 1906, 1860, 1844, 1834, 1823, 1793, 1700, 1549, 1361, 
##D 1181, 1025, 870, 721, 571, 450, 344, 256, 142, 79, 41, 8)
##D dx <- c(68, 47, 16, 10, 13, 29, 92, 151, 188, 179, 156, 155, 147, 150, 
##D 122, 106, 88, 113, 63, 38, 32, 8)
##D opt.result <- loop.optim(prior=q0, nrisk=lx, ndeath=dx)
## End(Not run)



