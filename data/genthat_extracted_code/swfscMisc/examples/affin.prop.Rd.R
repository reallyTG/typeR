library(swfscMisc)


### Name: affin.prop
### Title: Affinity Propagation
### Aliases: affin.prop

### ** Examples

data(iris)

# Take 75 random iris rows for example
iris <- iris[sample(1:nrow(iris), 75), ]
iris <- droplevels(iris)

iris.sim <- -dist(iris[, -5])

iris.affin <- affin.prop(iris.sim, stable.iter = 5)
table(iris$Species, iris.affin[, ncol(iris.affin)])




