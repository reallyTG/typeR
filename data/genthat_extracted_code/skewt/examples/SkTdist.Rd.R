library(skewt)


### Name: SkTDist
### Title: The Skewed Student t Distribution
### Aliases: SkTDist dskt pskt qskt rskt
### Keywords: distribution

### ** Examples

dskt(0.5,2)
dskt(0.01,2,2)
pskt(1.25,2,2)
pskt(c(0.5,1.25),3)
qskt(c(0,0.025,0.25,0.5,0.75,0.975,1),2,2)
rskt(100,2,2)
plot(function(x)dskt(x,2,2),-3,3)



