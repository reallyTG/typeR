library(Hmisc)


### Name: areg
### Title: Additive Regression with Optimal Transformations on Both Sides
###   using Canonical Variates
### Aliases: areg print.areg predict.areg plot.areg
### Keywords: smooth regression multivariate models

### ** Examples

set.seed(1)

ns <- c(30,300,3000)
for(n in ns) {
  y <- sample(1:5, n, TRUE)
  x <- abs(y-3) + runif(n)
  par(mfrow=c(3,4))
  for(k in c(0,3:5)) {
    z <- areg(x, y, ytype='c', nk=k)
    plot(x, z$tx)
	title(paste('R2=',format(z$rsquared)))
    tapply(z$ty, y, range)
    a <- tapply(x,y,mean)
    b <- tapply(z$ty,y,mean)
    plot(a,b)
	abline(lsfit(a,b))
    # Should get same result to within linear transformation if reverse x and y
    w <- areg(y, x, xtype='c', nk=k)
    plot(z$ty, w$tx)
    title(paste('R2=',format(w$rsquared)))
    abline(lsfit(z$ty, w$tx))
 }
}

par(mfrow=c(2,2))
# Example where one category in y differs from others but only in variance of x
n <- 50
y <- sample(1:5,n,TRUE)
x <- rnorm(n)
x[y==1] <- rnorm(sum(y==1), 0, 5)
z <- areg(x,y,xtype='l',ytype='c')
z
plot(z)
z <- areg(x,y,ytype='c')
z
plot(z)

## Not run: 
##D 		
##D # Examine overfitting when true transformations are linear
##D par(mfrow=c(4,3))
##D for(n in c(200,2000)) {
##D   x <- rnorm(n); y <- rnorm(n) + x
##D     for(nk in c(0,3,5)) {
##D     z <- areg(x, y, nk=nk, crossval=10, B=100)
##D     print(z)
##D     plot(z)
##D     title(paste('n=',n))
##D   }
##D }
##D par(mfrow=c(1,1))
##D 
##D # Underfitting when true transformation is quadratic but overfitting
##D # when y is allowed to be transformed
##D set.seed(49)
##D n <- 200
##D x <- rnorm(n); y <- rnorm(n) + .5*x^2
##D #areg(x, y, nk=0, crossval=10, B=100)
##D #areg(x, y, nk=4, ytype='l', crossval=10, B=100)
##D z <- areg(x, y, nk=4) #, crossval=10, B=100)
##D z
##D # Plot x vs. predicted value on original scale.  Since y-transform is
##D # not monotonic, there are multiple y-inverses
##D xx <- seq(-3.5,3.5,length=1000)
##D yhat <- predict(z, xx, type='fitted')
##D plot(x, y, xlim=c(-3.5,3.5))
##D for(j in 1:ncol(yhat)) lines(xx, yhat[,j], col=j)
##D # Plot a random sample of possible y inverses
##D yhats <- predict(z, xx, type='fitted', what='sample')
##D points(xx, yhats, pch=2)
## End(Not run)

# True transformation of x1 is quadratic, y is linear
n <- 200
x1 <- rnorm(n); x2 <- rnorm(n); y <- rnorm(n) + x1^2
z <- areg(cbind(x1,x2),y,xtype=c('s','l'),nk=3)
par(mfrow=c(2,2))
plot(z)

# y transformation is inverse quadratic but areg gets the same answer by
# making x1 quadratic
n <- 5000
x1 <- rnorm(n); x2 <- rnorm(n); y <- (x1 + rnorm(n))^2
z <- areg(cbind(x1,x2),y,nk=5)
par(mfrow=c(2,2))
plot(z)

# Overfit 20 predictors when no true relationships exist
n <- 1000
x <- matrix(runif(n*20),n,20)
y <- rnorm(n)
z <- areg(x, y, nk=5)  # add crossval=4 to expose the problem

# Test predict function
n <- 50
x <- rnorm(n)
y <- rnorm(n) + x
g <- sample(1:3, n, TRUE)
z <- areg(cbind(x,g),y,xtype=c('s','c'))
range(predict(z, cbind(x,g)) - z$linear.predictors)



