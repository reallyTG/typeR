
context("findvar")

test_that("findvar_fun", {
  expect_that(findvar_fun(cars)("sp"), is_equivalent_to("speed"))
  expect_that(findvar_fun(iris)("petal"), is_equivalent_to(c("Petal.Length", "Petal.Width")))
})

test_that("findvar_in_df", {
  expect_that(findvar_in_df("sp", cars), is_equivalent_to("speed"))
  expect_that(findvar_in_df("petal", iris), is_equivalent_to(c("Petal.Length", "Petal.Width")))
  
})

suppressMessages(
  test_that("findvar_anywhere", {
    expect_that(findvar_anywhere("sp"), is_equivalent_to(NULL))
    expect_that(findvar_anywhere("petal"), is_equivalent_to(NULL))
    expect_that(findvar_anywhere("sp"), shows_message())
    expect_that(findvar_anywhere("petal"), shows_message())
  })
)