library(psychotools)


### Name: worth
### Title: Extract Worth Parameters
### Aliases: worth
### Keywords: classes

### ** Examples

o <- options(digits = 4)

## data
data("GermanParties2009", package = "psychotools")

## Bradley-Terry model
bt <- btmodel(GermanParties2009$preference)

## worth parameters
worth(bt)

## or
itempar(bt)

options(digits = o$digits)



