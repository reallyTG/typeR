library(JointNets)


### Name: plotbrain.diffeek
### Title: plot 3d brain network from diffeek result
### Aliases: plotbrain.diffeek

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
result = diffeek(ABIDE_aal116_timeseries[[1]], ABIDE_aal116_timeseries[[2]],
W = matrix(1,116,116), g = 0,epsilon = 0.1, lambda = 0.001)
plotbrain(result, type = "task", neighbouroption = "task",
subID = NULL, index = NULL, layout = layout)
## End(No test)



