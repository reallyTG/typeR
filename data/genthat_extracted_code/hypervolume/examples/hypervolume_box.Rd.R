library(hypervolume)


### Name: hypervolume_box
### Title: Hypervolume construction via hyperbox kernel density estimation
### Aliases: hypervolume_box

### ** Examples

data(iris)
hv = hypervolume_box(data=subset(iris, Species=="setosa")[,1:2],name='setosa')
summary(hv)



