library(lmSupport)


### Name: dfMerge
### Title: Merges two data frames
### Aliases: dfMerge
### Keywords: manip

### ** Examples

dX <- data.frame(v1=c(1,2,3,4,5), v2=c(1,NA,NA,2,4), data=1:5)
rownames(dX) = c(1,2,3,4,5)
dY <- data.frame(v3=c(3,2,1,4,15), v4=c(2,4,5,6,7), data=6:10)
rownames(dY) = c(1,2,3,4,6)
dNew = dfMerge(dX,dY)



