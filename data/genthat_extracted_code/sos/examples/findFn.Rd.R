library(sos)


### Name: findFn
### Title: Search Help Pages
### Aliases: findFn ? ???
### Keywords: misc

### ** Examples

# Skip these tests on CRAN,
# because they take more than 5 seconds
if(!fda::CRAN()){

z <- findFn("spline", maxPages = 2)
# alternative
zq <- ???spline(2)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(z, zq)
## Don't show: 
)
## End(Don't show)

# To search for 2 terms, not necessarily together:
RSS <- findFn('RSiteSearch function', 1)
matches(RSS)

# To search for an exact string, use braces:
RSS. <- findFn('{RSiteSearch function}', 1)
matches(RSS.) # list(nrow = 0, matches = 0)

# example in which resulting page has some unicode characters
Lambert <- findFn("Lambert")
Lambert
##
## Too many matches
##
fa <- findFn('factor analysis')
# Finds too many matches to process;
# reports Inf matches but returns none.
# When this happens, use a more restrictive search

# check
fa0 <- RSS.[seq(1, length=0),]
attr(fa0, 'matches') <- Inf
attr(fa0, 'PackageSummary') <- PackageSummary(fa0)
attr(fa0, 'string') <- 'factor+analysis'
attr(fa0, 'call') <- call('findFn', string = "factor analysis")

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(fa, fa0)
## Don't show: 
)
## End(Don't show)
}



