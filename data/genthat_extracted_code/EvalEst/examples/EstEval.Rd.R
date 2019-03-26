library(EvalEst)


### Name: EstEval
### Title: Evaluate an estimation method
### Aliases: EstEval is.EstEval
### Keywords: ts

### ** Examples

    data("eg1.DSE.data.diff", package="dse")
    model <- estVARXls(TSdata(output=outputData(eg1.DSE.data.diff)))
    z <-  EstEval(model, 
       estimation="estVARXls", estimation.args=list(max.lag=2))
    tfplot(z)
    zz <-  EstEval(model, 
       estimation="estVARXls", estimation.args=list(max.lag=2),
       simulation.args=list(sampleT=50, sd=1.5))
    is.EstEval(z)



