

test_that("get_frontier provides proper messages and warnings", {

  expect_that(get_frontier(VADeaths, 2, 3), throws_error())
  expect_that(get_frontier(iris, Sepal.Length, Species), throws_error())

})

test_that("get_frontier has correct dimensions and output type", {

  expect_equal(get_frontier(mtcars, mpg, wt) %>% nrow(), 8)
  expect_equal(get_frontier(mtcars, mpg, wt) %>% ncol(), 2)
  expect_true(get_frontier(mtcars, mpg, wt) %>% is.data.frame())

})

test_that("get_frontier computes correctly", {

  expect_equal(get_frontier(mtcars, mpg, wt) %>% .[1, 1], 33.9)
  expect_equal(get_frontier(mtcars, mpg, wt, decreasing = FALSE) %>% .[3, 2], 4.07)
  expect_equal(get_frontier(airquality, Ozone, Temp, quadrant = 'top.left') %>% .[6, 2], 84)
  expect_equal(get_frontier(airquality, Ozone, Temp, quadrant = 'bottom.right') %>% .[6, 2], 61)

})
