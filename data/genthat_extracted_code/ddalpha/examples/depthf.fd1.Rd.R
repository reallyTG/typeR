library(ddalpha)


### Name: depthf.fd1
### Title: Univariate Integrated and Infimal Depth for Functional Data
### Aliases: depthf.fd1
### Keywords: depth functional

### ** Examples

datafA = dataf.population()$dataf[1:20]
datafB = dataf.population()$dataf[21:50]
depthf.fd1(datafA,datafB)
depthf.fd1(datafA,datafB,order=2)
depthf.fd1(datafA,datafB,order=3,approx=51)




