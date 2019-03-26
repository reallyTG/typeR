library(multigroup)


### Name: loadingsplot
### Title: loadings plot
### Aliases: loadingsplot

### ** Examples

Data = iris[,-5]
Group = iris[,5]
res.mgPCA = mgPCA (Data, Group, graph=TRUE)
loadingsplot(res.mgPCA, axes=c(1,2))



