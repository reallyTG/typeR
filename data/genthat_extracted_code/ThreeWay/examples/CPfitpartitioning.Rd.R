library(ThreeWay)


### Name: CPfitpartitioning
### Title: Fit of each entity per mode
### Aliases: CPfitpartitioning
### Keywords: array multivariate algebra

### ** Examples

data(TV)
TVdata=TV[[1]]
labSCALE=TV[[2]]
labPROGRAM=TV[[3]]
labSTUDENT=TV[[4]]
# permutation of the modes so that the A-mode refers to students
TVdata <- permnew(TVdata, 16, 15, 30)
TVdata <- permnew(TVdata, 15, 30, 16)
# CP solution
TVcp <- CPfuncrep(TVdata, 30, 16, 15, 2, 1, 1, 1, 0, 1e-6, 10000)
# Fitpartitioning of the CP solution
FitCP <-  CPfitpartitioning(TVdata, 30, 16, 15, TVcp$A, TVcp$B, TVcp$C, 
 labSTUDENT, labSCALE, labPROGRAM)
# Fitpartitioning of the CP solution (when labels are not available)
FitCP <-  CPfitpartitioning(TVdata, 30, 16, 15, TVcp$A, TVcp$B, TVcp$C)



