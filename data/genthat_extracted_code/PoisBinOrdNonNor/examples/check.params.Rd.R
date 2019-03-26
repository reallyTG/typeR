library(PoisBinOrdNonNor)


### Name: check.params
### Title: Validates the adjusted marginal parameter lists
### Aliases: check.params

### ** Examples

## Not run: 
##D #This pois.list will produce an error since the first entry is 0.
##D check.params(no.pois = 2, pois.list = list(0, 1))
##D 
##D #This ordbin.list will produce an error since it is not cumulative.
##D check.params(no.ordbin = 2, ordbin.list = list(.25, c(.25, 0, .75)))
##D 
##D #This ordbin.list will produce an error since the last entry is > 1.
##D check.params(no.ordbin = 2, ordbin.list = list(.25, c(.25, .5, 1.25)))
##D 
##D #This ordbin.list will produce an error since the first entry < 0.
##D check.params(no.ordbin = 2, ordbin.list = list(.25, c(-.25, .5, .75)))
##D 
##D #This nonn.list will produce an error since 0 < 2^2 - 2
##D check.params(no.nonn = 2, nonn.list = list(c(2,0), c(.5, 1, 2, 0)))
##D 
##D #This nonn.list will produce an error since the variance = 0.
##D check.params(no.nonn = 2, nonn.list = list(c(0,0), c(.5, 0, 0, 0)))
## End(Not run)

check.params(no.pois = 1, pois.list = list(1), no.ordbin = 2, 
    ordbin.list = list(.25, c(.25, .25, .75)), no.nonn = 1, 
    nonn.list = list(c(0, 1, 0, 3)))



