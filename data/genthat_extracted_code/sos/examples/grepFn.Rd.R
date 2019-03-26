library(sos)


### Name: grepFn
### Title: Match pattern in a column of a matrix or data.frame
### Aliases: grepFn
### Keywords: misc

### ** Examples

z <- cbind(a=1:2, Function=c('s', 'spline'))
z. <- grepFn("spline", z)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(z., z[2,,drop=FALSE])
## Don't show: 
)
## End(Don't show)



