library(ei)


### Name: tomogRxC
### Title: Plotting Ecological Inference Estimates with eiRxC information
### Aliases: tomogRxC

### ** Examples

data(RxCdata)
formula = cbind(turnout, noturnout) ~ cbind(white, black,hisp)
tomogRxC(formula, data=RxCdata)



