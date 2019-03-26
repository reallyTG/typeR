context("PRIMES")

test_that("Errors when n is not an positive integer", {
  expect_error(IsPrime(0))
  expect_error(IsPrime(-2))
  expect_error(IsPrime(3.5))
  expect_error(AllPrimesUpTo(0))
  expect_error(AllPrimesUpTo(-2))
  expect_error(AllPrimesUpTo(3.5))
})

test_that("Check AllPrimesUpTo with IsPrime", {
  n <- 1000
  primes <- AllPrimesUpTo(n)
  no.primes <- setdiff(1:n, primes)
  for (p in primes) {
    expect_true(IsPrime(p))
  }
  for (np in no.primes) {
    expect_false(IsPrime(np))
  }
})

test_that("Check AllPrimesUpTo for n = {0, 1, 2}", {
  expect_equal(AllPrimesUpTo(1), integer(0))
  expect_equal(AllPrimesUpTo(2), 2L)
  expect_equal(AllPrimesUpTo(3), c(2L, 3L))
})
