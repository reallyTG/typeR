library(hypervolume)


### Name: hypervolume_gaussian
### Title: Hypervolume construction via Gaussian kernel density estimation
### Aliases: hypervolume_gaussian

### ** Examples

data(iris)
hv = hypervolume_gaussian(data=subset(iris, Species=="setosa")[,1:2],name='setosa')
summary(hv)



