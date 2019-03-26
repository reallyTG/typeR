library(fuzzyreg)


### Name: fuzzylm
### Title: Fuzzy Linear Regression
### Aliases: fuzzylm

### ** Examples

data(fuzzydat)
fuzzylm(y ~ x, data = fuzzydat$lee, method = "plrls")
## Not run: 
##D # returns an error due to the incorrect number of spreads
##D fuzzylm(y ~ x, data = fuzzydat$dia, method = "fls", fuzzy.left.y = "yl")
## End(Not run)
# use the same column name for the left and right spread, when the method requests 
# non-symmetric fuzzy numbers, but the data specify symmetric fuzzy numbers 
fuzzylm(y ~ x, data = fuzzydat$dia, method = "fls", fuzzy.left.y = "yl", fuzzy.right.y = "yl")



