library(PerformanceAnalytics)


### Name: checkData
### Title: check input data type and format and coerce to the desired
###   output type
### Aliases: checkData

### ** Examples


data(edhec)
x = checkData(edhec)
class(x)
head(x)
tail(x)
# Note that passing in a single column loses the row and column names
x = checkData(edhec[,1])
class(x)
head(x)
# Include the "drop" attribute to keep row and column names
x = checkData(edhec[,1,drop=FALSE])
class(x)
head(x)
x = checkData(edhec, method = "matrix")
class(x)
head(x)
x = checkData(edhec[,1], method = "vector")
class(x)
head(x)




