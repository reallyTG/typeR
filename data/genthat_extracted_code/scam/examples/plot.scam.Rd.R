library(scam)


### Name: plot.scam
### Title: SCAM plotting
### Aliases: plot.scam
### Keywords: models smooth regression hplot

### ** Examples

## simulating data...
n <- 200
set.seed(1)
x0 <- rep(1:4,50)
x1 <- runif(n)*6-3
f1 <- 3*exp(-x1^2) # unconstrained smooth term
x2 <- runif(n)*4-1;
f2 <- exp(4*x2)/(1+exp(4*x2)) # monotone increasing smooth
x3 <- runif(n)*5;
f3 <- -log(x3)/5  # monotone decreasing smooth
f <- f1+f2+f3
y <- 2*x0 + f + rnorm(n)*0.3
x0 <- factor(x0)

## fit the model and plot ...
b <- scam(y~x0+s(x1,k=15,bs="cr")+s(x2,k=30,bs="mpi")+s(x3,k=30,bs="mpd"))
plot(b,pages=1,residuals=TRUE,all.terms=TRUE,shade=TRUE,shade.col=3)    


## Not run: 
##D  ## example with 2-d plots...
##D  ## simulating data...
##D    set.seed(2)
##D    n <- 30
##D    x0 <- rep(1:9,100)
##D    x1 <- sort(runif(n)*4-1)
##D    x2 <- sort(runif(n))
##D    x3 <- runif(n*n, 0, 1)
##D    f <- matrix(0,n,n)
##D    for (i in 1:n) for (j in 1:n) 
##D        { f[i,j] <- -exp(4*x1[i])/(1+exp(4*x1[i]))+2*sin(pi*x2[j])}
##D    f1 <- as.vector(t(f))
##D    f2 <- x3*0
##D    e <- rnorm(length(f1))*0.1
##D    y <- 2*x0 + f1 + f2 + e
##D    x0 <- factor(x0)
##D    x11 <-  matrix(0,n,n)
##D    x11[,1:n] <- x1
##D    x11 <- as.vector(t(x11))
##D    x22 <- rep(x2,n)
##D    dat <- list(x0=x0,x1=x11,x2=x22,x3=x3,y=y)
##D ## fit model  and plot ...
##D    b <- scam(y~x0+s(x1,x2,k=c(10,10),bs=c("tesmd1","ps"),m=2)+s(x3),data=dat)
##D    op <- par(mfrow=c(2,2))
##D    plot(b,all.terms=TRUE)
##D    plot(y,b$fitted.values,xlab="Simulated data",ylab="Fitted data",pch=19,cex=.3)
##D    par(op) 
##D    
##D ## and use of schemes...
##D    op <- par(mfrow=c(2,2))
##D    plot(b,all.terms=TRUE,scheme=1)
##D    par(op)
##D    op <- par(mfrow=c(2,2))
##D    plot(b,all.terms=TRUE,scheme=c(2,1))
##D    par(op)
##D 
##D   
## End(Not run)



