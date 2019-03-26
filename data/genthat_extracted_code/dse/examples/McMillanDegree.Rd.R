library(dse)


### Name: McMillanDegree
### Title: Calculate McMillan Degree
### Aliases: McMillanDegree McMillanDegree.ARMA McMillanDegree.SS
###   McMillanDegree.TSestModel
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- estVARXls(eg1.DSE.data.diff)
McMillanDegree(model)



