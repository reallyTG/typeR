library(runittotestthat)


### Name: convert_test_file
### Title: Convert a file worth of RUnit tests to testthat tests
### Aliases: convert_test_file

### ** Examples

tmp <- tempfile("test-convert_test_file")
writeLines(
  "test_truth <- function()
{
  x <- all(runif(10) > 0)
  checkTrue(x)
}
test_equality <- function()
{
  x <- sqrt(1:5)
  expected <- c(1, 4, 9, 16, 25)
  checkEquals(expected, x ^ 4)
}
test_error <- function()
{
  checkException('1' + '2')
}",
  tmp
)
convert_test_file(tmp)
unlink(tmp)



