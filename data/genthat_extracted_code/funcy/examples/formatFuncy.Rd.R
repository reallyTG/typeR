library(funcy)


### Name: formatFuncy
### Title: Switch between different data formats.
### Aliases: formatFuncy formatFuncy,list,character-method
###   formatFuncy,matrix,character-method

### ** Examples

##Generate regular dataset
set.seed(2005)
ds <- sampleFuncy(obsNr=100, k=6, timeNr=20, reg=TRUE)
Data(ds)

##Format dataset to Format1
newdat <-formatFuncy(data=Data(ds), format="Format1")
newdat

##Back to matrix out of Format1
formatFuncy(newdat, format="Format2")

##To Format3
formatFuncy(newdat, format="Format3")

##Generate irregular dataset
set.seed(2005)
ds <- sampleFuncy(obsNr=100, k=5, timeNrMin=5, timeNrMax=10, reg=FALSE)

res <- formatFuncy(Data(ds), format="Format3", reg=FALSE)
res

##Back to Format1
formatFuncy(data=res, format="Format1", reg=FALSE)



