library(scam)


### Name: derivative.scam
### Title: Derivative of the univariate smooth model terms
### Aliases: derivative.scam
### Keywords: models regression

### ** Examples


 set.seed(2)
n <- 200
x1 <- runif(n)*4-1;
f1 <- exp(4*x1)/(1+exp(4*x1)) # monotone increasing smooth
x2 <- sort(runif(n)*3-1)      # decreasing smooth
f2 <- exp(-1.3*x2)
f <- f1+ f2 
y <- f+ rnorm(n)*0.2
## fit model, results, and plot...
b <- scam(y~ s(x1,k=20,bs="mpi")+s(x2,k=15,bs="mpd"),family=gaussian)

d1 <- derivative.scam(b,smooth.number=1,deriv=1)

par(mfrow=c(1,2))

xx <- sort(x1,index=TRUE)
plot(xx$x,d1$d[xx$ix],type="l",xlab=expression(x[1]),
     ylab=expression(df[1]/dx[1]))

d2 <- derivative.scam(b,smooth.number=2,deriv=1)

xx <- sort(x2,index=TRUE)
plot(xx$x,d2$d[xx$ix],type="l",xlab=expression(x[2]),
     ylab=expression(df[2]/dx[2]))




