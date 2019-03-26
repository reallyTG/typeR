context("random facts")

test_that("random_fact() works", {
  fact <- random_fact(n = 1L, include = NULL, exclude = NULL)
  expect_is(fact, class = "random_fact")
  expect_is(print(fact), class = "random_fact")
})

test_that("fetch_categories() works", {
  cats <- fetch_categories()
  expect_is(cats, class = "character")
})


context("roundhouse kicks")

test_that("kick() works", {
  skip_if_not_installed("magick")
  gif1 <- kick()
  gif2 <- kick("Chuck Norris can’t test for equality because he has no equal.",
               type = 2, width = 40, size = 25, fps = 5)
  expect_is(gif1, class = "magick-image")
  expect_is(gif2, class = "magick-image")
  expect_error(kick(type = 3))
})
