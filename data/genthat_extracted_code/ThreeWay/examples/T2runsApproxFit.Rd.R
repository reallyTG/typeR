library(ThreeWay)


### Name: T2runsApproxFit
### Title: Approximated Tucker2 solutions
### Aliases: T2runsApproxFit
### Keywords: array multivariate algebra

### ** Examples

data(Bus)
# Fit values of T2-AB with different numbers of components 
# (from 1 to 3 for the B-mode, from 1 to 5 for the C-mode)
FitT2 <- T2runsApproxFit(Bus, 7, 5, 37, 7, 3, 5, 3)



