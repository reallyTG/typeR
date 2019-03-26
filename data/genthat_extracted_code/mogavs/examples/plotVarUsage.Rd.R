library(mogavs)


### Name: plotVarUsage
### Title: Produce a visual summary of how many times each variable appears
###   on the efficient frontier.
### Aliases: plotVarUsage
### Keywords: models regression

### ** Examples

data(sampleData)
mod<-mogavs(y~.,data=sampleData,maxGenerations=20)
plotVarUsage(mod,"table")
plotVarUsage(mod,"hist")
plotVarUsage(mod,"plot")



