library(memoise)


### Name: is.memoised
### Title: Test whether a function is a memoised copy. Memoised copies of
###   functions carry an attribute 'memoised = TRUE', which is.memoised()
###   tests for.
### Aliases: is.memoised is.memoized

### ** Examples

mem_lm <- memoise(lm)
is.memoised(lm) # FALSE
is.memoised(mem_lm) # TRUE



