library(dse)


### Name: print.TSestModel
### Title: Display TSmodel Arrays
### Aliases: print.TSestModel print.SS print.ARMA
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- estVARXls(eg1.DSE.data.diff)
print(model)
print(model, digits=3)
print(model, digits=3, fuzz=0.001)
print(model, digits=3, fuzz=0.001, latex=TRUE)



