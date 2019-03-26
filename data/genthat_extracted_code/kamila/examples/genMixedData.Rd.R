library(kamila)


### Name: genMixedData
### Title: Generate simulated mixed-type data with cluster structure.
### Aliases: genMixedData

### ** Examples

dat <- genMixedData(100, 2, 2, nCatLevels=4, nConWithErr=1, nCatWithErr=1,
  popProportions=c(0.3,0.7), conErrLev=0.3, catErrLev=0.2)
with(dat,plot(conVars,col=trueID))
with(dat,table(data.frame(catVars[,1:2],trueID)))



