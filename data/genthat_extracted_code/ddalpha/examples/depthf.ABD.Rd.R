library(ddalpha)


### Name: depthf.ABD
### Title: Adjusted Band Depth for Functional Data
### Aliases: depthf.ABD
### Keywords: depth functional

### ** Examples

datafA = dataf.population()$dataf[1:20]
datafB = dataf.population()$dataf[21:50]
depthf.ABD(datafA,datafB)
depthf.ABD(datafA,datafB,norm="L2")




