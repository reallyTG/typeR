context("magic_for")

test_that("magic_for", {
  magic_for()
  for(i in 1:3) {
    x <- i * 2
    put(x)
  }
  act <- magic_result()
  expect_equal(act, list(x = list(2,4,6)))
})

test_that("magic_for name", {
  magic_for()
  for(i in 1:3) {
    put(x = i * 2)
  }
  act <- magic_result()
  expect_equal(act, list(x = list(2, 4, 6)))
})

test_that("magic_for if", {
  magic_for()
  for(i in 1:3) {
    x <- i * 2
    if (i %% 2 == 0) put(x)
  }
  act <- magic_result()
  expect_equal(act, list(x = list(NA, 4, NA)))
})

test_that("magic_for 2", {
  magic_for()
  for(i in 1:3) {
    put(x = i * 2, y = i * 3)
  }
  act <- magic_result()
  expect_equal(act, list(x = list(2, 4, 6), y = list(3, 6, 9)))
})

test_that("magic_for 2 if", {
  magic_for()
  for(i in 1:3) {
    if(i %% 2 == 0) put(x = i * 2, y = i * 3)
  }
  act <- magic_result()
  expect_equal(act, list(x = list(NA, 4, NA), y = list(NA, 6, NA)))
})

test_that("magic_for 3", {
  magic_for()
  for(i in 1:3) {
    put(x = i * 2, i * 3)
  }
  act <- magic_result()
  expect_equal(act, list(x = list(2, 4, 6), `i*3` = list(3, 6, 9)))
})
