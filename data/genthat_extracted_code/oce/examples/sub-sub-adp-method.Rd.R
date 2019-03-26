library(oce)


### Name: [[,adp-method
### Title: Extract Something from an adp Object
### Aliases: [[,adp-method

### ** Examples

data(adp)
# Tests for beam 1, distance bin 1, first 5 observation times
adp[["v"]][1:5,1,1]
adp[["a"]][1:5,1,1]
adp[["a", "numeric"]][1:5,1,1]
as.numeric(adp[["a"]][1:5,1,1]) # same as above




