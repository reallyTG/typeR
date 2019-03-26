library(catenary)


### Name: getFunctionEnvelopePara
### Title: Function to return function envelope for parabola
### Aliases: getFunctionEnvelopePara
### Keywords: internal

### ** Examples

x <- runif(100,0,10)
y <- x^2 + 2*x + 3 + rnorm(100,sd=20)
df <- data.frame(x=x,y=y)
plot(y~x,data=df,pch=16,cex=0.5)
bounds <- getFunctionEnvelopePara(data=df,x=seq(0,10,l=100))
lines(bounds$x,bounds$lwr)
lines(bounds$x,bounds$upr)



