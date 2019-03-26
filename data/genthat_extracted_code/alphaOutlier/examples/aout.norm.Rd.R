library(alphaOutlier)


### Name: aout.norm
### Title: Find alpha-outliers in normal data
### Aliases: aout.norm
### Keywords: distribution

### ** Examples
iris.setosa <- iris[1:51, 4]
# implosion breakdown point:
aout.norm(data = iris.setosa, param = c(median(iris.setosa), mad(iris.setosa)), 
          alpha = 0.01) 
# better:
aout.norm(data = iris.setosa, param = c(median(iris.setosa), sd(iris.setosa)), 
          alpha = 0.01) 



