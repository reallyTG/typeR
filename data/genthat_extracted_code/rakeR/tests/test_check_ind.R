context("Test check_ind() function")

test_that("Correct data passes", {
  ind <- data.frame(
    "var" = c("a", "b", "c", "a", "b", "c", "a")
  )
  ind <- model.matrix(~ ind$var - 1)
  expect_silent(check_ind(ind))
})

test_that("Incorrect data fails", {
  ind <- data.frame(
    "var" = c("a", "b", "c", "a", "b", "c", "a")
  )
  ind <- model.matrix(~ ind$var - 1)
  ind[2, 3] <- 1
  expect_error(check_ind(ind))
})
