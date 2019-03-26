library(locits)


### Name: hwtos
### Title: Haar wavelet test for (second-order) stationarity for arbitrary
###   length time series.
### Aliases: hwtos
### Keywords: ts

### ** Examples

#
# Generate test data set of non-dyadic length
#
v3 <- rnorm(300)
#
# Run the test of stationarity
#
## Not run: v3.TOS <- hwtos(v3)
#
#Scales get printed 
#8    7    6    5    4    3    2 
#
## Not run: print(v3.TOS)
#Class 'tosANYN' : Stationarity Object for Arbitrary Length Data :
#	~~~~~~~  : List with 14 components with names
#	nreject mc.method AllTS AllPVal alpha x xSD allTS
#	allpvals allbigscale alllitscale allindex alllv
#	allpvals.unadjust 
#
#
#summary(.):
#----------
#There are  54  hypothesis tests altogether
#There were  0  reject(s)
#P-val adjustment method was:  holm 
#
# Note, nothing got rejected. So accept the H_0 null hypothesis of stationarity.
# This is precisely what you'd expect operating on iid Gaussians.
#
# Let's construct obvious example of non-stationarity.
#
v4 <- c(rnorm(150), rnorm(150,sd=3))
#
# I.e. v4 has sharp variance change halfway along
# Now compute test of stationarity
#
## Not run: v4.TOS <- hwtos(v4)
#
#  Print out results
#
## Not run: print(v4.TOS)
#
#Class 'tosANYN' : Stationarity Object for Arbitrary Length Data :
#       ~~~~~~~  : List with 14 components with names
#       nreject mc.method AllTS AllPVal alpha x xSD allTS
#       allpvals allbigscale alllitscale allindex alllv
#       allpvals.unadjust 
#
#
#summary(.):
#----------
#There are  54  hypothesis tests altogether
#There were  5  reject(s)
#P-val adjustment method was:  holm 
#Listing rejects...
#P:  7  HWTlev:  2  Max Poss Ix:  2  Indices:  2 
#P:  7  HWTlev:  1  Max Poss Ix:  1  Indices:  1 
#P:  6  HWTlev:  1  Max Poss Ix:  1  Indices:  1 
#P:  5  HWTlev:  1  Max Poss Ix:  1  Indices:  1 
#P:  4  HWTlev:  1  Max Poss Ix:  1  Indices:  1 



