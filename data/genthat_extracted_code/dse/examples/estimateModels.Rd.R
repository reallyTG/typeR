library(dse)


### Name: estimateModels
### Title: Estimate Models
### Aliases: estimateModels is.estimatedModels
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
z <-  estimateModels(eg1.DSE.data.diff, estimation.methods= list(
        bft=list(verbose=FALSE), 
        estVARXar=list(max.lag=3)))



