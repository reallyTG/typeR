data(grave)
out = spscan.test(grave, nsim = 999, alpha = .8)

test_that("check accuracy for spscan.test with SatScan for grave data", {
  expect_equal(out$clusters[[1]]$locids,
               c(126, 124, 125, 132, 120, 113, 140, 141, 112, 41, 136, 30, 133, 108,
                 31, 143, 110, 139, 75))
  expect_equal(out$clusters[[1]]$coords, matrix(c(10324,4389), nrow = 1))
  expect_equal(out$clusters[[1]]$pop, 19, check.attributes = FALSE)
  expect_equal(out$clusters[[1]]$cases, 11, check.attributes = FALSE)
  expect_equal(round(out$clusters[[1]]$exp, 2), 3.99, check.attributes = FALSE)
  expect_equal(round(out$clusters[[1]]$smr, 2), 2.76, check.attributes = FALSE)
  expect_equal(round(out$clusters[[1]]$rr, 2), 3.78, check.attributes = FALSE)
  expect_equal(round(out$clusters[[1]]$loglik, 2), 7.42, check.attributes = FALSE)
  
  expect_equal(out$clusters[[2]]$locids, 
              c(66, 89, 71), check.attributes = FALSE)
  expect_equal(out$clusters[[2]]$coords, matrix(c(6934,6918), nrow = 1), check.attributes = FALSE)
  expect_equal(out$clusters[[2]]$pop, 3, check.attributes = FALSE)
  expect_equal(out$clusters[[2]]$cases, 3, check.attributes = FALSE)
  expect_equal(round(out$clusters[[2]]$exp, 2), 0.63, check.attributes = FALSE)
  expect_equal(round(out$clusters[[2]]$smr, 2), 4.77, check.attributes = FALSE)
  expect_equal(round(out$clusters[[2]]$rr, 2), 5.19, check.attributes = FALSE)
  expect_equal(round(out$clusters[[2]]$loglik, 2), 4.81, check.attributes = FALSE)
})
