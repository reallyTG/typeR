context("sFFLHDmm test")

test_that("sFFLHDmm works", {
  s <- sFFLHDmm$new(D=2,L=3)
  expect_is(s, "sFFLHDmm")
  b1 <- s$get.batch()
  expect_is(b1, "matrix")
  expect_equal(dim(b1), c(3, 2))
  b2 <- s$get.batches(2)
  expect_is(b2, "matrix")
  expect_equal(dim(b2), c(6, 2))
  b12 <- rbind(b1, b2)
  is_lhd <- apply(floor(9*b12), 2, function(colm) {all(sort(colm) == 0:8)})
  expect_true(all(is_lhd))
})

test_that("sFFLHD Xchoices are right", {
  s <- sFFLHDmm$new(D=2,L=3)
  b1 <- s$get.batch()
  expect_is(s$Xchoices, "list")
  expect_equal(length(s$Xchoices), 0)

  b2 <- s$get.batch()
  expect_is(s$Xchoices, "list")
  expect_equal(length(s$Xchoices), 1)
  expect_is(s$Xchoices[[1]], "matrix")
  expect_equal(dim(s$Xchoices[[1]]), c(3,2))

  b34 <- s$get.batches(2)
  expect_is(s$Xchoices, "list")
  expect_equal(length(s$Xchoices), 23)
  expect_is(s$Xchoices[[11]], "matrix")
  expect_equal(dim(s$Xchoices[[1]]), c(3,2))
})
