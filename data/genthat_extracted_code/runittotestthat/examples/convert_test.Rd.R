library(runittotestthat)


### Name: convert_test
### Title: Convert an RUnit test to a testthat test
### Aliases: convert_test

### ** Examples

test_truth <- function()
{
  x <- all(runif(10) > 0)
  checkTrue(x)
}
convert_test(test_truth)
test_equality <- function()
{
  x <- sqrt(1:5)
  expected <- c(1, 4, 9, 16, 25)
  checkEquals(expected, x ^ 4)
}
convert_test(test_equality)
test_error <- function()
{
  checkException("1" + "2")
}
convert_test(test_error)



