library(ThreeWay)


### Name: pcamean
### Title: PCA of the mean matrix
### Aliases: pcamean
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
##D # PCA on the mean matrix
##D TVpcamean <- pcamean(TVdata, 30, 16, 15, labSTUDENT, labSCALE, labPROGRAM)
##D # PCA on the mean matrix (when labels are not available)
##D TVpcamean <- pcamean(TVdata, 30, 16, 15)
## End(Not run)



