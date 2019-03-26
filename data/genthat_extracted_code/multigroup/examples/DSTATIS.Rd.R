library(multigroup)


### Name: DSTATIS
### Title: Dual STATIS
### Aliases: DSTATIS

### ** Examples

Data = iris[,-5]
Group = iris[,5]
res.DSTATIS = DSTATIS(Data, Group, graph=TRUE)
loadingsplot(res.DSTATIS, axes=c(1,2))
scoreplot(res.DSTATIS, axes=c(1,2))



