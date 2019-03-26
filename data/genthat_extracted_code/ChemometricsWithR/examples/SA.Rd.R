library(ChemometricsWithR)


### Name: SA
### Title: Simulated Annealing for variable selection in classification
### Aliases: SA SAfun SAfun2 SAstep
### Keywords: optimize

### ** Examples

if (require("pls")) {
data(gasoline, package = "pls")
## usually more than 50 iterations are needed
SAobj <- SAfun(gasoline$NIR, gasoline$octane,
               eval.fun = pls.cvfun, Tinit = 3,
               fraction = .02, niter = 50, ncomp = 2)
SAobj
} else {
  cat("Package pls not available.\nInstall it by typing 'install.packages(\"pls\")'")
}



