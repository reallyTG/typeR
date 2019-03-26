context("dkbinom() and pkbinom()")

test_that("dkbinom() matches dbinom() when p are equal or nearly equal", {

  x1 <- dkbinom(7, c(10, 12), c(0.3, 0.3))
  x2 <- dbinom(7, 22, 0.3)
  
  expect_true(x1 == x2)

  x3 <- dkbinom(12, 27, 0.8)
  x4 <- dbinom(12, 27, 0.8)

  expect_true(x3 == x4)

  x5 <- sum(dkbinom(12:14, c(20, 7), c(0.8, 0.80000001)))
  x6 <- sum(dbinom(12:14, 27, 0.8))
  expect_true(abs(x5 - x6) < 1e-09)
  
})

test_that("pkbinom() matches pbinom() when p are equal or nearly equal", {

  x1 <- pkbinom(5, c(10, 12), c(0.3, 0.3))
  x2 <- pbinom(5, 22, 0.3)
  expect_true(x1 == x2)

  x3 <- pkbinom(20, 27, 0.8)
  x4 <- pbinom(20, 27, 0.8)
  expect_true(x3 == x4)

  x5 <- pkbinom(20, c(5, 6, 7, 8), c(0.8000002, 0.8, 0.799999, 0.80001))
  x6 <- pbinom(20, 26, 0.8)
  expect_true(abs(x5 - x6) < 1e-04)

})

test_that("dkbinom() methods agree", {

  x1 <- dkbinom(4, c(3, 4, 2), c(0.3, 0.5, 0.8), method = "fft")
  x2 <- dkbinom(4, c(3, 4, 2), c(0.3, 0.5, 0.8), method = "butler")

  expect_equal(x1, x2, tol = 1e-12)
  
})

test_that("pkbinom() methods agree", {

  x1 <- pkbinom(4, c(3, 4, 2), c(0.3, 0.5, 0.8), method = "fft")
  x2 <- pkbinom(4, c(3, 4, 2), c(0.3, 0.5, 0.8), method = "butler")
  x3 <- pkbinom(4, c(3, 4, 2), c(0.3, 0.5, 0.8), method = "naive")

  expect_equal(x1, x2, tol = 1e-12)
  expect_equal(x2, x3, tol = 1e-12)
  expect_equal(x1, x3, tol = 1e-12)
  
})

test_that("dkbinom() sums to 1", {

  x1 <- sum(dkbinom(0:10, c(3, 7), c(0.7, 0.2)))
  expect_equal(x1, 1, tol = 1e-10)

  x2 <- sum(dkbinom(0:20, c(3, 10, 7), c(0.05, 0.01, 0.1)))  
  expect_equal(x2, 1, tol = 1e-10)

  x3 <- sum(dkbinom(0:100, c(30, 22, 20, 28), c(0.99, 0.5, 0.25, 0.1)))
  expect_equal(x3, 1, tol = 1e-10)
  
})

test_that("pkbinom() behaves properly at endpoints and with NAs", {

  # Endpoints    
  expect_equal(pkbinom(10, c(3, 7), c(0.25, 0.05)), 1, tol = 1e-12)
  expect_identical(pkbinom(c(-1, 11), c(3, 7), c(0.25, 0.05)), c(0, 1))

  # Endpoints
  expect_equal(pkbinom(100, c(23, 28, 47, 3), c(0.01, 0.4, 0.05, 0.8)), 1, tol = 1e-12)
  expect_identical(pkbinom(c(-5, 50, 101), c(50, 47, 3), c(0.01, 0.05, 0.8))[c(1, 3)], c(0, 1))

  # NA's
  expect_identical(pkbinom(c(-5, NA, 5, 101, NA), c(50, 47, 3), c(0.01, 0.05, 0.8))[-3], c(0, NA, 1, NA))
  expect_identical(pkbinom(as.numeric(c(NA, NA)), c(50, 40), c(0.3, 0.2)), as.numeric(c(NA, NA)))

  # Fractional q
  x <- c(0.2, 5.23, 4.8, 9.1, 10.2)
  expect_identical(pkbinom(x, c(4, 6), c(0.2, 0.8)), pkbinom(floor(x), c(4, 6), c(0.2, 0.8)))
  
})

