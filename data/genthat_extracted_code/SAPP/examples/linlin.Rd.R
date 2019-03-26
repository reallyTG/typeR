library(SAPP)


### Name: linlin
### Title: Maximum Likelihood Estimates of Linear Intensity Models
### Aliases: linlin
### Keywords: spatial

### ** Examples

data(PProcess)  # point process data 
data(SelfExcit) # self-exciting point process data
linlin(PProcess[1:69], SelfExcit, 20000, 0.13, 0.026,
       c(0.035,-0.0048), c(0.0,0.00017),, c(0.007,-.00000029))



