library(wavethresh)


### Name: compress.default
### Title: Do "zero" run-length encoding compression of a vector of
###   numbers.
### Aliases: compress.default
### Keywords: manip

### ** Examples

#
# Compress a vector with lots of zeroes
#
compress(c(rep(0,100),99))
#$position:
#[1] 101
#
#$values:
#[1] 99
#
#$original.length:
#[1] 101
#
#attr(, "class"):
#[1] "compressed"
#
# Try to compress a vector with not many zeroes
#
compress(1:10)
#$vector:
#[1]  1 2  3  4  5  6  7  8  9 10
#
#attr(, "class"):
#[1] "uncompressed"
#
#



