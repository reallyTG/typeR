library(assertive.code)


### Name: assert_all_are_existing
### Title: Does the variable exist?
### Aliases: assert_all_are_existing assert_any_are_existing is_existing

### ** Examples

e <- new.env()
e$x <- 1
e$y <- 2
assert_all_are_existing(c("x", "y"), envir = e)
#These examples should fail.
assertive.base::dont_stop(assert_all_are_existing(c("x", "z"), envir = e))



