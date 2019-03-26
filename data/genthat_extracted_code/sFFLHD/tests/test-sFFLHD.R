context("basic sFFLHD test")

test_that("Is LHD", {
  s <- sFFLHD$new(D=2,L=3)
  s$get.batches(3)
  Xint <- floor(9 * s$Xb)
  is_lhd <- apply(Xint, 2, function(colm) {all(sort(colm) == 0:8)})
  expect_true(all(is_lhd))
})

test_that("seed works", {
  s <- sFFLHD$new(D=2,L=3, seed=123)
  s$get.batches(3)
  sb <- s$get.batch()

  t <- sFFLHD$new(D=2,L=3, seed=123)
  t$get.batches(3)
  runif(100)
  tb <- t$get.batch()
  expect_equal(t$seed, 127)

  expect_equal(sb, tb)
})

test_that("Errors", {
  expect_error(sFFLHD$new()$get.batch())
  expect_error(sFFLHD$new(D=2)$get.batch())
  expect_error(sFFLHD$new(L=3)$get.batch())
  # expect_error(sFFLHD$new(D=1, L=3)$get.batch()) # 1D now works
})

test_that("1D works", {
  s <- sFFLHD(D=1, L=4)
  b1 <- s$get.batch()
  expect_equal(sort(floor(b1*4)), 0:3)
  b2 <- s$get.batches.to.golden()
  expect_equal(sort(floor(b2[9:12]*4)), 0:3)
  expect_equal(sort(floor(c(c(b1),c(b2))*16)), 0:15)

  s <- sFFLHD(D=1, L=7)
  b1 <- s$get.batch()
  expect_equal(sort(floor(b1*7)), 0:6)
  b2 <- s$get.batches.to.golden()
  expect_equal(sort(floor(b2[36:42]*7)), 0:6)
  expect_equal(sort(floor(c(c(b1),c(b2))*49)), 0:48)
})

test_that("a is set correctly", {

  s <- sFFLHD$new(D=2, L=9)
  s$get.batch()
  expect_equal(s$a, 3)

  s <- sFFLHD$new(D=2, L=6)
  s$get.batch()
  expect_equal(s$a, 6)

  s <- sFFLHD$new(D=2, L=8)
  s$get.batch()
  expect_equal(s$a, 2)
})

test_that("get.batches", {

  s <- sFFLHD$new(D=2, L=8)
  tm <- s$get.batches(5)
  expect_equal(dim(tm), c(40,2))
})

test_that("get.batches.to.golden", {

  s <- sFFLHD$new(D=2, L=3)
  s$get.batch()
  tm <- s$get.batches.to.golden()
  expect_equal(dim(tm), c(6,2))
  tm2 <- s$get.batches.to.golden()
  expect_equal(dim(tm2), c(72,2))


  # Check that I can do golden first
  s <- sFFLHD$new(D=2, L=3)
  tm <- s$get.batches.to.golden()
  expect_equal(dim(tm), c(9,2))
  tm2 <- s$get.batches.to.golden()
  expect_equal(dim(tm2), c(72,2))

})

test_that("Extreme errors", {
  s <- sFFLHD$new(D=2, L=3)
  s$get.batch()
  s$stage <- 4L
  expect_error(s$get.batch())
  expect_error(sFFLHD(D=11, L=7, a=2.3)$get.batch())
  expect_error(sFFLHD(D=2, L=3.3)$get.batch())
  expect_error(sFFLHD(D=2.01, L=3)$get.batch())
  expect_error(sFFLHD(D=2, L=8, a=4)$get.batch())
})

test_that("No OAs", {
  expect_error(sFFLHD(D=13, L=3)$get.batch())
  expect_error(sFFLHD(D=11, L=7)$get.batch())
})
