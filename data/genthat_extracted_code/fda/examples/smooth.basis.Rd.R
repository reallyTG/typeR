library(fda)


### Name: smooth.basis
### Title: Construct a functional data object by smoothing data using a
###   roughness penalty
### Aliases: smooth.basis smooth.basis1 smooth.basis2 smooth.basis3
### Keywords: smooth

### ** Examples

##
######## Simulated data example 1: a simple regression smooth  ########
##
#  Warning:  In this and all simulated data examples, your results
#  probably won't be the same as we saw when we ran the example because
#  random numbers depend on the seed value in effect at the time of the
#  analysis.
#
#  Set up 51 observation points equally spaced between 0 and 1
n = 51
argvals = seq(0,1,len=n)
#  The true curve values are sine function values with period 1/2
x = sin(4*pi*argvals)
#  Add independent Gaussian errors with std. dev. 0.2 to the true values
sigerr = 0.2
y = x + rnorm(x)*sigerr
#  When we ran this code, we got these values of y (rounded to two
#  decimals):
y = c(0.27,  0.05,  0.58,  0.91,  1.07,  0.98,  0.54,  0.94,  1.13,  0.64,
      0.64,  0.60,  0.24,  0.15, -0.20, -0.63, -0.40, -1.22, -1.11, -0.76,
     -1.11, -0.69, -0.54, -0.50, -0.35, -0.15,  0.27,  0.35,  0.65,  0.75,
      0.75,  0.91,  1.04,  1.04,  1.04,  0.46,  0.30, -0.01, -0.19, -0.42,
     -0.63, -0.78, -1.01, -1.08, -0.91, -0.92, -0.72, -0.84, -0.38, -0.23,
      0.02)
#  Set up a B-spline basis system of order 4 (piecewise cubic) and with
#  knots at 0, 0.1, ..., 0.9 and 1.0, and plot the basis functions
nbasis = 13
basisobj = create.bspline.basis(c(0,1),nbasis)
plot(basisobj)
#  Smooth the data, outputting only the functional data object for the
#  fitted curve.  Note that in this simple case we can supply the basis
#  object as the "fdParobj" parameter
ys = smooth.basis(argvals=argvals, y=y, fdParobj=basisobj)
Ys = smooth.basis(argvals=argvals, y=y, fdParobj=basisobj,
                  returnMatrix=TRUE)
# Ys[[7]] = Ys$y2cMap is sparse;  everything else is the same

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(ys[-7], Ys[-7])
## Don't show: 
)
## End(Don't show)

xfd = ys$fd
Xfd = Ys$fd

#  Plot the curve along with the data
plotfit.fd(y, argvals, xfd)
#  Compute the root-mean-squared-error (RMSE) of the fit relative to the
#  truth
RMSE = sqrt(mean((eval.fd(argvals, xfd) - x)^2))
print(RMSE)  #  We obtained 0.069
#  RMSE = 0.069 seems good relative to the standard error of 0.2.
#  Range through numbers of basis functions from 4 to 12 to see if we
#  can do better.  We want the best RMSE, but we also want the smallest
#  number of basis functions, which in this case is the degrees of
#  freedom for error (df).  Small df implies a stable estimate.
#  Note: 4 basis functions is as small as we can use without changing the
#  order of the spline.  Also display the gcv statistic to see what it
#  likes.
for (nbasis in 4:12) {
  basisobj = create.bspline.basis(c(0,1),nbasis)
  ys = smooth.basis(argvals, y, basisobj)
  xfd = ys$fd
  gcv = ys$gcv
  RMSE = sqrt(mean((eval.fd(argvals, xfd) - x)^2))
# progress report:
#  cat(paste(nbasis,round(RMSE,3),round(gcv,3),"\n"))
}
#  We got RMSE = 0.062 for 10 basis functions as optimal, but gcv liked
#  almost the same thing, namely 9 basis functions.  Both RMSE and gcv
#  agreed emphatically that 7 or fewer basis functions was not enough.
#  Unlike RMSE, however, gcv does not depend on knowing the truth.
#  Plot the result for 10 basis functions along with "*" at the true
#  values
nbasis = 10
basisobj = create.bspline.basis(c(0,1),10)
xfd = smooth.basis(argvals, y, basisobj)$fd
plotfit.fd(y, argvals, xfd)
points(argvals,x, pch="*")
#  Homework:
#  Repeat all this with various values of sigerr and various values of n

