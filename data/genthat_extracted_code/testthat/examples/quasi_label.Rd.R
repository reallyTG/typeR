library(testthat)


### Name: quasi_label
### Title: Quasi-labelling
### Aliases: quasi_label
### Keywords: internal

### ** Examples

f <- function(i) if (i > 3) i * 9 else i * 10
i <- 10

# This short of expression commonly occurs inside a for loop or function
# And the failure isn't helpful because you can't see the value of i
# that caused the problem:
show_failure(expect_equal(f(i), i * 10))

# To overcome this issue, testthat allows you to unquote expressions using
# !!. This causes the failure message to show the value rather than the
# variable name
show_failure(expect_equal(f(!!i), !!(i * 10)))



