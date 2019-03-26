library(artfima)


### Name: tseg
### Title: Simulate Some Time Series Models of Interest
### Aliases: tseg
### Keywords: ts datagen

### ** Examples

z <- tseg(5000, "MHAR9")
arima(z, order=c(9,0,0), fixed=c(NA,NA,0,0,0,0,0,0,NA,NA), transform.pars=FALSE)



