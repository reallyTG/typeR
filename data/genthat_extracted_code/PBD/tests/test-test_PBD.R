context("test_PBD")

test_that("PBD works", {
  pbd_sim(c(0.2,1,0.2,0.1,0.1),15)
  expect_equal(2 * 2, 4)
  res1 <- pbd_ML(
    brts = 1:10,
    initparsopt = c(4.62,4.34,0.03),
    exteq = 1,
    cond = 1)
  res2 <- pbd_ML(
    brts = 1:10,
    initparsopt = c(4.62,4.34,0.03),
    exteq = 1,
    cond = 2,
    n_l = 2,
    n_u = Inf)
  res2a <- pbd_ML(
    brts = 1:10,
    initparsopt = c(4.62,4.34,0.03),
    exteq = 1,
    cond = 2,
    n_l = 2,
    n_u = 1000)
  expect_equal(res1, res2)
  expect_equal(res2, res2a)
})
