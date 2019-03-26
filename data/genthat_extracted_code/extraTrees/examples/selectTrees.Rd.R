library(extraTrees)


### Name: selectTrees
### Title: Makes a sub-ExtraTrees object by keeping only selected trees.
### Aliases: selectTrees
### Keywords: regression,classification,trees

### ** Examples

  ## Regression with ExtraTrees:
  n <- 1000  ## number of samples
  p <- 5     ## number of dimensions
  x <- matrix(runif(n*p), n, p)
  y <- (x[,1]>0.5) + 0.8*(x[,2]>0.6) + 0.5*(x[,3]>0.4) + 0.1*runif(nrow(x))
  et <- extraTrees(x, y, nodesize=3, mtry=p, numRandomCuts=2, ntree=500)
  ## random selection of trees:
  trees <- sample(c(FALSE, TRUE), replace=TRUE, et$ntree)
  et2   <- selectTrees(et, selection=trees)



