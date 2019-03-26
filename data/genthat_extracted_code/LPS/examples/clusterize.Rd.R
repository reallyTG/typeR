library(LPS)


### Name: clusterize
### Title: Hierarchical clustering heat maps
### Aliases: clusterize hclust.ward dist.COR

### ** Examples

  # Data with features in columns
  data(rosenwald)
  group <- rosenwald.cli$group
  expr <- t(rosenwald.expr)[,1:100]
  
  # NA imputation (feature's mean to minimize impact)
  f <- function(x) { x[ is.na(x) ] <- round(mean(x, na.rm=TRUE), 3); x }
  expr <- apply(expr, 2, f)
  
  # Simple heat map
  clusterize(expr)
  
  # With annotation (row named data.frame)
  side <- data.frame(group, row.names=rownames(expr))
  clusterize(expr, side=side)



