library(tripack)


### Name: circles
### Title: plot circles
### Aliases: circles
### Keywords: aplot

### ** Examples

x<-rnorm(10)
y<-rnorm(10)
r<-runif(10,0,0.5)
plot(x,y, xlim=c(-3,3), ylim=c(-3,3), pch="+")
circles(x,y,r)