##
####### Simulated data example 2: a roughness-penalized smooth  ########
##

#  A roughness penalty approach is more flexible, allowing continuous
#  control over smoothness and degrees of freedom, can be adapted to
#  known features in the curve, and will generally provide better RMSE
#  for given degrees of freedom.

#  It does require a bit more effort, though.
#  First, we define a little display function for showing how
#  df, gcv and RMSE depend on the log10 smoothing parameter
plotGCVRMSE.fd = function(lamlow, lamhi, lamdel, x, argvals, y,
            fdParobj, wtvec=NULL, fdnames=NULL, covariates=NULL)  {
  loglamvec = seq(lamlow, lamhi, lamdel)
  loglamout = matrix(0,length(loglamvec),4)
  m = 0
  for (loglambda in loglamvec) {
    m = m + 1
    loglamout[m,1] = loglambda
    fdParobj$lambda = 10^(loglambda)
    smoothlist = smooth.basis(argvals, y, fdParobj, wtvec=wtvec,
             fdnames=fdnames, covariates=covariates)
    xfd = smoothlist$fd   #  the curve smoothing the data
    loglamout[m,2] = smoothlist$df
    #  degrees of freedom in the smoothing curve
    loglamout[m,3] = sqrt(mean((eval.fd(argvals, xfd) - x)^2))
    loglamout[m,4] = mean(smoothlist$gcv)  #  the mean of the N gcv values
  }
  cat("log10 lambda, deg. freedom, RMSE, gcv\n")
  for (i in 1:m) {
    cat(format(round(loglamout[i,],3)))
    cat("\n")
  }
  par(mfrow=c(3,1))
  plot(loglamvec, loglamout[,2], type="b")
  title("Degrees of freedom")
  plot(loglamvec, loglamout[,3], type="b")
  title("RMSE")
  plot(loglamvec, loglamout[,4], type="b")
  title("Mean gcv")
  return(loglamout)
}

#  Use the data that you used in Example 1, or run the following code:
n = 51
argvals = seq(0,1,len=n)
x = sin(4*pi*argvals)
sigerr = 0.2
err = matrix(rnorm(x),n,1)*sigerr
y = x + err
#  We now set up a basis system with a knot at every data point.
#  The number of basis functions will equal the number of interior knots
#  plus the order, which in this case is still 4.
#  49 interior knots + order 4 = 53 basis functions
nbasis = n + 2
basisobj = create.bspline.basis(c(0,1),nbasis)
#  Note that there are more basis functions than observed values.  A
#  basis like this is called "super-saturated."  We have to use a
#  positive smoothing parameter for it to work.  Set up an object of
#  class "fdPar" that penalizes the total squared second derivative,
#  using a smoothing parameter that is set here to 10^(-4.5).
lambda = 10^(-4.5)
fdParobj = fdPar(fdobj=basisobj, Lfdobj=2, lambda=lambda)
#  Smooth the data, outputting a list containing various quantities
smoothlist = smooth.basis(argvals, y, fdParobj)
xfd = smoothlist$fd   #  the curve smoothing the data
df  = smoothlist$df   #  the degrees of freedom in the smoothing curve
gcv = smoothlist$gcv  #  the value of the gcv statistic
RMSE = sqrt(mean((eval.fd(argvals, xfd) - x)^2))
cat(round(c(df,RMSE,gcv),3),"\n")
plotfit.fd(y, argvals, xfd)
points(argvals,x, pch="*")
#  Repeat these analyses for a range of log10(lambda) values by running
#  the function plotGCVRMSE that we defined above.

loglamout = plotGCVRMSE.fd(-6, -3, 0.25, x, argvals, y, fdParobj)

#  When we ran this example, the optimal RMSE was 0.073, and was achieved
#  for log10(lambda) = -4.25 or lambda = 0.000056.  At this level of
#  smoothing, the degrees of freedom index was 10.6, a value close to
#  the 10 degrees of freedom that we saw for regression smoothing.  The
#  RMSE value is slightly higher than the regression analysis result, as
#  is the degrees of freedom associated with the optimal value.
#  Roughness penalty will, as we will see later, do better than
#  regression smoothing; but with slightly red faces we say, "That's
#  life with random data!"  The gcv statistic agreed with RMSE on the
#  optimal smoothing level, which is great because it does not need to
#  know the true values.  Note that gcv is emphatic about when there is
#  too much smoothing, but rather vague about when we have
#  under-smoothed the data.
#  Homework:
#  Compute average results taken across 100 sets of random data for each
#  level of smoothing parameter lambda, and for each number of basis
#  functions for regression smoothing.

