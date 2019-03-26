library(fechner)


### Name: check.data
### Title: Check for Required Data Format
### Aliases: check.data
### Keywords: manip utilities

### ** Examples

## dataset wish is of probability-different format
check.data(wish)

## dataset morse is of percent-same format
check.data(morse, format = "percent.same")

## a matrix without any labeling of rows and columns, of general format
## check.data does the labeling automatically
(X <- ((-1) * matrix(1:16, nrow = 4)))
check.data(X, format = "general")

## examples of data that are not of any of the three formats

## message: data must be matrix or data frame
check.data(as.character(matrix(1:16, nrow = 4)))

## message: data must have same number of rows and columns
check.data(matrix(1:12, nrow = 4))

## message: data must be numbers
check.data(matrix(LETTERS[1:16], nrow = 4))



