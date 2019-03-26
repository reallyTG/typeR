library(dse)


### Name: smoother
### Title: Evaluate a smoother with a TSmodel
### Aliases: smoother smoother.TSestModel smoother.TSmodel
###   smoother.nonInnov
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
#smoother requires an non-innovations form model
model <- TSmodel(toSSChol(estVARXls(eg1.DSE.data.diff))) 
smoothed.model <- smoother(model, eg1.DSE.data.diff, compiled=FALSE)
tfplot(state(smoothed.model))
tfplot(state(smoothed.model, filter=TRUE))
#compare
tfplot(state(smoothed.model, smoother=TRUE), state(smoothed.model, filter=TRUE))



