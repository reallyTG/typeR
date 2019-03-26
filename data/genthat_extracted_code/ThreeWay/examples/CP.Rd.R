library(ThreeWay)


### Name: CP
### Title: Interactive Candecomp/Parafac analysis
### Aliases: CP
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
## Not run: 
##D # interactive CP analysis
##D TVcp <- CP(TVdata, labSTUDENT, labSCALE, labPROGRAM)
##D # interactive CP analysis (when labels are not available)
##D TVcp <- CP(TVdata)
## End(Not run)



