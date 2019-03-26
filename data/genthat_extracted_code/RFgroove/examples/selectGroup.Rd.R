library(RFgroove)


### Name: selectGroup
### Title: Grouped variable selection procedure
### Aliases: selectGroup

### ** Examples

  cat("\n\nClassification\n")
  data(toyClassif)
  attach(toyClassif)
  
  cat("Case 1\n")
  nvarGroup <- c(2,1,6); names(nvarGroup) <- paste("G", 1:length(nvarGroup), sep="")
  summary(varSel <- selectGroup(design=X, ydata=Y, nvarGroup=nvarGroup, 
                                verbose=TRUE, ntree=500, normalize=FALSE))
  plot(varSel)

  cat("Case 2\n")
  nvarGroup <- rep(1,9); names(nvarGroup) <- paste("G", 1:length(nvarGroup), sep="")
  summary(varSel <- selectGroup(design=X, ydata=Y, nvarGroup=nvarGroup, 
                                verbose=TRUE, ntree=500, normalize=FALSE))
  plot(varSel)

  detach(toyClassif)




