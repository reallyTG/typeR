library(tactile)


### Name: xyplot.lm
### Title: Lattice plot diagnostics for lm objects
### Aliases: xyplot.lm

### ** Examples

fit <- lm(Sepal.Length ~ Sepal.Width, data = iris)
xyplot(fit)
xyplot(fit, which = 5)



