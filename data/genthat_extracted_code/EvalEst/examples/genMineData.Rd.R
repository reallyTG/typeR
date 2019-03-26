library(EvalEst)


### Name: genMineData
### Title: Generate Data
### Aliases: genMineData build.diagonal.model build.input.models
### Keywords: ts

### ** Examples

    data("eg1.DSE.data.diff", package="dse")
    umodel <- build.diagonal.model(
            build.input.models(eg1.DSE.data.diff, max.lag=2))
    z  <- TSdata(output=outputData(eg1.DSE.data.diff), 
                 input = inputData(eg1.DSE.data.diff))
    ymodel <- TSmodel(estVARXls(z, max.lag=3))   
    sim.data <- genMineData(umodel, ymodel)



