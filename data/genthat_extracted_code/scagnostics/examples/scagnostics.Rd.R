library(scagnostics)


### Name: scagnostics
### Title: Calculcate scagnostics for pairs of variables
### Aliases: scagnostics scagnostics.default scagnostics.matrix
###   scagnostics.data.frame scagnostics.list scagnosticsOutliers
###   scagnosticsExemplars scagnosticsGrid
### Keywords: hplot

### ** Examples

# tesing various forms
scagnostics(1:10, 1:10)
scagnostics(rnorm(100), rnorm(100))
scagnostics(as.matrix(mtcars))

# more real use on a dataset
s <- scagnostics(mtcars)

# look at outliers
o <- scagnosticsOutliers(s)
o[o]
# one outlier, let's plot it
g <- scagnosticsGrid(s)
go <- g[o,]
plot(mtcars[[go$x]], mtcars[[go$y]], pch=19,
     xlab=names(mtcars)[go$x], ylab=names(mtcars)[go$y])

# find and plot exemplars
e <- scagnosticsExemplars(s)
e[e]
ge <- g[e,]
par(mfrow = c(2,2))
for (i in 1:dim(ge)[1])
  plot(mtcars[[ge$x[i]]], mtcars[[ge$y[i]]], pch=19,
       xlab=names(mtcars)[ge$x[i]], ylab=names(mtcars)[ge$y[i]])



