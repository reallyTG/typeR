test_that('getParam', {
  expect_warning(res <- getParam('a', 1))
  expect_equal(res, 1)

  params <<- list()
  expect_error(getParam('a', 1))

  params <<- list(a=2)
  expect_silent(res <- getParam('a', 1))
  expect_equal(res, 2)
})
