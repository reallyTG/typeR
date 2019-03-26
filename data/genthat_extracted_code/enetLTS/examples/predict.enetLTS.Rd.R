library(enetLTS)


### Name: predict.enetLTS
### Title: make predictions from the '"enetLTS"' object.
### Aliases: predict.enetLTS
### Keywords: regression classification

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
fit1 <- enetLTS(xout,yout,alphas=0.5,lambdas=0.05,plot=FALSE)
predict(fit1,newX=xout)
predict(fit1,newX=xout,type="coefficients",vers="both")
predict(fit1,newX=xout,type="nonzero",vers="raw")
# provide new X matrix
newX <- matrix(rnorm(n*p, sigma),nrow=n)
predict(fit1,newX=newX,type="response",vers="both")
predict(fit1,newX=newX,type="coefficients")
predict(fit1,newX=newX,type="nonzero",vers="both")
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
predict(fit2,newX=xout)
## End(Don't show)
## No test: 
fit2 <- enetLTS(xout,yout,family="binomial",alphas=0.5,lambdas=0.05,plot=FALSE)
predict(fit2,newX=xout)
predict(fit2,newX=xout,type="coefficients",vers="both")
predict(fit2,newX=xout,type="nonzero",vers="raw")
predict(fit2,newX=newX,type="class",vers="both")
predict(fit2,newX=newX,type="coefficients",vers="raw")
predict(fit2,newX=newX,type="nonzero",vers="both")
## End(No test)




