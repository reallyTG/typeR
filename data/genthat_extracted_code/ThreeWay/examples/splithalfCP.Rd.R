library(ThreeWay)


### Name: splithalfCP
### Title: Split-Half Analysis
### Aliases: splithalfCP
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
##D # Split-half analysis on CP solution
##D splitCP <- splithalfCP(TVdata, 30, 16, 15, 2, 0, 0, 0, 5, 1e-6, 10000, 1, 1, 1, 
##D  labSTUDENT, labSCALE, labPROGRAM)
##D # Split-half analysis on CP solution (when labels are not available)
##D splitCP <- splithalfCP(TVdata, 30, 16, 15, 2, 0, 0, 0, 5, 1e-6, 10000, 1, 1, 1)
## End(Not run)



