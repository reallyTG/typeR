library(copula)


### Name: moCopula-class
### Title: Class "moCopula" of Marshall-Olkin Copulas
### Aliases: moCopula-class
### Keywords: classes

### ** Examples

moCopula()@exprdist[["cdf"]] # a simple definition

methods(class = "moCopula")
contourplot2(moCopula(c(.1, .8)), pCopula, main= "moCopula((0.1, 0.8))")

Xmo <- rCopula(5000, moCopula(c(.2, .5)))
try( # gives an error, as there is no density (!):
loglikCopula(c(.1, .2), Xmo, moCopula())
)

plot(moCopula(c(.9, .2)), n = 10000, xaxs="i", yaxs="i",
     # opaque color (for "density effect"):
     pch = 16, col = adjustcolor("black", 0.3))



