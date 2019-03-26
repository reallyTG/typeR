library(scam)


### Name: predict.scam
### Title: Prediction from fitted SCAM model
### Aliases: predict.scam
### Keywords: models smooth regression

### ** Examples

## Not run: 
##D library(scam)
##D set.seed(2)
##D n <- 200
##D x1 <- runif(n)*6-3
##D f1 <- 3*exp(-x1^2) # unconstrained term
##D x2 <- runif(n)*4-1;
##D f2 <- exp(4*x2)/(1+exp(4*x2)) # monotone increasing smooth
##D f <- f1+f2
##D y <- f+rnorm(n)*0.2
##D dat <- data.frame(x1=x1,x2=x2,y=y)
##D b <- scam(y~s(x1,k=15,bs="cr",m=2)+s(x2,k=30,bs="mpi",m=2),
##D     family=gaussian(link="identity"),data=dat)
##D 
##D newd <- data.frame(x1=seq(-3,3,length.out=20),x2=seq(-1,3,length.out=20))
##D pred <- predict(b,newd)
##D pred
##D predict(b,newd,type="terms",se=TRUE)
##D 
##D 
##D ## linear extrapolation with predict.scam()...
##D set.seed(3)
##D n <- 100
##D x <- sort(runif(n)*3-1)
##D f <- exp(-1.3*x)
##D y <- rpois(n,exp(f))
##D dat <- data.frame(x=x,y=y)
##D b <- scam(y~s(x,k=15,bs="mpd",m=2),family=poisson(link="log"),data=dat)
##D newd <- data.frame(x=c(2.3,2.7,3.2))
##D fe <- predict(b,newd,type="link",se=TRUE)
##D ylim<- c(min(y,exp(fe$fit)),max(y,exp(fe$fit)))
##D plot(c(x,newd[[1]]),c(y,NA,NA,NA),ylim=ylim)
##D lines(c(x,newd[[1]]),c(b$fitted,exp(fe$fit)),col=3)
##D 
##D ## Gaussian model ....
##D ## simulating data...
##D  set.seed(2)
##D  n <- 200
##D  x <- sort(runif(n)*4-1)
##D  f <- exp(4*x)/(1+exp(4*x)) # monotone increasing smooth
##D  y <- f+rnorm(n)*0.1
##D  dat <- data.frame(x=x,y=y)
##D  b <- scam(y~ s(x,k=25,bs="mpi",m=2),family=gaussian,data=dat)
##D  newd <- data.frame(x=c(3.2,3.3,3.6))
##D  fe <- predict(b,newd)
##D  plot(c(x,newd[[1]]),c(y,NA,NA,NA))
##D  lines(c(x,newd[[1]]),c(b$fitted,fe),col=3)
##D 
##D ### passing observed data + new data...
##D    newd <- data.frame(x=c(x,3.2,3.3,3.6))
##D    fe <- predict(b,newd,se=TRUE)
##D    plot(newd[[1]],c(y,NA,NA,NA))
##D    lines(newd[[1]],fe$fit,col=2)
##D    lines(newd[[1]],fe$fit+2*fe$se.fit,col=3)
##D    lines(newd[[1]],fe$fit-2*fe$se.fit,col=4)
##D 
##D ## prediction with CI...
##D    newd <- data.frame(x=seq(-1.2,3.5,length.out=100))
##D    fe <- predict(b,newd,se=TRUE)
##D    ylim<- c(min(y,fe$se.fit),max(y,fe$se.fit))
##D    plot(newd[[1]],fe$fit,type="l",ylim=ylim)
##D    lines(newd[[1]],fe$fit+2*fe$se.fit,lty=2)
##D    lines(newd[[1]],fe$fit-2*fe$se.fit,lty=2)
##D  
##D 
##D ## bivariate example...
##D    n <- 30
##D    x1 <- sort(runif(n));  x2 <- sort(runif(n)*4-1)
##D    f1 <- matrix(0,n,n)
##D    for (i in 1:n) for (j in 1:n) 
##D        { f1[i,j] <- 2*sin(pi*x1[i]) +exp(4*x2[j])/(1+exp(4*x2[j]))}
##D    f1 <- as.vector(t(f1));   f <- (f1-min(f1))/(max(f1)-min(f1))
##D    y <- f+rnorm(length(f))*0.1
##D    x11 <-  matrix(0,n,n); x11[,1:n] <- x1;  x11 <- as.vector(t(x11))
##D    x22 <- rep(x2,n)
##D    dat <- list(x1=x11,x2=x22,y=y)
##D    b <- scam(y~s(x1,x2,k=c(10,10),bs="tesmi2"),family=gaussian, data=dat)
##D    par(mfrow=c(2,2),mar=c(4,4,2,2))
##D    plot(b,se=TRUE);   plot(b,pers=TRUE,theta = 80, phi = 40)
##D 
##D    n.out <- 20
##D    xp <- seq(0,1.4,length.out=n.out) 
##D    zp <- seq(-1,3.4,length.out=n.out)
##D    xp1 <-  matrix(0,n.out,n.out);   xp1[,1:n.out] <- xp
##D    xp1 <- as.vector(t(xp1));   xp2 <- rep(zp,n.out)
##D    newd <- data.frame(x1=xp1,x2=xp2)
##D    fe <- predict(b,newd)
##D    fc <- t(matrix(fe,n.out,n.out))
##D    persp(xp,zp,fc,expand= 0.85,ticktype = "simple",xlab="x1",
##D      ylab="x2",zlab="f^",main="d", theta = 80, phi = 40)
##D 
##D 
##D 
##D 
##D ## obtaining a 'prediction matrix'...
##D 
##D newd <- data.frame(x1=c(-2,-1),x2=c(0,1))
##D Xp <- predict(b,newdata=newd,type="lpmatrix")
##D fv <- Xp##D 
##D fv
##D  
## End(Not run)



