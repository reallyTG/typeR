library(dispRity)


### Name: space.maker
### Title: Creating multidimensional spaces
### Aliases: space.maker

### ** Examples

## A square space
plot(space.maker(5000, 2, runif), pch = 20)

## A circular space
plot(space.maker(5000, 2, rnorm), pch = 20)

## A 2-dimensional cylindrical space
plot(space.maker(5000, 2, c(rnorm, runif)), pch = 20)

## A 4-dimensional space with different distributions
space.maker(5, 4, c(runif, runif, rnorm, rgamma),
     arguments = list(list(min = 1, max = 10), list(min = 1, max = 2),
     list(mean = 8), list(shape = 1)))

## A 3-dimensional correlated space
cor_matrix <- matrix(cbind(1, 0.8 ,0.2, 0.8, 1, 0.7, 0.2, 0.7, 1), nrow = 3)
space <- space.maker(10000, 3, rnorm, cor.matrix = cor_matrix)
round(cor(space), 1) ; cor_matrix ## Both should be really similar matrices

## A 3-dimensional space with a priori approximated variance for each dimension
space <- space.maker(10000, 3, rnorm, scree = c(0.6, 0.3, 0.1))
## The resulting screeplot
barplot(apply(space, 2, var))

## Not run: 
##D require(scatterplot3d)
##D ## A cube space
##D scatterplot3d(space.maker(5000, 3, runif), pch = 20)
##D 
##D ## A plane space
##D scatterplot3d(space.maker(5000, 3, c(runif, runif, runif),
##D      arguments = list(list(min = 0, max = 0), NULL, NULL)), pch = 20)
##D 
##D ## A sphere space
##D scatterplot3d(space.maker(5000, 3, rnorm), pch = 20)
##D 
##D ## A 3D cylindrical space
##D scatterplot3d(space.maker(5000, 3, c(rnorm, rnorm, runif)), pch = 20)
##D 
##D ## Generating a doughnut space
##D doughnut <- space.maker(5000, 3, c(rnorm, random.circle),
##D      arguments = list(list(mean = 0), list(runif, inner = 0.5, outer = 1)))
##D ## Reodering the axis for projecting the dougnut in 2D
##D scatterplot3d(doughnut[,c(2,1,3)], pch = 20)
## End(Not run)




