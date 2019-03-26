library(spatstat)


### Name: pcfcross
### Title: Multitype pair correlation function (cross-type)
### Aliases: pcfcross
### Keywords: spatial nonparametric

### ** Examples

 data(amacrine)
 p <- pcfcross(amacrine, "off", "on")
 p <- pcfcross(amacrine, "off", "on", stoyan=0.1)
 plot(p)