##
##                       Simulated data example 3:
##           a roughness-penalized smooth of a sample of curves
##
n =  51   #  number of observations per curve
N = 100   #  number of curves
argvals = seq(0,1,len=n)
#  The true curve values are linear combinations of fourier function
#  values.
#  Set up the fourier basis
nfourierbasis = 13
fourierbasis = create.fourier.basis(c(0,1),nfourierbasis)
fourierbasismat = eval.basis(argvals,fourierbasis)
#  Set up some random coefficients, with declining contributions from
#  higher order basis functions
basiswt = matrix(exp(-(1:nfourierbasis)/3),nfourierbasis,N)
xcoef = matrix(rnorm(nfourierbasis*N),nfourierbasis,N)*basiswt
xfd = fd(xcoef, fourierbasis)
x   = eval.fd(argvals, xfd)
#  Add independent Gaussian noise to the data with std. dev. 0.2
sigerr = 0.2
y = x + matrix(rnorm(c(x)),n,N)*sigerr
#  Set up spline basis system
nbasis = n + 2
basisobj = create.bspline.basis(c(0,1),nbasis)
#  Set up roughness penalty with smoothing parameter 10^(-5)
lambda = 10^(-5)
fdParobj = fdPar(fdobj=basisobj, Lfdobj=2, lambda=lambda)
#  Smooth the data, outputting a list containing various quantities
smoothlist = smooth.basis(argvals, y, fdParobj)
xfd = smoothlist$fd   #  the curve smoothing the data
df  = smoothlist$df   #  the degrees of freedom in the smoothing curve
gcv = smoothlist$gcv  #  the value of the gcv statistic
RMSE = sqrt(mean((eval.fd(argvals, xfd) - x)^2))
#  Display the results, note that a gcv value is returned for EACH curve,
#  and therefore that a mean gcv result is reported
cat(round(c(df,RMSE,mean(gcv)),3),"\n")
#  the fits are plotted interactively by plotfit.fd ... click to advance
#  plot
plotfit.fd(y, argvals, xfd)
#  Repeat these results for a range of log10(lambda) values
loglamout = plotGCVRMSE.fd(-6, -3, 0.25, x, argvals, y, fdParobj)
#  Our results were:
# log10 lambda, deg. freedom, RMSE, GCV
# -6.000 30.385  0.140  0.071
# -5.750 26.750  0.131  0.066
# -5.500 23.451  0.123  0.062
# -5.250 20.519  0.116  0.059
# -5.000 17.943  0.109  0.056
# -4.750 15.694  0.104  0.054
# -4.500 13.738  0.101  0.053
# -4.250 12.038  0.102  0.054
# -4.000 10.564  0.108  0.055
# -3.750  9.286  0.120  0.059
# -3.500  8.177  0.139  0.065
# -3.250  7.217  0.164  0.075
# -3.000  6.385  0.196  0.088
#  RMSE and gcv both indicate an optimal smoothing level of
#  log10(lambda) = -4.5 corresponding to 13.7 df.  When we repeated the
#  analysis using regression smoothing with 14 basis functions, we
#  obtained RMSE = 0.110, about 10 percent larger than the value of
#  0.101 in the roughness penalty result.  Smooth the data, outputting a
#  list containing various quantities
#  Homework:
#  Sine functions have a curvature that doesn't vary a great deal over
#  the range the curve.  Devise some test functions with sharp local
#  curvature, such as Gaussian densities with standard deviations that
#  are small relative to the range of the observations.  Compare
#  regression and roughness penalty smoothing in these situations.

