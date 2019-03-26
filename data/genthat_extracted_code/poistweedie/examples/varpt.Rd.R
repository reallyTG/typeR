library(poistweedie)


### Name: varpt
### Title: variance for the Poisson-Tweedie family of distributions
### Aliases: varpt
### Keywords: models

### ** Examples

## plot of variance
layout(matrix(1:1,1,1))
layout.show(1)
mu <- seq(0.001,6,l=100)
var <-varpt(mu,p=5000,theta0=-150)
plot(mu, var, type = "l", col = "green", lwd=1,main="variance(p,mu,theta0=-150)")
grid(nx=1,ny=1, lty=1,lwd=2)
lines(mu,varpt(mu,p=1,theta0=-150), type = "l", col = "blue", lwd=1)
lines(mu,varpt(mu,p=2,theta0=-150), type = "l", col = "black", lwd=1)
lines(mu,varpt(mu,p=1.5,theta0=-150), type = "l", col = "yellow", lwd=1)
lines(mu,varpt(mu,p=2.5,theta0=-150), type = "l", col = "cyan", lwd=1)
lines(mu,varpt(mu,p=3,theta0=-150), type = "l", col = "magenta", lwd=1)
segments(4,2.5,4.5,2.5,col="blue" )
  text(5,2.5,"p=1",cex=0.8)
segments(4,2,4.5,2,col="yellow" )
  text(5,2,"1.5",cex=0.8)
segments(4,1.5,4.5,1.5,col= "black")
  text(5, 1.5,"p=2",cex=0.8)
segments(4,1,4.5,1,col="cyan" )
  text(5, 1,"p=2.5" ,cex=0.8)
segments(4,0.5,4.5,0.5,col="magenta" )
  text(5, 0.5,"p=3" ,cex=0.8) 
segments(4,0,4.5,0,col= "green" )
  text(5, 0,"p=5000",cex=0.8)  



