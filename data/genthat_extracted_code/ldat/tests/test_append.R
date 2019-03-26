
context("Append")

test_that("append.lvec works", {
  x <- as_lvec(1:10)
  y <- 11
  z <- append(x, y)
  expect_that(as_rvec(z), equals(1:11))
  expect_that(as_rvec(x), equals(1:10))
  expect_that(lvec_type(z), equals(lvec_type(x)))

  y <- 1:10
  z <- append.lvec(NULL, y)
  expect_that(as_rvec(z), equals(1:10))

  x <- as_lvec(1:10)
  y <- 11
  z <- append(x, y, clone = FALSE)
  expect_that(as_rvec(z), equals(1:11))
  expect_that(as_rvec(x), equals(1:11))
  expect_that(lvec_type(z), equals(lvec_type(x)))


  x <- as_lvec(c("foo", "bar"))
  y <- "foobar"
  z <- append(x, y)
  expect_that(as_rvec(z), equals(c("foo", "bar", "foobar")))
})

test_that("append.lvec works for factor vectors", {
  x <- as_lvec(factor(letters[2:4], levels = letters[2:5]))
  y <- as_lvec(factor(letters[1:3], levels = letters[1:4]))
  
  z <- append(x, y)
  z_r <- factor(c("b", "c", "d", "a", "b", "c"), levels = 
      c("b", "c", "d", "e", "a"))
  expect_equal(as_rvec(z), z_r)
  expect_equal(lvec_type(z), lvec_type(x))
  expect_equal(rattr(z, "class"), "factor")
  
  z <- append(x, y, clone = FALSE)
  expect_equal(as_rvec(z), z_r)
  expect_equal(as_rvec(x), z_r)
  expect_equal(lvec_type(z), lvec_type(x))
  expect_equal(rattr(z, "class"), "factor")
})

test_that("append.ldat works", {
  x_r <- data.frame(a = 1:3, b = letters[1:3], stringsAsFactors = FALSE)
  y_r <- data.frame(a = 5:7, b = letters[5:7], stringsAsFactors = FALSE)
  x <- as_ldat(x_r)
  y <- as_ldat(y_r)
  
  expect_equal(as.data.frame(append(x, y)), rbind(x_r, y_r))
  expect_equal(as.data.frame(append.ldat(NULL, y)), y_r)
  
  x_r <- data.frame(a = 1:3, b = letters[1:3], stringsAsFactors = TRUE)
  y_r <- data.frame(a = 5:7, b = letters[5:7], stringsAsFactors = TRUE)
  x <- as_ldat(x_r)
  y <- as_ldat(y_r)
  
  
  expect_equal(as.data.frame(append(x, y)), rbind(x_r, y_r))
  expect_equal(as.data.frame(append.ldat(NULL, y)), y_r)
  
})