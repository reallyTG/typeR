library(pammtools)


### Name: gg_smooth
### Title: Plot smooth 1d terms of gam objects
### Aliases: gg_smooth gg_smooth.default

### ** Examples

g1 <- mgcv::gam(Sepal.Length ~ s(Sepal.Width) + s(Petal.Length), data=iris)
gg_smooth(iris, g1, terms=c("Sepal.Width", "Petal.Length"))



