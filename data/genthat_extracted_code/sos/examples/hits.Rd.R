library(sos)


### Name: hits
### Title: matches attribute of a findFn object
### Aliases: hits matches
### Keywords: misc

### ** Examples

des1 <- findFn('differential equations', 1)

des1. <- matches(des1)
des. <- list(nrow=nrow(des1), matches=attr(des1, 'matches'))
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(des1., des.)
## Don't show: 
)
## End(Don't show)



