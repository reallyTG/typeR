library(dse)


### Name: l.SS
### Title: Evaluate a state space TSmodel
### Aliases: l.SS
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- toSS(TSmodel(estVARXls(eg1.DSE.data.diff)))
lmodel <- l(model,eg1.DSE.data.diff)
summary(lmodel)
tfplot(lmodel)
lmodel <- l(model,eg1.DSE.data.diff, return.state=TRUE)
tfplot(state(lmodel, filter=TRUE))



