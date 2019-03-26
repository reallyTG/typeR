library(catenary)


### Name: getFunctionEnvelopeCat
### Title: Function to return function envelope for catenary
### Aliases: getFunctionEnvelopeCat
### Keywords: internal

### ** Examples

x <- runif(100,-2,2)
y <- f(x=x,c1=1,c2=2,lambda=3) + rnorm(100)
df <- data.frame(x=x,y=y)
plot(y~x,data=df,pch=16,cex=0.5)
bounds <- getFunctionEnvelopeCat(data=df,initial=c(1,2,3),x=seq(-2,2,l=100))
lines(bounds$x,bounds$lwr)
lines(bounds$x,bounds$upr)



