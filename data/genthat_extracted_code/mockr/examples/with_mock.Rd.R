library(mockr)


### Name: with_mock
### Title: Mock functions in a package.
### Aliases: with_mock

### ** Examples

some_func <- function() stop("oops")
some_other_func <- function() some_func()
tester_func <- function() {
  with_mock(
    some_func = function() 42,
    some_other_func()
  )
}
try(some_other_func())
tester_func()



