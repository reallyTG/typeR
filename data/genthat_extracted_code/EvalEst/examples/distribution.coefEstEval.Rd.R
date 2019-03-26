library(EvalEst)


### Name: distribution.coefEstEval
### Title: Plot distribution of estimates
### Aliases: distribution.coefEstEval distribution.rootsEstEval
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- estVARXls(TSdata(output=outputData(eg1.DSE.data.diff)), max.lag=2)
# now use this as the true model
z <-  EstEval(model, 
    estimation="estVARXls", estimation.args=list(max.lag=2))
distribution(z) 
tfplot(z)



