library(JointNets)


### Name: plotbrain.fasjem
### Title: plot 3d brain network from fasjem result
### Aliases: plotbrain.fasjem

### ** Examples

library(JointNets)
graphics.off()
par(ask=FALSE)
par(mfrow=c(1,1))
data(ABIDE_aal116_timeseries)
data(aal116coordinates)
layout = cbind(aal116coordinates$x.mni + 90,
aal116coordinates$y.mni+126, aal116coordinates$z.mni+72)
result = simulation(p=116, s = 0.001, ss = 0.001, n = c(1,1))$simulatedgraphs
class(result) = "simule"
plotbrain(result, type = "task", neighbouroption = "task",
subID = NULL, index = NULL, layout = layout, hasbackground = FALSE)
## No test: 
result = fasjem(X = ABIDE_aal116_timeseries,
method = "fasjem-g", 0.001, 0.1, 0.1, 0.05, 20)
plotbrain(result, type = "task", neighbouroption = "task",
subID = NULL, index = NULL, layout = layout)
## End(No test)



