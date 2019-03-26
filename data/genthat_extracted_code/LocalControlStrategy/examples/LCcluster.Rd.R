library(LocalControlStrategy)


### Name: LCcluster
### Title: Hierarchical Clustering of experimental units (such as patients)
###   in X-covariate Space
### Aliases: LCcluster
### Keywords: cluster design

### ** Examples

data(radon)
xvars  <- c("obesity", "over65", "cursmoke")
hclobj <- LCcluster(radon, xvars)  # ...using default method = "ward.D"
plot(hclobj)  



