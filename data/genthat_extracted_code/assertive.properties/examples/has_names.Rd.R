library(assertive.properties)


### Name: assert_has_colnames
### Title: Does the input have names?
### Aliases: assert_has_colnames assert_has_dimnames assert_has_names
###   assert_has_rownames has_colnames has_dimnames has_names has_rownames

### ** Examples

assert_has_names(c(a = 1, 2))
dfr <- data.frame(x = 1:5)
assert_has_rownames(dfr)
assert_has_colnames(dfr)
assert_has_dimnames(dfr)



