library(gamair)


### Name: ch6
### Title: Code for Chapter 6: GAM Theory
### Aliases: ch6

### ** Examples

library(gamair); library(mgcv)

## 6.13.2 backfitting

set.seed(2) ## simulate some data... 
dat <- gamSim(1,n=400,dist="normal",scale=2)
edf <- c(3,3,8,3)
y <- dat$y
x <- cbind(dat$x0,dat$x1,dat$x2,dat$x3)
f <- x*0; alpha <- mean(y); ok <- TRUE; rss0 <- 0
while (ok) { # backfitting loop
  for (i in 1:ncol(x)) { # loop through the smooth terms
    ep <- y - rowSums(f[,-i]) - alpha
    b <- smooth.spline(x[,i],ep,df=edf[i])
    f[,i] <- predict(b,x[,i])$y
  }
  rss <- sum((y-rowSums(f))^2)
  if (abs(rss-rss0)<1e-6*rss) ok <- FALSE
  rss0 <- rss
}
par(mfrow=c(2,2))
for (i in 1:ncol(x)) {
  plot(x[,i],y-mean(y),col="grey",pch=19,cex=.3)
  ii <- order(x[,i])
  lines(x[ii,i],f[ii,i],col=2,lwd=2)
}




