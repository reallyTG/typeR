context("PoissonLoss")

test_that("PoissonLoss(seg.mean=0, count=0) == 0", {
  expect_equal(PoissonLoss(0, 0), 0)
})

test_that("PoissonLoss(seg.mean=0, count>0) == Inf", {
  expect_equal(PoissonLoss(1, 0), Inf)
})

test_that("PoissonLoss(seg.mean<0) undefined", {
  expect_error({
    PoissonLoss(2, -2)
  }, "PoissonLoss undefined for negative segment mean")
})

test_that("PoissonLoss(weight<0) undefined", {
  expect_error({
    PoissonLoss(2, 2, -2)
  }, "PoissonLoss undefined for negative weight")
})

test_that("PoissonLoss(count=2.5) is 0", {
  expect_equal(PoissonLoss(2.5, 2), Inf)
})

test_that("PoissonLoss(count= -2) is 0", {
  expect_equal(PoissonLoss(-2, 2), Inf)
})

test_that("PoissonLoss(count=1 or 0) == -dpois(log=TRUE)", {
  expect_equal(PoissonLoss(1, 2.4), -dpois(1, 2.4, log=TRUE))
  expect_equal(PoissonLoss(0, 2.4), -dpois(0, 2.4, log=TRUE))
})

test_that("PoissonLoss(seg.mean=scalar, count=vector) is fine", {
  expect_equal(PoissonLoss(c(1, 0), 2.4),
               -sum(dpois(c(1, 0), 2.4, log=TRUE)))
  expect_equal(PoissonLoss(c(1, 0), 2.4),
               -sum(dpois(c(1, 0), 2.4, log=TRUE)))
})

test_that("PoissonLoss(seg.mean=2-vector, count=3-vector) is an error", {
  expect_error({
    PoissonLoss(c(2.4, 1.2), c(1, 0, 2))
  })
})
