library(hypervolume)


### Name: hypervolume
### Title: Hypervolume construction methods
### Aliases: hypervolume

### ** Examples

data(iris)
hv = hypervolume(data=subset(iris, Species=="setosa")[,1:2],method='box')
summary(hv)



