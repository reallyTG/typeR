library(enetLTS)


### Name: enetLTS
### Title: Robust and sparse estimation for linear and logistic regression
### Aliases: enetLTS
### Keywords: regression classification sparse robust

### ** Examples

## for gaussian

set.seed(86)
n <- 100; p <- 25                             # number of observations and variables
beta <- rep(0,p); beta[1:6] <- 1              # 10% nonzero coefficients
sigma <- 0.5                                  # controls signal-to-noise ratio
x <- matrix(rnorm(n*p, sigma),nrow=n)
e <- rnorm(n,0,1)                             # error terms
eps <- 0.1                                    # contamination level
m <- ceiling(eps*n)                           # observations to be contaminated
eout <- e; eout[1:m] <- eout[1:m] + 10        # vertical outliers
yout <- c(x %*% beta + sigma * eout)          # response
xout <- x; xout[1:m,] <- xout[1:m,] + 10      # bad leverage points

## No test: 
fit <- enetLTS(xout,yout,alphas=0.5,lambdas=0.05,plot=FALSE)
# determine user supplied alpha and lambda sequences
# alphas=seq(0,1,length=11)
# l0 <- robustHD::lambda0(xout,yout)          # use # lambda0 function from robustHD package
# lambdas <- seq(l0,0,by=-0.1*l0)
# fit <- enetLTS(xout,yout,alphas=alphas,lambdas=lambdas)
## End(No test)

## for binomial

eps <-0.05                                     # %10 contamination to only class 0
m <- ceiling(eps*n)
y <- sample(0:1,n,replace=TRUE)
xout <- x
xout[y==0,][1:m,] <- xout[1:m,] + 10;          # class 0
yout <- y                                      # wrong classification for vertical outliers
## Don't show: 
set.seed(86)
n <- 5; p <- 15                            
beta <- rep(0,p); beta[1:6] <- 1              
sigma <- 0.5                        
x <- matrix(rnorm(n*p, sigma),nrow=n)   
e <- rnorm(n,0,1)                             # error terms
eps <- 0.1                                    # contamination level
m <- ceiling(eps*n)                           # observations to be contaminated
eout <- e; eout[1:m] <- eout[1:m] + 10        # vertical outliers
yout <- c(x %*% beta + sigma * eout)          # response
xout <- x; xout[1:m,] <- xout[1:m,] + 10      # bad leverage points
fit2 <- enetLTS(xout,yout,alphas=0.5,lambdas=0.05,plot=FALSE)
## End(Don't show)
## No test: 
	fit <- enetLTS(xout,yout,family="binomial",alphas=0.5,lambdas=0.05,plot=FALSE)
# determine user supplied alpha and lambda sequences
# l00 <- lambda00(xout,yout,normalize=TRUE,intercept=TRUE)
# lambdas <-  seq(l00,0,by=-0.01*l00)
# fit <- enetLTS(xout,yout,family="binomial",alphas=alphas,lambdas=lambdas)
## End(No test)



