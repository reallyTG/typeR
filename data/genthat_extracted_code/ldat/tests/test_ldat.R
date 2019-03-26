
context("Creation of ldat objects")

test_that("ldat works", {
  x <- ldat(a = 1:3, b = letters[1:3])
  
  expect_true(is_lvec(x$a))
  expect_equal(lvec_type(x$a), "integer")
  expect_true(is_lvec(x$b))
  expect_equal(lvec_type(x$b), "character")
  expect_equal(nrow(x), 3)
  expect_equal(ncol(x), 2)
  expect_equal(as.data.frame(x), 
    data.frame(a = 1:3, b = letters[1:3], stringsAsFactors = FALSE))
})


test_that("as_ldat works", {
  x_r <- data.frame(a = 1:3, b = letters[1:3])
  x <- as_ldat(x_r)
  
  expect_true(is_lvec(x$a))
  expect_equal(lvec_type(x$a), "integer")
  expect_true(is_lvec(x$b))
  # didnt use stringsAsFactors in data.frame call above, therefore, b is factor
  expect_equal(lvec_type(x$b), "integer")
  expect_equal(nrow(x), 3)
  expect_equal(ncol(x), 2)
  expect_equal(as.data.frame(x), x_r)
})
