library(dispRity)


### Name: matrix.dispRity
### Title: Fetching a matrix from a 'dispRity' object.
### Aliases: matrix.dispRity fetch.matrix

### ** Examples

## Load the disparity data based on Beck & Lee 2014
data(disparity)

## To get the original matrix
matrix.dispRity(disparity)

## To get the un-bootstrapped matrix from the second subset
matrix.dispRity(disparity, subsets = 2)

## To get the 52nd bootstrap draw of the second rarefaction level (15) of the
## same subset
matrix.dispRity(disparity, subsets = 2, rarefaction = 2, bootstrap = 52)




