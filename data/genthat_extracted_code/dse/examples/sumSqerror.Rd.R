library(dse)


### Name: sumSqerror
### Title: Calculate sum of squared prediction errors
### Aliases: sumSqerror
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- estVARXls(eg1.DSE.data.diff)
sumSqerror(1e-10 + coef(model), model=TSmodel(model), 
        data=TSdata(model), error.weights=c(1,1,10))



