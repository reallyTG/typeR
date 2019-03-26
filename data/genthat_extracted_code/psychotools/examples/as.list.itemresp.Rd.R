library(psychotools)


### Name: as.list.itemresp
### Title: Coercing Item Response Data
### Aliases: is.itemresp as.list.itemresp as.character.itemresp
###   as.data.frame.itemresp as.double.itemresp as.integer.itemresp
###   as.matrix.itemresp
### Keywords: classes

### ** Examples

## item responses from binary matrix
x <- cbind(c(1, 0, 1, 0), c(1, 0, 0, 0), c(0, 1, 1, 1))
xi <- itemresp(x)
## change mscale
mscale(xi) <- c("-", "+")
xi

## coercion to list of factors with levels taken from mscale
as.list(xi)
## same but levels taken as integers 0, 1
as.list(xi, mscale = FALSE)
## only for first two items
as.list(xi, items = 1:2)
## result as data.frame
as.list(xi, df = TRUE)

## data frame with single itemresp column
as.data.frame(xi)

## integer matrix
as.matrix(xi)

## character vector
as.character(xi)

## check class of xi
is.itemresp(xi)



