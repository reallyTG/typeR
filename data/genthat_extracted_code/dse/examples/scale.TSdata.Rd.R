library(dse)


### Name: scale.TSdata
### Title: Scale Methods for TS objects
### Aliases: scale.TSdata scale.TSestModel scale.ARMA scale.innov
###   scale.nonInnov checkScale checkScale.TSestModel checkScale.TSmodel
### Keywords: ts

### ** Examples

    data("eg1.DSE.data.diff", package="dse")
    # This is a simple example. Usually scale would have something 
    # to do with the magnitude of the data.
    z <- scale(eg1.DSE.data.diff, 
        scale=list(input=rep(2, nseriesInput(eg1.DSE.data.diff)), 
                  output=rep(2,nseriesOutput(eg1.DSE.data.diff))))
    model <- estVARXls(eg1.DSE.data.diff)
    model <- scale(model, 
        scale=list(input=rep(2, nseriesInput(eg1.DSE.data.diff)), 
                  output=rep(2,nseriesOutput(eg1.DSE.data.diff))))



