library(ei)


### Name: tomogRxC3d
### Title: Plotting 2x3 Ecological Inference Estimates in 3 dimensions
### Aliases: tomogRxC3d

### ** Examples

data(RxCdata)
formula <- cbind(turnout, noturnout) ~ cbind(white, black, hisp)
tomogRxC3d(formula, RxCdata, total=NULL, lci=TRUE, estimates=TRUE, ci=TRUE, transparency=.5, 
	light=FALSE, rotate=FALSE)



