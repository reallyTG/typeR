library(wavethresh)


### Name: PsiJmat
### Title: Compute discrete autocorrelation wavelets but return result in
###   matrix form.
### Aliases: PsiJmat
### Keywords: manip

### ** Examples

#
# As a simple first examples we shall compute the matrix containing
# the discrete autocorrelation wavelets up to scale 3.
#
PsiJmat(-3, filter.number=1, family="DaubExPhase")
#Computing PsiJ
#Took  0.25  seconds
#       [,1]  [,2]   [,3] [,4]   [,5]  [,6]   [,7] [,8]   [,9] [,10]  [,11] 
#[1,]  0.000  0.00  0.000  0.0  0.000  0.00 -0.500    1 -0.500  0.00  0.000
#[2,]  0.000  0.00  0.000  0.0 -0.250 -0.50  0.250    1  0.250 -0.50 -0.250
#[3,] -0.125 -0.25 -0.375 -0.5 -0.125  0.25  0.625    1  0.625  0.25 -0.125
#     [,12]  [,13] [,14]  [,15] 
#[1,]   0.0  0.000  0.00  0.000
#[2,]   0.0  0.000  0.00  0.000
#[3,]  -0.5 -0.375 -0.25 -0.125
#
# Note that this contains 3 rows (since J=-3).
# Each row contains the same discrete autocorrelation wavelet at different
# scales and hence different resolutions.
# Compare to the output given by PsiJ for the
# equivalent wavelet and scales.
# Note also that apart from column 8 which contains 1 (the value of the
# ac wavelet at zero) none of the other columns line up. E.g. the value of
# this wavelet at 1/2 is -0.5: this appears in columns 9, 10 and 12
# we could have written it differently so that they should line up.
# I might do this in the future. 
#
#
# Let's compute the matrix containing the discrete autocorrelation
# wavelets up to scale 6 using Daubechies N=10 least-asymmetric
# wavelets.
#
P6mat <- PsiJmat(-6, filter.number=10, family="DaubLeAsymm")
#
# What is the dimension of this matrix?
#
dim(P6mat)
#[1]    6 2395
#
# Hmmm. Pretty large, so we shan't print it out.
#
# However, these are the ac wavelets... Therefore if we compute their
# inner product we should get the same as if we used the ipndacw
# function directly.
#
P6mat 
#             [,1]         [,2]         [,3]         [,4]         [,5] 
#[1,] 1.839101e+00 3.215934e-01 4.058155e-04 8.460063e-06 4.522125e-08
#[2,] 3.215934e-01 3.035353e+00 6.425188e-01 7.947454e-04 1.683209e-05
#[3,] 4.058155e-04 6.425188e-01 6.070419e+00 1.285038e+00 1.589486e-03
#[4,] 8.460063e-06 7.947454e-04 1.285038e+00 1.214084e+01 2.570075e+00
#[5,] 4.522125e-08 1.683209e-05 1.589486e-03 2.570075e+00 2.428168e+01
#[6,] 5.161675e-10 8.941666e-08 3.366416e-05 3.178972e-03 5.140150e+00
#             [,6] 
#[1,] 5.161675e-10
#[2,] 8.941666e-08
#[3,] 3.366416e-05
#[4,] 3.178972e-03
#[5,] 5.140150e+00
#[6,] 4.856335e+01
#
# Let's check it against the ipndacw call
#
ipndacw(-6, filter.number=10, family="DaubLeAsymm")
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
# Yep, they're the same.
#



