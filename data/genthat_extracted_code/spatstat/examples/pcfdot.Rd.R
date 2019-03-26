library(spatstat)


### Name: pcfdot
### Title: Multitype pair correlation function (i-to-any)
### Aliases: pcfdot
### Keywords: spatial nonparametric

### ** Examples

 data(amacrine)
 p <- pcfdot(amacrine, "on")
 p <- pcfdot(amacrine, "on", stoyan=0.1)
 plot(p)



