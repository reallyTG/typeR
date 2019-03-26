context("Ordering")

test_that("order of numeric vectors is correctly calculated", {
  # I did not use both NA and NaN as order of those seems to be undefined

  a_r <- c(-1.2, 5E10, NA, NA, 4.1)
  a   <- as_lvec(a_r)
  expect_that(as_rvec(order.lvec(a)), equals(order(a_r, na.last=TRUE)))

  a_r <- c(-1.2, 5E10, NaN, NaN, 4.1)
  a   <- as_lvec(a_r)
  expect_that(as_rvec(order.lvec(a)), equals(order(a_r, na.last=TRUE)))

  # Empty vector
  a_r <- numeric(0)
  a <- as_lvec(a_r)
  expect_that(as_rvec(order.lvec(a)), equals(order(a_r, na.last=TRUE)))

  # 'Large' vectors
  a_r <- rnorm(1000)
  a <- as_lvec(a_r)
  expect_that(as_rvec(order.lvec(a)), equals(order(a_r, na.last=TRUE)))
})

test_that("order of integer vectors is correctly calculated", {
  a_r <- as.integer(c(-1, 2, 1E9, NA, 1234))
  a   <- as_lvec(a_r)
  expect_that(as_rvec(order.lvec(a)), equals(order(a_r, na.last=TRUE)))

  # Empty vector
  a_r <- integer(0)
  a <- as_lvec(a_r)
  expect_that(as_rvec(order.lvec(a)), equals(order(a_r, na.last=TRUE)))

  # 'Large' vectors
  a_r <- sample(1000, 1000)
  a <- as_lvec(a_r)
  expect_that(as_rvec(order.lvec(a)), equals(order(a_r, na.last=TRUE)))
})

test_that("order of logical vectors is correctly calculated", {
  a_r <- as.logical(c(TRUE, FALSE, TRUE, NA, NA))
  a   <- as_lvec(a_r)
  expect_that(as_rvec(order.lvec(a)), equals(order(a_r, na.last=TRUE)))

  # Empty vector
  a_r <- logical(0)
  a <- as_lvec(a_r)
  expect_that(as_rvec(order.lvec(a)), equals(order(a_r, na.last=TRUE)))

  # 'Large' vectors
  # Doesn't work as with integer or double as order.lvec is not stable
  # therefore the order will not necessarily be the same as with R's order
  # Therefore, check if vector is indeed sorted correctly with order
  a_r <- sample(c(TRUE, FALSE, NA), 1000, replace = TRUE)
  a <- as_lvec(a_r)
  o <- order.lvec(a)
  b <- lget(a, o)
  expect_that(as_rvec(b), equals(sort(a_r, na.last=TRUE)))
})

test_that("order of character vectors is correctly calculated", {
  a_r <- c("jan", "pier", NA, "corneel")
  a   <- as_lvec(a_r)
  expect_that(as_rvec(order.lvec(a)), equals(order(a_r, na.last=TRUE)))

  # Empty vector
  a_r <- character(0)
  a <- as_lvec(a_r)
  expect_that(as_rvec(order.lvec(a)), equals(order(a_r, na.last=TRUE)))

  # 'Large' vectors
  # Doesn't work as with integer or double as order.lvec is not stable
  # therefore the order will not necessarily be the same as with R's order
  # Therefore, check if vector is indeed sorted correctly with order
  a_r <- paste0(sample(letters, 1000, replace = TRUE), 
    sample(letters, 1000, replace = TRUE))
  a <- as_lvec(a_r)
  o <- order.lvec(a)
  b <- lget(a, o)
  expect_that(as_rvec(b), equals(sort(a_r, na.last=TRUE)))

})

