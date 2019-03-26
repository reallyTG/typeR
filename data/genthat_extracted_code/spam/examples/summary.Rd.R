library(spam)


### Name: Summary
### Title: Rounding of Numbers
### Aliases: Summary.spam Summary,spam-method all.spam any.spam max.spam
###   min.spam prod.spam range.spam sum.spam all,spam-method
###   any,spam-method max,spam-method min,spam-method prod,spam-method
###   range,spam-method sum,spam-method
### Keywords: manip

### ** Examples

getGroupMembers("Summary")

smat <- diag.spam( runif(15))
range(smat)
options(spam.structurebased=FALSE)
range(smat)

## Not run: 
##D max( log(spam(c(1,-1))), na.rm=TRUE)
## End(Not run)
# allow 'NA's first:
# TODO
# options(spam.NAOK=TRUE)
# max( log(spam(c(1,-1))), na.rm=TRUE)



