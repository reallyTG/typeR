library(hypervolume)


### Name: hypervolume_estimate_probability
### Title: Estimate probability a given location
### Aliases: hypervolume_estimate_probability

### ** Examples

data(iris)
iris_ss = subset(iris, Species=="setosa")[,1:3]
hv = hypervolume_box(data=iris_ss,name='setosa')
probs <- hypervolume_estimate_probability(hv, points=iris_ss) 
# first point should have non-zero density, second, zero



