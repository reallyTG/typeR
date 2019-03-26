library(iRegression)


### Name: soccer.bivar
### Title: Soccer Interval Data Set
### Aliases: soccer.bivar
### Keywords: datasets

### ** Examples

data("soccer.bivar", package = "iRegression")

bivar1 <- bivar(yMin~t1Min+t2Min, "identity", yMax~t1Max+t2Max, "identity", data=soccer.bivar)
summary(bivar1)



