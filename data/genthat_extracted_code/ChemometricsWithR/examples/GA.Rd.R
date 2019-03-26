library(ChemometricsWithR)


### Name: GA
### Title: Genetic Algorithms for variable selection in classification
### Aliases: GA GAfun GAfun2 GA.init.pop GA.select GA.mut GA.XO
### Keywords: optimize

### ** Examples

if (require("pls")) {
  data(gasoline, package = "pls")
  ## Usually more iterations are needed
  GAobj <- GAfun(gasoline$NIR, gasoline$octane,
                 eval.fun = pls.cvfun, niter = 20,
                 kmin = 3, kmax = 25, ncomp = 2)
  GAobj
} else {
  cat("Package pls not available.\nInstall it by typing 'install.packages(\"pls\")'")
}



