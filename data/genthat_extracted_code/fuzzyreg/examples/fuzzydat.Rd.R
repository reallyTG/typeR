library(fuzzyreg)


### Name: fuzzydat
### Title: Data For Fuzzy Linear Regression
### Aliases: fuzzydat
### Keywords: datasets

### ** Examples

data(fuzzydat)
fuzzylm(y ~ x, data = fuzzydat$lee)
fuzzylm(y ~ x, data = fuzzydat$dia, method = "fls", fuzzy.left.y = "yl", fuzzy.right.y = "yl")



