library(expandFunctions)


### Name: rapt
### Title: Expand an input matrix X using raptObj.
### Aliases: rapt

### ** Examples

# Toy problem
set.seed(1)
nObs <- 100 # Number of observations
X <- matrix(seq(-4,+4,length.out = nObs),ncol=1)
Ytrue <- sin(5*X) + 2*cos(2*X) # True value Ytrue = g(X)
Y <- Ytrue + rnorm(nObs) # Noisy measurement Y

# Standardize X
Xstd <- scale(X)
attributes(Xstd) <- attributes(X)

# Bochner (random Fourier) projection object
nDim <- NCOL(X)
h <- 10 # Estimated by goodness of fit Adj R^2.
  # Normally this would be fit by cross validation.
raptObj <- raptMake(nDim,nDim*200,WdistOpt = list(sd=h),
                    bDistOpt=list(min=-pi,max=+pi))

# Apply raptObj to Xstd to generate features,
# keeping unaltered features Xstd as well.
Xrapt <- cbind( Xstd, cos( rapt(Xstd,raptObj) ) )

# Standardize results
XraptStd <- scale(Xrapt)
attributes(XraptStd) <- attributes(Xrapt)

# A linear fitting of Y to the features XraptStd
lmObj <- lm(Y ~ XraptStd)
summary(lmObj)

# Plot measurements (Y), predictions (Yhat),
# Kernel smoothing with Gaussian kernel and same bandwidth,
# true Y without noise.
Yhat <- predict(lmObj)
plot (X,Y   ,main="Linear Fitting", ylim=c(-6,10))
lines(X,Yhat,col="red",lty=1,lwd=2)
grid(col="darkgray")
kFit <- ksmooth(X,Y,kernel="normal",bandwidth=1/h)
lines(kFit$x,kFit$y,lty=1,col="green",lwd=2)
lines(X,Ytrue,lty=1,col="blue",lwd=2)
legend("topleft",
        legend=c("Noisy measurements",
                 "Estimated Y from RAPT",
                 "Estimated Y from Kernel Smooth",
                 "True Y"),
        col=1:4,
        pch=c( 1,NA,NA,NA),
        lty=c(NA, 1, 1, 1),
        lwd=2,
        bty="n")

# Fit sparse model w/LASSO and
# lambda criteria = 1 standard deviation.
# This avoids overgeneralization errors usually
# associated with fitting large numbers of features
# to relatively few data points.  It also improves
# the end effects, which are of paramount importance
# in high dimensional problems (since by the curse
# of dimensionality, almost all points are close an edge
# in high dimensional problems).
lassoObj <- easyLASSO(XraptStd,Y)
Yhat <- predict(lassoObj, newx = XraptStd)
# Use linear fit of prediction Yhat as goodness of fit.
summary(lm(Y ~ Yhat))

# Plot results of LASSO fitting
# These show LASSO does a better job fitting edges.
plot(X,Y,main="LASSO Fitting",ylim=c(-6,10))
lines(X,Yhat,col="red",lty=1,lwd=2)
grid(col="darkgray")
kFit <- ksmooth(X,Y,kernel="normal",bandwidth=1/h)
lines(kFit$x,kFit$y,lty=1,col="green",lwd=2)
lines(X,Ytrue,lty=1,col="blue",lwd=2)
legend("topleft",
        legend=c("Noisy measurements",
                 "Estimated Y from RAPT",
                 "Estimated Y from Kernel Smooth",
                 "True Y"),
        col=1:4,
        pch=c( 1,NA,NA,NA),
        lty=c(NA, 1, 1, 1),
        lwd=2,
        bty="n")



