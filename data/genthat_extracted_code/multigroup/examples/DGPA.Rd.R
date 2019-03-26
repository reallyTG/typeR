library(multigroup)


### Name: DGPA
### Title: Dual Generalized Procrustes Analysis
### Aliases: DGPA

### ** Examples

Data = iris[,-5]
Group = iris[,5]
res.DGPA = DGPA(Data, Group, graph=TRUE)
loadingsplot(res.DGPA, axes=c(1,2))
scoreplot(res.DGPA, axes=c(1,2))



