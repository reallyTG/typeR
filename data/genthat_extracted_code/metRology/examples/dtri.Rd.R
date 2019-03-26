library(metRology)


### Name: Triangular
### Title: The triangular distribution.
### Aliases: dtri ptri qtri rtri
### Keywords: distribution

### ** Examples

     require(graphics)
     x<-seq(-3,3,0.02)

     par(mfrow=c(2,1))
     plot(x, dtri(x), type="l", main="Density")
     plot(x, ptri(x), type="l", main="p(X<x)")

     u <- rtri(5000)

     var(rtri(10000,-1,1))  # ~ = 1/6 = 0.167




