library(scaleboot)


### Name: sbpval
### Title: Extract P-values
### Aliases: sbpval sbpval.summary.scaleboot sbpval.summary.scalebootv
### Keywords: models nonparametric

### ** Examples

data(mam15)
a <- mam15.relltest[["t4"]] # an object of class "scaleboot"
b <- summary(a) # calculate p-values
b # print the p-values
sbpval(b) # extract a vector of p-values which are averaged by Akaike weights.
sbpval(b,sd=TRUE) # with sd
sbpval(b,select="all") # extract a matrix of p-values
sbpval(b,select="all",sd=TRUE) # with sd



