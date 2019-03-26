library(RaPKod)


### Name: od.opt.param
### Title: Optimal Parameter Values In RaPKod
### Aliases: od.opt.param

### ** Examples

data(iris)

##Define data frame with non-outliers
inliers = iris[sample(which(iris$Species!="setosa"), 100, replace=FALSE),
                                              -which(names(iris)=="Species")]
                                              
param <- od.opt.param(inliers)

#display optimal gamma
param$gamma.opt
#display optimal p
param$p.opt




