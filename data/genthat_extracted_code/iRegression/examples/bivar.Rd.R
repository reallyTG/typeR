library(iRegression)


### Name: bivar
### Title: Bivariate Symbolic Regression Method
### Aliases: bivar bivar.default bivar.formula
### Keywords: bivar

### ** Examples

data("soccer.bivar", package = "iRegression")
ex.bivar <- bivar("yMin~t1Min+t2Min", "identity", "yMax~t1Max+t2Max", "identity", data=soccer.bivar)
ex.bivar



