library(biglars)


### Name: biglars.fit
### Title: Least-Angle, Lasso and Stepwise Regression
### Aliases: biglars.fit biglars.fit.lasso biglars.fit.lar
###   biglars.fit.stepwise
### Keywords: regression

### ** Examples


data(diabetes)

larFit <- biglars.fit(diabetes$x, diabetes$y, type = "lar")
larFitBlocked <- biglars.fit(diabetes$x, diabetes$y, type = "lar",
                           blockSize = 50)

lassoFit <- biglars.fit(diabetes$x, diabetes$y, type = "lasso")
lassoFitBlocked <- biglars.fit(diabetes$x, diabetes$y, type = "lasso",
                              blockSize = 34)




