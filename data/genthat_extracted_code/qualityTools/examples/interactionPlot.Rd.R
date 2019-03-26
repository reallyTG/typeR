library(qualityTools)


### Name: interactionPlot
### Title: interactionPlot
### Aliases: interactionPlot
### Keywords: Design of Experiments Six Sigma

### ** Examples

#NA in response column and 2 replicates per factor combination
vp = fracDesign(k = 3, replicates = 2) 
#generate some data                            
y = 4*vp[,1] -7*vp[,2] + 2*vp[,2]*vp[,1] + 0.2*vp[,3] + rnorm(16)  
response(vp) = y
#show effects and interactions (nothing significant expected)
interactionPlot(vp)                                                




