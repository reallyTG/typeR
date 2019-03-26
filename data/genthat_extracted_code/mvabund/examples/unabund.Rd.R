library(mvabund)


### Name: unabund
### Title: Remove the mvabund Class Attribute
### Aliases: unabund
### Keywords: sysdata manip classes

### ** Examples

## Create an mvabund object:
abundances <- as.mvabund(matrix(1:20,5,4))

## Restore the original object:
mat <- unabund(x=abundances)
mat



