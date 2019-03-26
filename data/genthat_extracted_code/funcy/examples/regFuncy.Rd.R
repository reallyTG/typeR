library(funcy)


### Name: regFuncy
### Title: Converts irregular data into regular.
### Aliases: regFuncy
### Keywords: format

### ** Examples

##Generate irregular dataset
set.seed(2705)
ds <- sampleFuncy(reg=FALSE, obsNr=100, timeNrMin=5, timeNrMax=10)


reg <- regFuncy(Data(ds), timeNr=10, baseType="splines",nbasis=5, method="project")

reg <- regFuncy(Data(ds),timeNr=10, method="interpolate")

## Not run: 
##D reg <- regFuncy(Data(ds), timeNr=10, baseType="eigenbasis", nbasis=5,
##D method="project")
## End(Not run)




