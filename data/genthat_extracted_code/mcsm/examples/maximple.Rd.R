library(mcsm)


### Name: maximple
### Title: Graphical representation of a toy example of simulated annealing
### Aliases: maximple
### Keywords: optimize

### ** Examples

# Section 5.2.2, artificial function example 5.8

h=function(x){(cos(50*x)+sin(20*x))^2}
par(mar=c(4,4,1,1),mfrow=c(2,2))
for (tt in 1:4){

  curve(h,from=0,to=1,n=10001,col="grey",lwd=2)
  sam=maximple()
  xgo=sam$x
  hgo=sam$y
  lines(xgo,hgo,col="steelblue4",lwd=2)
  points(xgo,hgo,col="steelblue4",cex=.5,pch=19)
  }



