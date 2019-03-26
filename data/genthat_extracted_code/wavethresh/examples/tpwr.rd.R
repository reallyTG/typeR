library(wavethresh)


### Name: tpwr
### Title: Inverse tensor product 2D wavelet transform.
### Aliases: tpwr
### Keywords: math

### ** Examples

data(lennon)
ltpwd <- tpwd(lennon)
#
# now perform the inverse and compare to the original
#
ltpwr <- tpwr(ltpwd)
sum((ltpwr - lennon)^2)
# [1] 9.22802e-10



