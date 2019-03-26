library(multigroup)


### Name: FCPCA
### Title: Flury's Common Principal Component Analysis
### Aliases: FCPCA

### ** Examples

Data = iris[,-5]
Group = iris[,5]
res.FCPCA = FCPCA(Data, Group, graph=TRUE)
loadingsplot(res.FCPCA, axes=c(1,2))
scoreplot(res.FCPCA, axes=c(1,2))



