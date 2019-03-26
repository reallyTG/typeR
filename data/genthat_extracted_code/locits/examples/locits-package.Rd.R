library(locits)


### Name: locits-package
### Title: New test of second-order stationarity and confidence intervals
###   for localized autocovariance.
### Aliases: locits-package locits
### Keywords: ts

### ** Examples

#
# Here's a simple simulated example.
#
# A series which is a concatenation of two iid Gaussian series with
# different variances.
#
x <- c(rnorm(256, sd=1), rnorm(256, sd=2))
#
# Let's do a test of stationarity
#
st.test <- hwtos2(x)
#8    7    6    5    4    3  
#
# Ok, that's the computation gone, let's look at the results.
#
st.test

#Class 'tos' : Stationarity Object :
#~~~~  : List with 9 components with names
#	nreject rejpval spvals sTS AllTS AllPVal alpha x xSD 
#
#
#summary(.):
#----------
#There are  186  hypothesis tests altogether
#There were  4  FDR rejects
#The rejection p-value was  0.0001376564 
#Using Bonferroni rejection p-value is  0.0002688172 
#And there would be  4  rejections.
#Listing FDR rejects... (thanks Y&Y!)
#P: 5 HWTlev:  0  indices on next line...[1] 1
#P: 6 HWTlev:  0  indices on next line...[1] 1
#P: 7 HWTlev:  0  indices on next line...[1] 1
#P: 8 HWTlev:  0  indices on next line...[1] 1
#
# In the lines above if there are any rejects then the series is
# deemed to be nonstationary, and note that there were 4 in both
# the lines above (sometimes FDR rejects a few more).
#
# You can also plot the object and it shows you where it thinks the
# nonstationarities are
#
## Not run: plot(st.test)
#
# See the help page for the hwtos2 function, where there is an example
# with a stationary series.
#
# For the localized autocovariance...
#
# Let's use the function tvar1sim which generates a time-varying AR model
# with AR(1) paramter varying over the extent of the series from 0.9
# to -0.9 (that is, near the start of the series it behaves like an
# AR(1) with parameter 0.9, and near the end like an AR(1) with parameter
# -0.9, and in between the parameter is somewhere between 0.9 and -0.9
# figured linearly between the two.
#
x <- tvar1sim()
#
# Plot it, so you know what the series looks like, should always do this.
#
## Not run: ts.plot(x)
#
# Now, let's compute the localized autocovariance and also confidence intervals
# For the variance, let's look at the first 20 lags
#
# Do it at t=50 and t=450, ie what is the localized autocovariance at these
# two times.
#
x.lacf.50 <- Rvarlacf(x=x, nz=50, var.lag.max=20)
x.lacf.450 <- Rvarlacf(x=x, nz=450, var.lag.max=20)
#
# Now plot the answers, you may want to do this on two different plots
# so that you can compare the answers
#
#
## Not run: plot(x.lacf.50, plotcor=FALSE, type="acf")
## Not run: plot(x.lacf.450, plotcor=FALSE, type="acf")
#
# Note that the plotcor argument is set so covariances and not correlations
# are plotted. Also, the type is set to "acf" to make the plot *look* like
# the regular acf plot. But DON'T be fooled, it is not the regular acf
# that is plotted, but a time localized plot. The two plots should look
# very different, both like AR(1) but with different parameters (from the
# same time series).
#
# You could also plot the regular acf and see how it gets it wrong!
#



