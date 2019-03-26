library(pammtools)


### Name: gg_fixed
### Title: Forrest plot of fixed coefficients
### Aliases: gg_fixed

### ** Examples

g <- mgcv::gam(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species,
 data=iris)
gg_fixed(g, intercept=TRUE)
gg_fixed(g)



