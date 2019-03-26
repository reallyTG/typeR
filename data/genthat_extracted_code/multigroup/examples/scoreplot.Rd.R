library(multigroup)


### Name: scoreplot
### Title: Score plot for multigroup data
### Aliases: scoreplot

### ** Examples

Data = iris[,-5]
Group = iris[,5]
res.mgPCA = mgPCA (Data, Group, graph=TRUE)
scoreplot(res.mgPCA, axes=c(1,2))



