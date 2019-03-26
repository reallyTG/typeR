library(pRoloc)


### Name: chi2-methods
### Title: The PCP 'chi square' method
### Aliases: chi2 chi2-methods chi2,matrix,matrix-method
###   chi2,matrix,numeric-method chi2,numeric,matrix-method
###   chi2,numeric,numeric-method
### Keywords: methods

### ** Examples

mrk <- rnorm(6)
prot <- matrix(rnorm(60), ncol = 6)
chi2(mrk, prot, method = "Andersen2003")
chi2(mrk, prot, method = "Wiese2007")

pepmark <- matrix(rnorm(18), ncol = 6)
pepprot <- matrix(rnorm(60), ncol = 6)
chi2(pepmark, pepprot)
chi2(pepmark, pepprot, fun = sum)



