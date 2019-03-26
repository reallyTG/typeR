library(dse)


### Name: stripMine
### Title: Select a Data Subset and Model
### Aliases: stripMine
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
z <- stripMine(eg1.DSE.data.diff, 
    estimation.methods=list(bft=list(max.lag=2, verbose=FALSE)))



