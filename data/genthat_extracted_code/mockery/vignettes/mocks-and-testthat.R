## ----include=FALSE-------------------------------------------------------
library(mockery)

library(knitr)
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----create_mock---------------------------------------------------------
m <- mock()

## ----return_values-------------------------------------------------------
m <- mock(1, 2, 3)
m()
m()
m()

## ----return_expression---------------------------------------------------
x <- 1
y <- 2
m <- mock(x + y)
m()

## ----cycle_no, eval=FALSE------------------------------------------------
#  m <- mock(1, 2)
#  m()
#  #> [1] 1
#  m()
#  #> [1] 2
#  m()
#  #> Error: too many calls to mock object and cycle set to FALSE

## ----cycle_true----------------------------------------------------------
m <- mock(1, 2, cycle = TRUE)
m()
m()
m()
m()

## ----cycle_expression----------------------------------------------------
x <- 1
y <- 2
m <- mock(1, x + y, cycle = TRUE)

m()
m()

## ----cycle_expression_2nd------------------------------------------------
y <- 10
m()
m()

## ----return_expression_env-----------------------------------------------
x <- 1
y <- 2
e <- new.env()
m <- mock(x + y, envir = e, cycle = TRUE)

m()
e$x <- 10
m()

## ----with_mock, message=FALSE--------------------------------------------
library(testthat)

m <- mock(1)
f <- function (x) summary(x)
with_mock(f = m, {
  expect_equal(f(iris), 1)
})

## ----expect_called-------------------------------------------------------
m <- mock(1, 2)

m()
expect_called(m, 1)

m()
expect_called(m, 2)

## ----expect_called_error, eval=FALSE-------------------------------------
#  expect_called(m, 1)
#  #> Error: mock object has not been called 1 time.
#  expect_called(m, 3)
#  #> Error: mock object has not been called 3 times.

## ----expect_call---------------------------------------------------------
m <- mock(1)
with_mock(summary = m, {
  summary(iris)
})

expect_call(m, 1, summary(iris))

## ----call_doesnt_match, eval=FALSE---------------------------------------
#  expect_call(m, 1, summary(x))
#  #> Error: expected call summary(x) does not mach actual call summary(iris).

## ----expect_args---------------------------------------------------------
expect_args(m, 1, iris)

## ----expect_args_different, eval=FALSE-----------------------------------
#  expect_args(m, 1, iris[-1, ])
#  #> Error: arguments to call #1 not equal to expected arguments.
#  #> Component 1: Attributes: < Component "row.names": Numeric: lengths (150, 149) differ >
#  #> Component 1: Component 1: Numeric: lengths (150, 149) differ
#  #> Component 1: Component 2: Numeric: lengths (150, 149) differ
#  #> Component 1: Component 3: Numeric: lengths (150, 149) differ
#  #> Component 1: Component 4: Numeric: lengths (150, 149) differ
#  #> Component 1: Component 5: Lengths: 150, 149
#  #> Component 1: Component 5: Lengths (150, 149) differ (string compare on first 149)
#  #> Component 1: Component 5: 2 string mismatches
#  #> expected argument list does not mach actual one.

## ----expect_args_named---------------------------------------------------
m <- mock(1)
with_mock(summary = m, {
  summary(object = iris)
})

expect_args(m, 1, object = iris)

## ----expect_args_unnamed, eval=FALSE-------------------------------------
#  expect_args(m, 1, iris)
#  #> Error: arguments to call #1 not equal to expected arguments.
#  #> names for target but not for current
#  #> expected argument list does not mach actual one.

