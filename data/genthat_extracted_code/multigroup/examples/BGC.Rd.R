library(multigroup)


### Name: BGC
### Title: Between Group Comparison
### Aliases: BGC

### ** Examples

Data = iris[,-5]
Group = iris[,5]
res.BGC = BGC(Data, Group, graph=TRUE)
loadingsplot(res.BGC, axes=c(1,2))
scoreplot(res.BGC, axes=c(1,2))



