library(arrApply)


### Name: arrApply
### Title: High Performance Variant of apply()
### Aliases: arrApply

### ** Examples

 arr=matrix(1:12, 3, 4)
 v1=arrApply(arr, 2, "mean")
 v2=rowMeans(arr)
 stopifnot(all(v1==v2))
 
 arr=array(1:24, dim=2:4) # dim(arr)=c(2, 3, 4)
 mat=arrApply(arr, 2, "prod") # dim(mat)=c(2, 4), the second dimension is cut out
 stopifnot(all(mat==apply(arr, c(1, 3), prod)))




