context("Testing extend_with")

test_that("Test extend_with", {
  orig_list <- list(a = 1, b = 2)

  new_list <- orig_list %>% extend_with(
    "extension",
    list(b = "3", c = list(1))
  )

  testthat::expect_is(new_list, "extension")
  testthat::expect_is(new_list, "list")

  testthat::expect_equal(length(new_list), 3)
  testthat::expect_equal(new_list$a, 1)
  testthat::expect_equal(new_list$b, "3")
  testthat::expect_equal(new_list$c, list(1))
})

test_that("Test extend_with with ... functionality", {
  orig_list <- list(a = 1, b = 2)

  new_list <- orig_list %>% extend_with(
    "extension2",
    b = list(2),
    c = "10"
  )

  testthat::expect_is(new_list, "extension2")
  testthat::expect_is(new_list, "list")

  testthat::expect_equal(length(new_list), 3)
  testthat::expect_equal(new_list$a, 1)
  testthat::expect_equal(new_list$b, list(2))
  testthat::expect_equal(new_list$c, "10")

  testthat::expect_error(
    orig_list %>% extend_with(
      "extension2",
      "unnamed_variable"
    )
  )
})

