library(Runuran)


### Name: unuran.is.inversion
### Title: Test whether a "unuran" generator object implements an inversion
###   method
### Aliases: unuran.is.inversion
### Keywords: datagen

### ** Examples

## PINV is an inversion method
unr <- pinvd.new(udnorm())
unuran.is.inversion(unr)

## TDR is a rejection method
unr <- tdrd.new(udnorm())
unuran.is.inversion(unr)




