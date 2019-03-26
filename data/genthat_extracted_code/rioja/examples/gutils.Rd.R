library(rioja)


### Name: gutils
### Title: Graphic utilities.
### Aliases: hulls figCnvt
### Keywords: aplot

### ** Examples

data(iris)
with(iris, plot(Sepal.Width, Sepal.Length, col=as.integer(Species)))
with(iris, hulls(Sepal.Width, Sepal.Length, gr=(Species)))



