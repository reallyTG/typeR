library(afmToolkit)


### Name: windowedFit
### Title: Linear fit in a running window
### Aliases: windowedFit

### ** Examples

n <- 100
x <- seq(0,2*pi,length.out = n)
y = sin(x)+0.1*rnorm(n)
X <- matrix(c(rep(1,n),x,y),nrow = n,ncol = 3)
width <- 5
b <- windowedFit(X,width)
plot(x[(width+1):(n-width)],b,xlab = "x",ylab = "y",type = "l")
lines(x,y,col = "red")
legend("bottomleft",c("Slopes","Signal"),col = c(1,2),lty = 1)



