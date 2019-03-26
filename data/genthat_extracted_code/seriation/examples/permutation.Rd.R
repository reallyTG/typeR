library(seriation)


### Name: permutation
### Title: Class ser_permutation - A Collection of Permutation Vectors for
###   Seriation
### Aliases: ser_permutation permutation print.ser_permutation
###   c.ser_permutation "[.ser_permutation"
### Keywords: classes

### ** Examples

o <- ser_permutation(1:5, 10:1)
o

## length (number of dimensions)
length(o)

## get permutation vector for 2nd dimension
get_order(o, 2)

## reverse dimensions
o[2:1]

## combine
o <- c(o, ser_permutation(1:15))
o

## get an individual permutation
o[[2]]

## reverse the order of a permutation
o[[2]] <- rev(o[[2]])
get_order(o,2)



