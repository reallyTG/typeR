library(scam)


### Name: scam
### Title: Shape constrained additive models (SCAM) and integrated
###   smoothness selection
### Aliases: scam
### Keywords: models smooth regression

### ** Examples

##**********************************
## Gaussian model, 2 terms, 1 monotonic increasing....
   ## simulating data...
require(scam)

set.seed(0)
n <- 200
x1 <- runif(n)*6-3
f1 <- 3*exp(-x1^2) # unconstrained term
f1 <- (f1-min(f1))/(max(f1)-min(f1)) # function scaled to have range [0,1]
x2 <- runif(n)*4-1;
f2 <- exp(4*x2)/(1+exp(4*x2)) # monotone increasing smooth
f2 <- (f2-min(f2))/(max(f2)-min(f2)) # function scaled to have range [0,1]
f <- f1+f2
y <- f+rnorm(n)*0.1
dat <- data.frame(x1=x1,x2=x2,y=y)
  ## fit model, results, and plot...
b <- scam(y~s(x1,k=15,bs="cr",m=2)+s(x2,k=25,bs="mpi",m=2),
    family=gaussian(link="identity"),data=dat,not.exp=FALSE)
print(b)
summary(b)
plot(b,pages=1)


##************************************
## Gaussian model, 2 terms, increasing + decreasing convex ....
   ## simulating data...

set.seed(2)
n <- 200
x1 <- runif(n)*4-1;
f1 <- exp(4*x1)/(1+exp(4*x1)) # monotone increasing smooth
x2 <- runif(n)*3-1;
f2 <- exp(-3*x2)/15  # monotone decreasing and convex smooth
f <- f1+f2
y <- f+ rnorm(n)*0.2
dat <- data.frame(x1=x1,x2=x2,y=y)
  ## fit model, results, and plot...
b <- scam(y~ s(x1,k=25,bs="mpi",m=2)+s(x2,k=25,bs="mdcx",m=2),
    family=gaussian(link="identity"),data=dat)
print(b)
summary(b)
plot(b,pages=1,scale=0)

##***********************************
## Not run: 
##D ## using optim() for smoothing parameter selection...
##D b1 <- scam(y~ s(x1,k=25,bs="mpi",m=2)+s(x2,k=25,bs="mdcx",m=2),
##D     family=gaussian(link="identity"),data=dat, optimizer="optim")
##D summary(b1)
##D 
##D b2 <- scam(y~ s(x1,k=25,bs="mpi",m=2)+s(x2,k=25,bs="mdcx",m=2),
##D     family=gaussian(link="identity"),data=dat, optimizer="optim",
##D     optim.method=c("BFGS","fd"))
##D summary(b2)
##D 
##D ## using nlm()...
##D b3 <- scam(y~ s(x1,k=25,bs="mpi",m=2)+s(x2,k=25,bs="mdcx",m=2),
##D     family=gaussian(link="identity"),data=dat, optimizer="nlm")
##D summary(b3)
## End(Not run)


##************************************
## Poisson model ....
   ## simulating data...
set.seed(2)
n <- 200
x1 <- runif(n)*6-3
f1 <- 3*exp(-x1^2) # unconstrained term
x2 <- runif(n)*4-1;
f2 <- exp(4*x2)/(1+exp(4*x2)) # monotone increasing smooth
f <- f1+f2
y <- rpois(n,exp(f))
dat <- data.frame(x1=x1,x2=x2,y=y)
  ## fit model, results, and plot...
b <- scam(y~s(x1,k=15,bs="cr",m=2)+s(x2,k=30,bs="mpi",m=2),
      family=poisson(link="log"),data=dat,optimizer="nlm.fd")
print(b)
summary(b)
plot(b,pages=1)
scam.check(b)

## Gamma model...
   ## simulating data...
set.seed(3)
n <- 200
x1 <- runif(n)*6-3
f1 <- 1.5*sin(1.5*x1) # unconstrained term
x2 <- runif(n)*4-1;
f2 <- 1.5/(1+exp(-10*(x2+0.75)))+1.5/(1+exp(-5*(x2-0.75))) # monotone increasing smooth
x3 <- runif(n)*6-3;
f3 <- 3*exp(-x3^2)  # unconstrained term
f <- f1+f2+f3
y <- rgamma(n,shape=1,scale=exp(f))
dat <- data.frame(x1=x1,x2=x2,x3=x3,y=y)
   ## fit model, results, and plot...
b <- scam(y~s(x1,k=15,bs="ps",m=2)+s(x2,k=30,bs="mpi",m=2)+
            s(x3,k=15,bs="ps",m=2),family=Gamma(link="log"),
            data=dat,optimizer="nlm")
print(b)
summary(b)
par(mfrow=c(2,2))
plot(b)

## Not run: 
##D ## bivariate example...
##D  ## simulating data...
##D    set.seed(2)
##D    n <- 30
##D    x1 <- sort(runif(n)*4-1)
##D    x2 <- sort(runif(n))
##D    f1 <- matrix(0,n,n)
##D    for (i in 1:n) for (j in 1:n) 
##D        { f1[i,j] <- -exp(4*x1[i])/(1+exp(4*x1[i]))+2*sin(pi*x2[j])}
##D    f <- as.vector(t(f1))
##D    y <- f+rnorm(length(f))*0.1
##D    x11 <-  matrix(0,n,n)
##D    x11[,1:n] <- x1
##D    x11 <- as.vector(t(x11))
##D    x22 <- rep(x2,n)
##D    dat <- list(x1=x11,x2=x22,y=y)
##D ## fit model  and plot ...
##D    b <- scam(y~s(x1,x2,k=c(10,10),bs=c("tesmd1","ps"),m=2),
##D             family=gaussian(link="identity"), data=dat,sp=NULL)
##D    summary(b)
##D    par(mfrow=c(2,2),mar=c(4,4,2,2))
##D    plot(b,se=TRUE)
##D    plot(b,pers=TRUE,theta = 30, phi = 40)
##D    plot(y,b$fitted.values,xlab="Simulated data",ylab="Fitted data",pch=".",cex=3)
##D 
##D ## example with random effect smoother...
##D 
##D    set.seed(2)
##D    n <- 200
##D    x1 <- runif(n)*6-3
##D    f1 <- 3*exp(-x1^2) # unconstrained term
##D    f1 <- (f1-min(f1))/(max(f1)-min(f1)) 
##D    x2 <- runif(n)*4-1;
##D    f2 <- exp(4*x2)/(1+exp(4*x2)) # monotone increasing smooth
##D    f2 <- (f2-min(f2))/(max(f2)-min(f2)) 
##D    f <- f1+f2
##D    a <- factor(sample(1:10,200,replace=TRUE))   
##D    Xa <- model.matrix(~a-1)    ## random main effects
##D    y <- f + Xa%*%rnorm(length(levels(a)))*.5 + rnorm(n)*0.1    
##D    dat <- data.frame(x1=x1,x2=x2,y=y,a=a)
##D    ## fit model and plot...
##D    b <- scam(y~s(x1,k=15,bs="cr",m=2)+s(x2,k=25,bs="mpi",m=2)+s(a,bs="re"), data=dat)
##D    summary(b)
##D    scam.check(b)
##D    plot(b,pages=1)
##D 
##D  
## End(Not run)



