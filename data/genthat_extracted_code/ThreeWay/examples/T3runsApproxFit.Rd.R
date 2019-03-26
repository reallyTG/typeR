library(ThreeWay)


### Name: T3runsApproxFit
### Title: Approximated Tucker3 solutions
### Aliases: T3runsApproxFit
### Keywords: array multivariate algebra

### ** Examples

data(Bus)
# Fit values of T3 with different numbers of components (from 1 to 4 for the A-mode, 
# from 1 to 3 for the B-mode, from 1 to 5 for the C-mode)
FitT3 <- T3runsApproxFit(Bus, 7, 5, 37, 4, 3, 5)



