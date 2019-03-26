library(PP3)


### Name: PP3init
### Title: Initialize projection pursuit code
### Aliases: PP3init
### Keywords: multivariate

### ** Examples

#
# Not designed for direct user use, but here is an example
#
#
# The flea beetle data
#
data(beetle)
#
# Initialise the PP3 system for this data
#
tmp <- PP3init(t(beetle))
#
# This object contains the ansT and ansU third- and fourth-order tensors
#



