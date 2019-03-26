library(ddalpha)


### Name: depthf.fd2
### Title: Bivariate Integrated and Infimal Depth for Functional Data
### Aliases: depthf.fd2
### Keywords: depth derivatives functional

### ** Examples

datafA = dataf.population()$dataf[1:20]
datafB = dataf.population()$dataf[21:50]

dataf2A = derivatives.est(datafA,deriv=c(0,1))
dataf2B = derivatives.est(datafB,deriv=c(0,1))
depthf.fd2(dataf2A,dataf2B)




