################################################################################

context("REDUCE_PRIME")

################################################################################

code1 <- 1
code2 <- c(0, 1)
code3 <- c(0, 0, 1)
code4 <- c(0, 0, 0, 1)
code100 <- c(rep(0, 99), 1)

################################################################################

test_that("Check some results without out.summary", {
  expect_equal(ReducePrime(code1), 0)
  expect_equal(ReducePrime(code2), code2)
  expect_equal(ReducePrime(code3), code3)
  expect_equal(ReducePrime(code4), c(0, 2, 0, 0))
  expect_equal(ReducePrime(code100), c(0, 2, 0, 0, 2, rep(0, 95)))
})

################################################################################

test_that("Check 100! with the sum of all until 100", {
  compare <- integer(100)
  for (i in 1:100) {
    tmpcode <- integer(100)
    tmpcode[i] <- 1
    compare = compare + ReducePrime(tmpcode)
  }
  code100fact <- rep(1, 100)
  expect_equal(ReducePrime(code100fact), compare)
})

################################################################################

test_that("Compare with primes.div given", {
  code50fact <- rep(1, 50)
  primes.div <- AllPrimesUpTo(floor(sqrt(length(code50fact))))
  expect_equal(ReducePrime(code50fact, primes.div = primes.div),
               ReducePrime(code50fact))
})

################################################################################

test_that("Test with out.summary", {
  expect_equal(ReducePrime(code1, out.summary = TRUE),
               rbind(primes = integer(0), power = integer(0)))
  expect_equal(ReducePrime(code2, out.summary = TRUE),
               rbind(primes = 2, power = 1))
  expect_equal(ReducePrime(code3, out.summary = TRUE),
               rbind(primes = 3, power = 1))
  expect_equal(ReducePrime(code4, out.summary = TRUE),
               rbind(primes = 2, power = 2))
  expect_equal(ReducePrime(code100, out.summary = TRUE),
               rbind(primes = c(2, 5), power = c(2, 2)))
})

################################################################################
