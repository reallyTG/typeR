library(lmfor)


### Name: circle
### Title: Plot circles of a specified radius
### Aliases: circle
### Keywords: graphs

### ** Examples

plot(0,type="n",xlim=c(-2,12),ylim=c(-2,12))
#Plot on average 7 tree crowns of Weibull-distributed radius at random locations
n<-rpois(1,7)
circle(x=runif(n,0,10),
       y=runif(n,0,10),
       r=rweibull(n,6,2))




