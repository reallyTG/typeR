library(multiplex)


### Name: expos
### Title: Network Exposure for Multiple Networks
### Aliases: expos
### Keywords: attribute models

### ** Examples

## Create the data: two binary relations among three elements
arr <- round( replace( array( runif(18), c(3 ,3, 2) ), array( runif(18),
c(3, 3, 2) ) > .9, 3 ) )

## the first array is for attributes
rs <- rel.sys(arr, att = 1)

## Calculate the exposure measure for an attribute type with adopter categories
expos(rs, classes = TRUE)




