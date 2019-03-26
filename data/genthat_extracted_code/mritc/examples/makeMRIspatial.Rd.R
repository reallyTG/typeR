library(mritc)


### Name: makeMRIspatial
### Title: Obtain Spatial Features of a Mask of an MR Image
### Aliases: makeMRIspatial
### Keywords: spatial

### ** Examples

  mask <- array(1, dim=c(2,2,2))
  spa <- makeMRIspatial(mask, nnei=6, sub=FALSE)
  spa <- makeMRIspatial(mask, nnei=6, sub=TRUE)
  spa <- makeMRIspatial(mask, nnei=26, sub=TRUE, bias=TRUE)



