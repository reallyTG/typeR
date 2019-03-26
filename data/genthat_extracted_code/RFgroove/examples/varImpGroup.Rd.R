library(RFgroove)


### Name: varImpGroup
### Title: A grouped variable importance with Random Forests
### Aliases: varImpGroup

### ** Examples

  data(toyClassif)
  attach(toyClassif)

  rf <- randomForest(x=X,y=Y,keep.forest=TRUE, keep.inbag=TRUE, ntree=500)
  ngroups <- 3
  nvarGroup <- c(4,3,6)
  idxGroup <- list(c(0,1,2,5), c(2,4,5), c(0,1,5,6,7,8))
  grImp <- varImpGroup(rf, X, ngroups, nvarGroup, idxGroup, NULL, normalize=FALSE )
  cat("Group importance\n", grImp, "\n")

  detach(toyClassif)



