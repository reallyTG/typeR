library(hcp)


### Name: hcp
### Title: Change Point Estimation for Regression with Heteroscedastic Data
### Aliases: hcp

### ** Examples

# Example 1: Test the hcp() using simulated data
# Simulate a C-LLL data set with a common variance 0.25,
# where the 2 change points are at x = 2 and x = 5.

x1<-seq(0,2,by=0.05)
x2<-seq(2.05,5,by=0.05)
x3<-seq(5.05,7,by=0.05)
y1<-2+2*x1+rnorm(length(x1),0,0.5)
y2<-5+0.5*x2+rnorm(length(x2),0,0.5)
y3<-17.5-2*x3+rnorm(length(x3),0,0.5)
z<-data.frame(c(x1,x2,x3),c(y1,y2,y3)); names(z)=c("x","y")
# So the true beta for data z is (2,2,5,0.5,17.5,-2).

# Visualizing the plot given by plot(z) shows that
# three segments are all linear, variances appear
# to be homoscedastic and the change points are
# in (1.5,2.5) and (4.5,5.5).
# Thus, we fit the following model:
hcp(z,1.5,2.5,4.5,5.5,"C-LLL","Common")

# All estimates look good in comparison to the
# real parameters.

# Can also try MMP method for the LLL model as
# below, if needed. The reasonable r1, s1 for
# MMP method are: r1 = 11, s1 = 60.
# hcp(dataset1,1.5,2.5,4.5,5.5,"MMP","Common","FALSE",0.25,11,60)


# Example 2: The footprint data from the tire industry
# in Ganocy and Sun (2014). The objective was to estimate
# the footprint length, i.e. the length between two change
# points in the data.

# Can visualize the built-in tire footprint data that
# comes with this package to set the intervals
# bracketing 2 change points.
plot(FP.Sample.2)

# Footprint data usually has three segments with
# a larger variance in the middle segment than those
# in the first and third segments, which is confirmed
# by the plot. It also appears that the middle segment
# is quadratic and the two change points are around
# 1 and 5.8, falling in the intervals (0.5,2) and (5,6.5).
# Hence, the C-LQL model with "121" variance should
# be the most adequate:
hcp(FP.Sample.2,0.5,2,5,6.5,"C-LQL","121")


# Extra: The following illustrates how to choose the
# hyperparameters, needed in an application of the
# MMP method. This MMP method is an iterative method
# so it is the slowest method.

# It also requires specifying the input for sigma21,
# r1, s1, if the variance type is "Common", where
# sigma21 is the variance for all three segments.
# r1, s1 are shape and scale parameters of the Gamma
# distribution for all three segments.

# The Bayes empirical estimates of r1, s1 are:
# r1 = mean/sigma2, s1 = (mean)^2/sigma2, where mean
# and sigma are the mean and sigma of the variance
# sigma21; they can be computed based on a sequence
# of local estimates of sigma21 using neighboring points.

# Input for sigma21, r1, s1, sigma22, r2, s2 is needed
# if the variance type is "121", where sigma21 is
# the variance for the first and third segments, and
# sigma22 is the variance for the second segment.

# Bayes empirical estimates of (r1,s1) and (r2,s2) are
# similar to that in the "Common" type. They can be
# obtained based on two sequences of local estimates
# of sigma21, sigma22, using the neighboring points
# in preliminary respective segments. They do not
# need to be too accurate.

# Here is an example of MMP method for this footprint
# data, though the C-LQL method fit above is more adequate:
# hcp(FP.Sample.2,0.5,2,5,6.5,"MMP","121","FALSE",10,1,10,35,1,35)
# Its second segment is a linear approximation to the
# quadratic curve (for an illustration of MMP, only).



