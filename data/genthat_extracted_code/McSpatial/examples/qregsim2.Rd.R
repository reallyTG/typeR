library(McSpatial)


### Name: qregsim2
### Title: Machado-Mata Decomposition of Changes in Distributions
### Aliases: qregsim2
### Keywords: Quantile Regression Machado-Mata

### ** Examples

par(ask=TRUE)

n = 5000
set.seed(484913)
x1 <- rnorm(n,0,1)
u1 <- rnorm(n,0,.5)
y1 <- x1 + u1

# no change in x.  Coefficients show quantile effects
tau <- runif(n,0,.5)
x2 <- x1
y2 <- (1 + (tau-.5))*x2 + .5*qnorm(tau)

dat <- data.frame(rbind(cbind(y1,x1,1), cbind(y2,x2,2)))
names(dat) <- c("y","x","year")
bmat1 <- qregbmat(y~x,data=dat[dat$year==1,],graphb=FALSE)
bmat2 <- qregbmat(y~x,data=dat[dat$year==2,],graphb=FALSE)
fit1 <- qregsim2(y~x,~x,dat[dat$year==1,],dat[dat$year==2,],
  bmat1,bmat2,bwadjdy=2)

# Distribution of x changes.  Coefficients and u stay the same
x2 <- rnorm(n,0,2)
y2 <- x2 + u1
dat <- data.frame(rbind(cbind(y1,x1,1), cbind(y2,x2,2)))
names(dat) <- c("y","x","year")
bmat1 <- qregbmat(y~x,data=dat[dat$year==1,],graphb=FALSE)
bmat2 <- qregbmat(y~x,data=dat[dat$year==2,],graphb=FALSE)
fit1 <- qregsim2(y~x,~x,dat[dat$year==1,],dat[dat$year==2,],
  bmat1,bmat2,bwadjdy=2)




