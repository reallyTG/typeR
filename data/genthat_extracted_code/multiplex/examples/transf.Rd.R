library(multiplex)


### Name: transf
### Title: Transform Data from/to Matrix/List Formats
### Aliases: transf
### Keywords: manip array

### ** Examples

## scan the multiplication table data
s <- matrix(data=c(1, 1, 1, 3, 3, 3, 3, 3, 3), nrow=3, ncol=3, byrow=TRUE)

## transform the matrix to a list format
transf(s, lb2lb = TRUE, lbs = c('n','m','ñ'))



