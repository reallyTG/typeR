library(ddalpha)


### Name: depthf.hM
### Title: h-Mode Depth for Functional Data
### Aliases: depthf.hM
### Keywords: depth functional

### ** Examples

datafA = dataf.population()$dataf[1:20]
datafB = dataf.population()$dataf[21:50]
depthf.hM(datafA,datafB)
depthf.hM(datafA,datafB,norm="L2")



