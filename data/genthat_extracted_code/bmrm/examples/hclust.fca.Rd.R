library(bmrm)


### Name: hclust.fca
### Title: Find first common ancestor of 2 nodes in an hclust object
### Aliases: hclust.fca

### ** Examples

  hc <- hclust(dist(USArrests), "complete")
  plot(hc)
  A <- outer(seq_along(hc$order),seq_along(hc$order),hclust.fca,hc=hc)
  H <- array(hc$height[A],dim(A))
  image(H[hc$order,hc$order])
  image(A[hc$order,hc$order])



