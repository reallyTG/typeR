library(biglars)


### Name: diabetes
### Title: Blood and other measurements in diabetics
### Aliases: diabetes diabetes1
### Keywords: datasets

### ** Examples


data(diabetes)

stepFit <- biglars.fit(diabetes$x, diabetes$y, type = "stepwise")
stepFitBlocked <- biglars.fit(diabetes$x, diabetes$y, type = "stepwise",
                           blockSize = 50)

lassoFit <- biglars.fit(diabetes$x, diabetes$y)
lassoFitBlocked <- biglars.fit(diabetes$x, diabetes$y, blockSize = 34)



