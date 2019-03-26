library(wavethresh)


### Name: filter.select
### Title: Provide wavelet filter coefficients.
### Aliases: filter.select
### Keywords: utilities

### ** Examples

#This function is usually called by others.
#However, on occasion you may wish to look at the coefficients themselves.

#
# look at the filter coefficients for N=4 (by default Daubechies'
# least-asymmetric wavelets.)
#
filter.select(4)
#$H:
#[1] -0.07576571 -0.02963553  0.49761867  0.80373875  0.29785780
#[6] -0.09921954 -0.01260397  0.03222310
#
#$G:
#NULL
#
#$name:
#[1] "Daub cmpct on least asymm N=4"
#
#$family:
#[1] "DaubLeAsymm"
#
#$filter.number:
#[1] 4



