library(ThreeWay)


### Name: CPrunsFit
### Title: Candecomp/Parafac solutions
### Aliases: CPrunsFit
### Keywords: array multivariate algebra

### ** Examples

data(TV)
TVdata=TV[[1]]
# permutation of the modes so that the A-mode refers to students
TVdata <- permnew(TVdata, 16, 15, 30)
TVdata <- permnew(TVdata, 15, 30, 16)
# Fit values of CP with different numbers of components (from 1 to 5)
FitCP <- CPrunsFit(TVdata, 30, 16, 15, 5)



