library(iRegression)


### Name: summary.bivar
### Title: Summarizing Bivariate Symbolic Regression Method Fits
### Aliases: summary.bivar
### Keywords: summary bivar

### ** Examples

##-- Continuing the  bivar() example:
data("soccer.bivar", package = "iRegression")
ex.bivar <- bivar(yMin~t1Min+t2Min, "identity", yMax~t1Max+t2Max, "identity", data=soccer.bivar)
ex.sum <- summary(ex.bivar)
ex.sum



