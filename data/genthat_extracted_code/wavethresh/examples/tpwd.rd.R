library(wavethresh)


### Name: tpwd
### Title: Tensor product 2D wavelet transform
### Aliases: tpwd
### Keywords: math

### ** Examples

data(lennon)
ltpwd <- tpwd(lennon)
## Not run: image(log(abs(ltpwd$tpwd)), col=grey(seq(from=0, to=1, length=100)))



