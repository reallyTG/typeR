library(wavethresh)


### Name: ipndacw
### Title: Compute inner product matrix of discrete non-decimated
###   autocorrelation wavelets.
### Aliases: ipndacw
### Keywords: algebra

### ** Examples

#
# Let us create the 4x4 inner product matrix for the Haar wavelet.
# We'll turn on the jolly verbose messages as well. 
#
ipndacw(-4, filter.number=1, family="DaubExPhase", verbose=TRUE)
#Computing ipndacw
#Calling haarmat
#Took  0.0699999  seconds
#       -1     -2     -3     -4 
#-1 1.5000 0.7500 0.3750 0.1875
#-2 0.7500 1.7500 1.1250 0.5625
#-3 0.3750 1.1250 2.8750 2.0625
#-4 0.1875 0.5625 2.0625 5.4375
#
# If we do this again it will use the precomputed version
#
ipndacw(-4, filter.number=1, family="DaubExPhase", verbose=TRUE)
#Computing ipndacw
#Returning precomputed version: using  4 
#Took  0.08  seconds
#       -1     -2     -3     -4 
#-1 1.5000 0.7500 0.3750 0.1875
#-2 0.7500 1.7500 1.1250 0.5625
#-3 0.3750 1.1250 2.8750 2.0625
#-4 0.1875 0.5625 2.0625 5.4375
#
# Let's use a smoother wavelet from the least-asymmetric family
# and generate the 6x6 version.
#
ipndacw(-6, filter.number=10, family="DaubLeAsymm", verbose=TRUE)
#Computing ipndacw
#Took  0.95  seconds
#             -1           -2           -3           -4           -5 
#-1 1.839101e+00 3.215934e-01 4.058155e-04 8.460063e-06 4.522125e-08
#-2 3.215934e-01 3.035353e+00 6.425188e-01 7.947454e-04 1.683209e-05
#-3 4.058155e-04 6.425188e-01 6.070419e+00 1.285038e+00 1.589486e-03
#-4 8.460063e-06 7.947454e-04 1.285038e+00 1.214084e+01 2.570075e+00
#-5 4.522125e-08 1.683209e-05 1.589486e-03 2.570075e+00 2.428168e+01
#-6 5.161675e-10 8.941666e-08 3.366416e-05 3.178972e-03 5.140150e+00
#             -6 
#-1 5.161675e-10
#-2 8.941666e-08
#-3 3.366416e-05
#-4 3.178972e-03
#-5 5.140150e+00
#-6 4.856335e+01
#