if(!CRAN()){
##
####### Simulated data example 4: a roughness-penalized smooth  ########
##                           with correlated error
##
#  These three examples make GCV look pretty good as a basis for
#  selecting the smoothing parameter lambda.  BUT GCV is based an
#  assumption of independent errors, and in reality, functional data
#  often have autocorrelated errors, with an autocorrelation that is
#  usually positive among neighboring observations.  Positively
#  correlated random values tend to exhibit slowly varying values that
#  have long runs on one side or the other of their baseline, and
#  therefore can look like trend in the data that needs to be reflected
#  in the smooth curve.  This code sets up the error correlation matrix
#  for first-order autoregressive errors, or AR(1).
rho = 0.9
n = 51
argvals = seq(0,1,len=n)
x = sin(4*pi*argvals)
Rerr = matrix(0,n,n)
for (i in 1:n) {
  for (j in 1:n) Rerr[i,j] =  rho^abs(i-j)
}
#  Compute the Choleski factor of the correlation matrix
Lerr = chol(Rerr)
#  set up some data
#  Generate auto-correlated errors by multipling independent errors by
#  the transpose of the Choleski factor
sigerr = 0.2
err = as.vector(crossprod(Lerr,matrix(rnorm(x),n,1))*sigerr)
#  See the long-run errors that are genrated
plot(argvals, err)
y = x + err
#  Our values of y were:
y = c(-0.03, 0.36, 0.59, 0.71, 0.97,  1.2,  1.1, 0.96, 0.79, 0.68,
       0.56, 0.25, 0.01,-0.43,-0.69, -1,  -1.09,-1.29,-1.16,-1.09,
      -0.93, -0.9,-0.78,-0.47, -0.3,-0.01, 0.29, 0.47, 0.77, 0.85,
       0.87, 0.97,  0.9, 0.72, 0.48, 0.25,-0.17,-0.39,-0.47,-0.71,
      -1.07,-1.28,-1.33,-1.39,-1.45, -1.3,-1.25,-1.04,-0.82,-0.55, -0.2)
#  Retaining the above data, now set up a basis system with a knot at
#  every data point:  the number of basis functions will equal the
#  number of interior knots plus the order, which in this case is still
#  4.
#   19 interior knots + order 4 = 23 basis functions
nbasis = n + 2
basisobj = create.bspline.basis(c(0,1),nbasis)
fdParobj = fdPar(basisobj)
#  Smooth these results for a range of log10(lambda) values
loglamout = plotGCVRMSE.fd(-6, -3, 0.25, x, argvals, y, fdParobj)
#  Our results without weighting were:
# -6.000 30.385  0.261  0.004
# -5.750 26.750  0.260  0.005
# -5.500 23.451  0.259  0.005
# -5.250 20.519  0.258  0.005
# -5.000 17.943  0.256  0.005
# -4.750 15.694  0.255  0.006
# -4.500 13.738  0.252  0.006
# -4.250 12.038  0.249  0.007
# -4.000 10.564  0.246  0.010
# -3.750  9.286  0.244  0.015
# -3.500  8.177  0.248  0.028
# -3.250  7.217  0.267  0.055
# -3.000  6.385  0.310  0.102
#  Now GCV still is firm on the fact that log10(lambda) over -4 is
#  over-smoothing, but is quite unhelpful about what constitutes
#  undersmoothing.  In real data applications you will have to make the
#  final call.  Now set up a weight matrix equal to the inverse of the
#  correlation matrix
wtmat = solve(Rerr)
#  Smooth these results for a range of log10(lambda) values using the
#  weight matrix
loglamout = plotGCVRMSE.fd(-6, -3, 0.25, x, argvals, y, fdParobj,
                         wtvec=wtmat)
#  Our results with weighting were:
# -6.000 46.347  0.263  0.005
# -5.750 43.656  0.262  0.005
# -5.500 40.042  0.261  0.005
# -5.250 35.667  0.259  0.005
# -5.000 30.892  0.256  0.005
# -4.750 26.126  0.251  0.006
# -4.500 21.691  0.245  0.008
# -4.250 17.776  0.237  0.012
# -4.000 14.449  0.229  0.023
# -3.750 11.703  0.231  0.045
# -3.500  9.488  0.257  0.088
# -3.250  7.731  0.316  0.161
# -3.000  6.356  0.397  0.260
#  GCV is still not clear about what the right smoothing level is.
#  But, comparing the two results, we see an optimal RMSE without
#  smoothing of 0.244 at log10(lambda) = -3.75, and with smoothing 0.229
#  at log10(lambda) = -4.  Weighting improved the RMSE.  At
#  log10(lambda) = -4 the improvement is 9 percent.
#  Smooth the data with and without the weight matrix at log10(lambda) =
#  -4
fdParobj = fdPar(basisobj, 2, 10^(-4))
smoothlistnowt = smooth.basis(argvals, y, fdParobj)
fdobjnowt = smoothlistnowt$fd   #  the curve smoothing the data
df  = smoothlistnowt$df  # the degrees of freedom in the smoothing curve
GCV = smoothlistnowt$gcv  #  the value of the GCV statistic
RMSE = sqrt(mean((eval.fd(argvals, fdobjnowt) - x)^2))
cat(round(c(df,RMSE,GCV),3),"\n")
smoothlistwt = smooth.basis(argvals, y, fdParobj, wtvec=wtmat)
fdobjwt = smoothlistwt$fd   #  the curve smoothing the data
df  = smoothlistwt$df   #  the degrees of freedom in the smoothing curve
GCV = smoothlistwt$gcv  #  the value of the GCV statistic
RMSE = sqrt(mean((eval.fd(argvals, fdobjwt) - x)^2))
cat(round(c(df,RMSE,GCV),3),"\n")
par(mfrow=c(2,1))
plotfit.fd(y, argvals, fdobjnowt)
plotfit.fd(y, argvals, fdobjwt)
par(mfrow=c(1,1))
plot(fdobjnowt)
lines(fdobjwt,lty=2)
points(argvals, y)
#  Homework:
#  Repeat these analyses with various values of rho, perhaps using
#  multiple curves to get more stable indications of relative
#  performance.  Be sure to include some negative rho's.

##
######## Simulated data example 5: derivative estimation  ########
##
#  Functional data analyses often involve estimating derivatives.  Here
#  we repeat the analyses of Example 2, but this time focussing our
#  attention on the estimation of the first and second derivative.
n = 51
argvals = seq(0,1,len=n)
x   = sin(4*pi*argvals)
Dx  = 4*pi*cos(4*pi*argvals)
D2x = -(4*pi)^2*sin(4*pi*argvals)
sigerr = 0.2
y = x + rnorm(x)*sigerr
#  We now use order 6 splines so that we can control the curvature of
#  the second derivative, which therefore involves penalizing the
#  derivative of order four.
norder = 6
nbasis = n + norder - 2
basisobj = create.bspline.basis(c(0,1),nbasis,norder)
#  Note that there are more basis functions than observed values.  A
#  basis like this is called "super-saturated."  We have to use a
#  positive smoothing parameter for it to work.  Set up an object of
#  class "fdPar" that penalizes the total squared fourth derivative. The
#  smoothing parameter that is set here to 10^(-10), because the squared
#  fourth derivative is a much larger number than the squared second
#  derivative.
lambda = 10^(-10)
fdParobj = fdPar(fdobj=basisobj, Lfdobj=4, lambda=lambda)
#  Smooth the data, outputting a list containing various quantities
smoothlist = smooth.basis(argvals, y, fdParobj)
xfd = smoothlist$fd   #  the curve smoothing the data
df  = smoothlist$df   #  the degrees of freedom in the smoothing curve
gcv = smoothlist$gcv  #  the value of the gcv statistic
Dxhat  = eval.fd(argvals, xfd, Lfd=1)
D2xhat = eval.fd(argvals, xfd, Lfd=2)
RMSED  = sqrt(mean((Dxhat  - Dx )^2))
RMSED2 = sqrt(mean((D2xhat - D2x)^2))
cat(round(c(df,RMSED,RMSED2,gcv),3),"\n")
#  Four plots of the results row-wise: data fit, first derivative fit,
#  second derivative fit, second vs. first derivative fit
#  (phase-plane plot)
par(mfrow=c(2,2))
plotfit.fd(y, argvals, xfd)
plot(argvals, Dxhat, type="p", pch="o")
points(argvals, Dx, pch="*")
title("first derivative approximation")
plot(argvals, D2xhat, type="p", pch="o")
points(argvals, D2x, pch="*")
title("second derivative approximation")
plot(Dxhat, D2xhat, type="p", pch="o")
points(Dx, D2x, pch="*")
title("second against first derivative")
#  This illustrates an inevitable problem with spline basis functions;
#  because they are not periodic, they fail to capture derivative
#  information well at the ends of the interval.  The true phase-plane
#  plot is an ellipse, but the phase-plane plot of the estimated
#  derivatives here is only a rough approximtion, and breaks down at the
#  left boundary.
#  Homework:
#  Repeat these results with smaller standard errors.
#  Repeat these results, but this time use a fourier basis with no
#  roughness penalty, and find the number of basis functions that gives
#  the best result.  The right answer to this question is, of course, 3,
#  if we retain the constant term, even though it is here not needed.
#  Compare the smoothing parameter preferred by RMSE for a derivative to
#  that preferred by the RMSE for the function itself, and to that
#  preferred by gcv.

##                  Simulated data example 6:
##           a better roughness penalty for derivative estimation
##
#  We want to see if we can improve the spline fit.
#  We know from elementary calculus as well as the code above that
#  (4*pi)^2 sine(2*p*x) = -D2 sine(2*p*x), so that
#  Lx = D2x + (4*pi)^2 x is zero for a sine or a cosine curve.
#  We now penalize roughness using this "smart" roughness penalty
#  Here we set up a linear differential operator object that defines
#  this penalty
constbasis = create.constant.basis(c(0,1))
xcoef.fd  = fd((4*pi)^2, constbasis)
Dxcoef.fd = fd(0, constbasis)
bwtlist = vector("list", 2)
bwtlist[[1]] = xcoef.fd
bwtlist[[2]] = Dxcoef.fd
Lfdobj = Lfd(nderiv=2, bwtlist=bwtlist)
#  Now we use a much larger value of lambda to reflect our confidence
#  in power of calculus to solve problems!
lambda = 10^(0)
fdParobj = fdPar(fdobj=basisobj, Lfdobj=Lfdobj, lambda=lambda)
smoothlist = smooth.basis(argvals, y, fdParobj)
xfd = smoothlist$fd   #  the curve smoothing the data
df  = smoothlist$df   #  the degrees of freedom in the smoothing curve
gcv = smoothlist$gcv  #  the value of the gcv statistic
Dxhat  = eval.fd(argvals, xfd, Lfd=1)
D2xhat = eval.fd(argvals, xfd, Lfd=2)
RMSED  = sqrt(mean((Dxhat  - Dx )^2))
RMSED2 = sqrt(mean((D2xhat - D2x)^2))
cat(round(c(df,RMSED,RMSED2,gcv),3),"\n")
#  Four plots of the results row-wise: data fit, first derivative fit,
#  second derivative fit, second versus first derivative fit
#  (phase-plane plot)
par(mfrow=c(2,2))
plotfit.fd(y, argvals, xfd)
plot(argvals, Dxhat, type="p", pch="o")
points(argvals, Dx, pch="*")
title("first derivative approximation")
plot(argvals, D2xhat, type="p", pch="o")
points(argvals, D2x, pch="*")
title("second derivative approximation")
plot(Dxhat, D2xhat, type="p", pch="o")
points(Dx, D2x, pch="*")
title("second against first derivative")
#  The results are nearly perfect in spite of the fact that we are not using
#  periodic basis functions.  Notice, too, that we have used 2.03
#  degrees of freedom, which is close to what we would use for the ideal
#  fourier series basis with the constant term dropped.
#  Homework:
#  These results depended on us knowing the right period, of course.
#  The data would certainly allow us to estimate the period 1/2 closely,
#  but try various  other periods by replacing 1/2 by other values.
#  Alternatively, change x by adding a small amount of, say, linear trend.
#  How much trend do you have to add to seriously handicap the results?

##
######## Simulated data example 7: Using covariates  ########
##
#  Now we simulate data that are defined by a sine curve, but where the
#  the first 20 observed values are shifted upwards by 0.5, and the
#  second shifted downwards by -0.2.  The two covariates are indicator
#  or dummy variables, and the estimated regression coefficients will
#  indicate the shifts as estimated from the data.
n = 51
argvals = seq(0,1,len=n)
x = sin(4*pi*argvals)
sigerr = 0.2
y = x + rnorm(x)*sigerr
#  the n by p matrix of covariate values, p being here 2
p = 2
zmat = matrix(0,n,p)
zmat[ 1:11,1] = 1
zmat[11:20,2] = 1
#  The true values of the regression coefficients
beta0 = matrix(c(0.5,-0.2),p,1)
y = y + zmat 
#  The same basis system and smoothing process as used in Example 2
nbasis = n + 2
basisobj = create.bspline.basis(c(0,1),nbasis)
lambda = 10^(-4)
fdParobj = fdPar(basisobj, 2, lambda)
#  Smooth the data, outputting a list containing various quantities
smoothlist = smooth.basis(argvals, y, fdParobj, covariates=zmat)
xfd  = smoothlist$fd   #  the curve smoothing the data
df   = smoothlist$df   #  the degrees of freedom in the smoothing curve
gcv  = smoothlist$gcv  #  the value of the gcv statistic
beta = smoothlist$beta  #  the regression coefficients
RMSE = sqrt(mean((eval.fd(argvals, xfd) - x)^2))
cat(round(c(beta,df,RMSE,gcv),3),"\n")
par(mfrow=c(1,1))
plotfit.fd(y, argvals, xfd)
points(argvals,x, pch="*")
print(beta)
#  The recovery of the smooth curve is fine, as in Example 2.  The
#  shift of the first 10 observations was estimated to be 0.62 in our run,
#  and the shift of the second 20 was estimated to be -0.42.  These
#  estimates are based on only 10 observations, and these estimates are
#  therefore quite reasonable.
#  Repeat these analyses for a range of log10(lambda) values
loglamout = plotGCVRMSE.fd(-6, -3, 0.25, x, argvals, y, fdParobj,
                           covariates=zmat)
#  Homework:
#  Try an example where the covariate values are themselves are
#  generated by a smooth known curve.

##
##                     Simulated data example 8:
##          a roughness-penalized smooth of a sample of curves and
##                    variable observation points
##
n = 51   #  number of observations per curve
N = 100   #  number of curves
argvals = matrix(0,n,N)
for (i in 1:N) argvals[,i] = sort(runif(1:n))
#  The true curve values are linear combinations of fourier function
#  values.
#  Set up the fourier basis
nfourierbasis = 13
fourierbasis = create.fourier.basis(c(0,1),nfourierbasis)
#  Set up some random coefficients, with declining contributions from
#  higher order basis functions
basiswt = matrix(exp(-(1:nfourierbasis)/3),nfourierbasis,N)
xcoef = matrix(rnorm(nfourierbasis*N),nfourierbasis,N)*basiswt
xfd = fd(xcoef, fourierbasis)
x = matrix(0,n,N)
for (i in 1:N) x[,i] = eval.fd(argvals[,i], xfd[i])
#  Add independent Gaussian noise to the data with std. dev. 0.2
sigerr = 0.2
y = x + matrix(rnorm(c(x)),n,N)*sigerr
#  Set up spline basis system
nbasis = n + 2
basisobj = create.bspline.basis(c(0,1),nbasis)
#  Set up roughness penalty with smoothing parameter 10^(-5)
lambda = 10^(-5)
fdParobj = fdPar(fdobj=basisobj, Lfdobj=2, lambda=lambda)
#  Smooth the data, outputting a list containing various quantities
smoothlist = smooth.basis(argvals, y, fdParobj)
xfd = smoothlist$fd   #  the curve smoothing the data
df  = smoothlist$df   #  the degrees of freedom in the smoothing curve
gcv = smoothlist$gcv  #  the value of the gcv statistic
#RMSE = sqrt(mean((eval.fd(argvals, xfd) - x)^2))
eval.x <- eval.fd(argvals, xfd)
e.xfd <- (eval.x-x)
mean.e2 <- mean(e.xfd^2)

RMSE = sqrt(mean.e2)
#  Display the results, note that a gcv value is returned for EACH
#  curve, and therefore that a mean gcv result is reported
cat(round(c(df,RMSE,mean(gcv)),3),"\n")
#  Function plotfit.fd is not equipped to handle a matrix of argvals,
#  but can always be called within a loop to plot each curve in turn.
#  Although a call to function plotGCVRMSE.fd works, the computational
#  overhead is substantial, and we omit this here.

##
## Real data example 9.  gait
##
#  These data involve two variables in addition to multiple curves
gaittime  <- (1:20)/21
gaitrange <- c(0,1)
gaitbasis <- create.fourier.basis(gaitrange,21)
lambda    <- 10^(-11.5)
harmaccelLfd <- vec2Lfd(c(0, 0, (2*pi)^2, 0))
gaitfdPar <- fdPar(gaitbasis, harmaccelLfd, lambda)
gaitSmooth <- smooth.basis(gaittime, gait, gaitfdPar)
gaitfd <- gaitSmooth$fd
## Not run: 
##D   # by default creates multiple plots, asking for a click between plots
##D   plotfit.fd(gait, gaittime, gaitfd)
## End(Not run)

## Don't show: 
  # Check to make sure that it works with N=1e5
  N <- 1e5
  Bsp <- create.bspline.basis(N, 9)
  set.seed(1) # to ensure the same results across platforms
  system.time(fit <- smooth.basis(1:N, runif(N), Bsp))
## End(Don't show)

}
#  end of if (!CRAN)