test_that("dkbinom() handles 0 mass and NA's properly", {

  # Test for 0's
  x <- c(-1, 0, 0.5, 1, 2.7, 3, 11, 12)
  zero <- c(1, 3, 5, 8)
  x1 <- dkbinom(x, c(4, 7), c(0.2, 0.7))
  expect_true(all(x1[zero] == 0))

  # Test for NA's
  x <- c(NA, 0, NA, 1, NA, 3, 11, NA)
  NAs <- c(1, 3, 5, 8)
  x2 <- dkbinom(x, c(4, 7), c(0.2, 0.7))
  expect_true(all(is.na(x2[NAs])))

  # Test for both
  x <- c(-20, 0, NA, 1.5, NA, 3, 11, 12)
  NAs <- c(3, 5)
  zero <- c(1, 4, 8)
  x3 <- dkbinom(x, c(5, 6), c(0.1, 0.6))
  expect_true(all(x3[zero] == 0))
  expect_true(all(is.na(x3[NAs])))
  
})

test_that("dkbinom() and pkbinom() agree at x = q = 0", {

  x1 <- dkbinom(0, c(10, 15, 17), c(0.3, 0.7, 0.5))
  x2 <- pkbinom(0, c(10, 15, 17), c(0.3, 0.7, 0.5))
  expect_equal(x1, x2, tol = 1e-12)
    
  x3 <- dkbinom(0, c(20, 10, 15, 17), c(0.05, 0.02, 0.07, 0.1))
  x4 <- pkbinom(0, c(20, 10, 15, 17), c(0.05, 0.02, 0.07, 0.1))
  expect_equal(x3, x4, tol = 1e-12)
    
})

test_that("dkbinom() and pkbinom() agree generally", {

  x1 <- dkbinom(0:14, c(5, 7, 2), c(0.4, 0.1, 0.5))
  x2 <- pkbinom(0:14, c(5, 7, 2), c(0.4, 0.1, 0.5))

  x1.compare <- c(x2[1], diff(x2))

  expect_equal(x1, x1.compare, tol = 1e-12)

  
  x3 <- dkbinom(0:100, c(50, 35, 15), c(0.1, 0.7, 0.2))
  x4 <- pkbinom(0:100, c(50, 35, 15), c(0.1, 0.7, 0.2))

  x3.compare <- c(x4[1], diff(x4))

  expect_equal(x3, x3.compare, tol = 1e-12)

})

test_that("errors and warnings for dkbinom() and pkbinom() work as expected", {

  expect_error(pkbinom("3", c(3, 4, 2), c(0.3, 0.5, 0.8)), "'q' must be numeric")
  
  expect_error(dkbinom("3", c(3, 4, 2), c(0.3, 0.5, 0.8)), "'x' must be numeric")

  expect_error(dkbinom("3", c(3, 4, 2), c(0.3, 0.5, 0.8)), "dkbinom(", fixed = TRUE)

  expect_error(pkbinom("3", c(3, 4, 2), c(0.3, 0.5, 0.8)), "pkbinom(", fixed = TRUE)

  expect_error(dkbinom(3, c(3.5, 4, 2), c(0.3, 0.5, 0.8)), "'size' must be a vector")

  expect_error(dkbinom(3, c(0, 4, 2), c(0.3, 0.5, 0.8)), "'size' must be a vector")
  
  expect_error(dkbinom(3, "size", c(0.3, 0.5, 0.8)), "'size' must be a vector")
  
  expect_error(dkbinom(3, c(5, 4, 2), c(-0.3, 0.5, 0.8)), "'prob' must be a vector")

  expect_error(dkbinom(3, c(5, 4, 2), "prob"), "'prob' must be a vector")

  expect_error(dkbinom(3, c(5, 4, 2), c(0.3, 0.5, 1.8)), "'prob' must be a vector")

  expect_error(dkbinom(3, c(5, 4), c(0.3, 0.5, 1)), "be the same length")

  expect_error(dkbinom(3, 4, 0.5, log = "this"), "'log' must be")

  expect_error(pkbinom(3, 4, 0.5, log.p = 8), "'log.p' must be")
  
  expect_error(pkbinom(3, 4, 0.5, log.p = c(FALSE, TRUE)), "'log.p' must be")

  expect_error(dkbinom(3, 4, 0.5, verbose = "this"), "'verbose' must be")

  expect_error(pkbinom(3, 4, 0.5, verbose = 8), "'verbose' must be")
  
  expect_error(pkbinom(3, 4, 0.5, verbose = c(FALSE, TRUE)), "'verbose' must be")

  expect_warning(pkbinom(c(4, 5), c(10, 11), c(0.5, 0.6), method = "n"), "is only implemented for a single value")
    
})
