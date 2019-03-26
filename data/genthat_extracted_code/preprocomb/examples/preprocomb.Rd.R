library(preprocomb)


### Name: preprocomb
### Title: the MAIN function of programmatic use.
### Aliases: preprocomb

### ** Examples

## modifiediris <- droplevels(iris[-c(1:60),])
## grid <- setgrid(phases=c("outliers", "scaling"), data=modifiediris)
## library(kernlab)
## result <- preprocomb(models=c("svmRadial"), grid=grid, nholdout=1, search="grid")
## result@allclassification
## result@allclustering
## result@alloutliers
## result@rawall
## result@catclassification
##
## newphases <- c("outliers", "smoothing", "scaling", "selection", "sampling")
## newmodels <- c("knn", "rf", "svmRadial")
## grid1 <- setgrid(phases=newphases, data=modifiediris)
## result1 <- preprocomb(models=newmodels, grid=grid1, nholdout=1, search="grid")



