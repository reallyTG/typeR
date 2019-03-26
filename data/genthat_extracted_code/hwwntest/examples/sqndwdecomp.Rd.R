library(hwwntest)


### Name: sqndwdecomp
### Title: Brute-force calculation of the non-decimated squared wavelet
###   transform.
### Aliases: sqndwdecomp
### Keywords: math

### ** Examples

#
# Generate random series and then take transform
x <- rnorm(128)
y <- sqndwdecomp(x=x, J=2, filter.number=3, family="DaubExPhase")



