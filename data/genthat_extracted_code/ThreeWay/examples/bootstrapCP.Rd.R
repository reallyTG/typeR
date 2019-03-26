library(ThreeWay)


### Name: bootstrapCP
### Title: Bootstrap percentile intervals for CANDECOMP/PARAFAC
### Aliases: bootstrapCP
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
## Not run: 
##D # Bootstrap analysis on CP solution
##D boot <- bootstrapCP(TVdata, TVcp$A, TVcp$B, TVcp$C, 30, 16, 15, 2, 1, 1, 1, 
##D  1e-6, 0, 0, 0, 10000, labSTUDENT, labSCALE, labPROGRAM)
##D # Bootstrap analysis on CP solution (when labels are not available)
##D boot <- bootstrapCP(TVdata, TVcp$A, TVcp$B, TVcp$C, 30, 16, 15, 2, 1, 1, 1, 
##D  1e-6, 0, 0, 0, 10000)
## End(Not run)



