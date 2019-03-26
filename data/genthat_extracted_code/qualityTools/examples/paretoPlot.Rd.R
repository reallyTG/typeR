library(qualityTools)


### Name: paretoPlot
### Title: paretoPlot
### Aliases: paretoPlot
### Keywords: Design of Experiments Six Sigma

### ** Examples

#factorial design with replications
#NA in response column and 2 replicates per factor combination
vp = fracDesign(k = 3, replicates = 2)  
#generate some data
y1 = 4*vp[,1] -7*vp[,2] + 2*vp[,2]*vp[,1] + 0.2*vp[,3] + rnorm(16)
y2 = 9*vp[,1] -2*vp[,2] + 5*vp[,2]*vp[,1] + 0.5*vp[,3] + rnorm(16)               
response(vp) = data.frame(y1,y2)
#show effects and interactions (nothing significant expected)
paretoPlot(vp)                         

#fractional factorial design --> Lenth Plot
vp = fracDesign(k = 4, gen = "D = ABC")
#generate some data
y = rnorm(8)                
response(vp) = y
#show effects and interactions (nothing significant expected)
paretoPlot(vp)                        





