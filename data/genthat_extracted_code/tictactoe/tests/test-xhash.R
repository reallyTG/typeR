library(tictactoe)
library(testthat)
library(combiter)

context("xhash")


test_that("string state", {
  x <- xhash()
  expect_false(haskey(x, "abcd"))
  x["abcd"] <- 1
  expect_equal(x["abcd"], 1)
  expect_true(haskey(x, "abcd"))

})


test_that("vectorized operations", {
  x <- xhash()
  expect_true(all(!haskeys(x, letters)))
  setvalues(x, letters, 1:26)
  expect_identical(getvalues(x, letters),
                   setNames(as.list(1:26), letters))
  expect_true(all(haskeys(x, letters)))

  setvalues(x, c("X", "Y"),
            list(list(value = 1, state = 0), list(value = 2, state = 1)))
  expect_equal(x["X"]$value, 1)
  expect_equal(x["X"]$state, 0)
  expect_equal(x["Y"]$value, 2)
  expect_equal(x["Y"]$state, 1)
  expect_true(all(haskeys(x, c("X", "Y", "Z")) == c(TRUE, TRUE, FALSE)))
})


test_that("integer state", {
  x <- xhash(convfunc = function(state, ...) {
    paste("x", paste0(state, collapse = ""), sep = "")
  })

  iter <- isubset(5)
  while (hasNext(iter))
  {
    i <- nextElem(iter)
    expect_false(haskey(x, i))
    x[i] <- sum(i)
    expect_true(haskey(x, i))
  }

  iter <- isubset(5)
  while (hasNext(iter))
  {
    i <- nextElem(iter)
    expect_equal(x[i], sum(i))
    x[i] <- NULL
    expect_false(haskey(x, i))
  }
})

