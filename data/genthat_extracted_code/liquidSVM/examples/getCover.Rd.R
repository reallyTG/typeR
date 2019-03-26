library(liquidSVM)


### Name: getCover
### Title: Get Cover of partitioned SVM
### Aliases: getCover

### ** Examples

## Not run: 
##D banana <- liquidData('banana-mc')
##D model <- mcSVM(Y~.,banana$train, voronoi=c(4,500),d=1)
##D # task 4 is predicting 2 vs 3
##D cover <- getCover(model,task=4)
##D centers <- cover$samples
##D # we are considering task 4 and hence only show labels 2 and 3:
##D bananaSub <- banana$train[banana$train$Y %in% c(2,3),]
##D plot(bananaSub[,-1],col=bananaSub$Y)
##D points(centers,pch='x',cex=2)
##D 
##D if(require(deldir)){
##D   voronoi <- deldir::deldir(centers$X1,centers$X2,rw=c(range(bananaSub$X1),range(bananaSub$X2)))
##D   plot(voronoi,wlines="tess",add=TRUE, lty=1)
##D   text(centers$X1,centers$X2,1:nrow(centers),pos=1)
##D }
##D 
##D # let us calculate for every sample in this task which cell it belongs to
##D distances <- as.matrix(dist(model$train_data))
##D cells <- apply(distances[model$train_labels %in% c(2,3),cover$indices],1,which.min)
##D # and you can check that the cell sizes are as reported in the training phase for task 4
##D table(cells)
## End(Not run)



