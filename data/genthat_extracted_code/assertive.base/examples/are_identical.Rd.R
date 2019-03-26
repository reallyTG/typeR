library(assertive.base)


### Name: are_identical
### Title: Are the inputs identical?
### Aliases: are_identical are_identical_legacy
###   assert_all_are_identical_legacy assert_any_are_identical_legacy
###   assert_are_identical

### ** Examples

x <- 1:5
are_identical(c(1, -1), cos(c(0, pi)))
assertive.base::dont_stop(assert_are_identical(c(1, 1), cos(c(0, pi))))



