library(HH)


### Name: as.likert
### Title: Support functions for diverging stacked barcharts for Likert,
###   semantic differential, and rating scale data.
### Aliases: is.likert as.likert as.likert.data.frame as.likert.formula
###   as.likert.ftable as.likert.table as.likert.matrix
###   as.likert.listOfNamedMatrices as.likert.array as.likert.default
###   is.likertCapable rev.likert
### Keywords: hplot

### ** Examples

## Please see ?likert to see these functions used in context.

tmp2 <- array(1:12, dim=c(3,4), dimnames=list(B=LETTERS[3:5], C=letters[6:9]))
as.likert(tmp2)  ## even number of levels.

is.likert(tmp2)
is.likert(as.likert(tmp2))



