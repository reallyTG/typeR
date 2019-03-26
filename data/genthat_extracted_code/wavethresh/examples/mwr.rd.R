library(wavethresh)


### Name: mwr
### Title: Multiple discrete wavelet transform (reconstruction).
### Aliases: mwr
### Keywords: manip

### ** Examples

#
# Decompose and then exactly reconstruct test.data
#
test.data <- rnorm(128)
tdecomp <- mwd(test.data)
trecons <- mwr(tdecomp)
#
# Look at accuracy of reconstruction
max(abs(trecons - test.data))
#[1] 2.266631e-12
#
# See also the examples of using \code{wr} or mwr in
# the \code{examples} section of
# the help for \code{threshold.mwd}.



