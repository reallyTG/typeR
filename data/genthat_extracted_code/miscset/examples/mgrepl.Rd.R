library(miscset)


### Name: mgrepl
### Title: Multiple Pattern Matching and Replacement
### Aliases: mgrepl
### Keywords: grepl multiple regex

### ** Examples

#

# strings
s <- c("ab","ac","bc", NA)

# match all patterns (default)
mgrepl(c("a", "b"), s)

# match any of the patterns
mgrepl(c("a", "b"), s, any)
grepl("a|b", s)

# return logical matrix, one column for each pattern
mgrepl(c("a", "b"), s, identity)

# return count of matches
mgrepl(c("a", "b"), s, sum)

#



