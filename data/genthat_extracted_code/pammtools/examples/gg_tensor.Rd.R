library(pammtools)


### Name: gg_tensor
### Title: Plot tensor product effects
### Aliases: gg_tensor

### ** Examples

g <- mgcv::gam(Sepal.Length ~ te(Sepal.Width, Petal.Length), data=iris)
gg_tensor(g)
gg_tensor(g, ci=TRUE)
gg_tensor(update(g, .~. + te(Petal.Width, Petal.Length)))



