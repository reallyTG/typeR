library(onehot)


### Name: onehot
### Title: Onehot encode a data.frame
### Aliases: onehot

### ** Examples

data(iris)
encoder <- onehot(iris)

## add NAs to factors
encoder <- onehot(iris, addNA=TRUE)

## Convert character fields to factrs
encoder <- onehot(iris, stringsAsFactors=TRUE)

## limit which factors are onehot encoded
encoder <- onehot(iris, max_levels=5)



