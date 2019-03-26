library(aster)


### Name: chamae3
### Title: Life History Data on Chamaecrista fasciculata
### Aliases: chamae3
### Keywords: datasets

### ** Examples

data(chamae3)
### wide version
## Not run: 
##D ### CRAN policy says examples must take < 5 sec.  This doesn't.
##D foo <- chamae3
##D ### delete fit because it makes no sense in wide version
##D foo$fit <- NULL
##D chamae3w <- reshape(foo, direction = "wide", timevar = "varb",
##D     v.names = "resp", varying = list(levels(chamae3$varb)))
## End(Not run)



