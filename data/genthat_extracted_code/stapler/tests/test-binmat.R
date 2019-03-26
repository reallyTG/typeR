test_that("Staple binary matrix", {
  suppressWarnings(RNGversion("3.5.0"))
  set.seed(20171120)
  n = 5
  r = 1000
  sens = c(0.8, 0.9, 0.8, 0.5, 0.8)
  spec = c(0.9, 0.75, 0.99, 0.98, 0.92)
  n_1 = 200
  n_0 = r - n_1
  truth = c(rep(0, n_0), rep(1, n_1))
  pred_1 = rbinom(n = n, size = n_1, prob = sens)
  pred_0 = rbinom(n = n, size = n_0, prob = spec)
  pred_0 = sapply(pred_0, function(n) {
    sample(c(rep(0, n), rep(1, n_0 - n)))
  })
  pred_1 = sapply(pred_1, function(n) {
    sample(c(rep(1, n), rep(0, n_1 - n)))
  })
  pred = rbind(pred_0, pred_1)
  true_sens = colMeans(pred[ truth == 1, ])
  true_spec = colMeans(1 - pred[ truth == 0, ])
  x = t(pred)

  # need test for getRversion() >= numeric_version("3.6.0")
  expect_message({res = staple_bin_mat(x)})
  expect_equal(res$sensitivity, c(0.741808211133125, 0.856147018471266,
                                  0.788254106963426, 0.320686380642557,
                                  0.716769357165729))
  expect_equal(res$specificity, c(0.72057091199614, 0.365912614140717,
                                  0.986925344040976, 0.935190213099036,
                                  0.801345660831361))
  table(res$label, truth)
  accuracy = mean(res$label == truth)
  expect_equal(accuracy, 0.981)

  expect_silent({
    res2 = staple_bin_mat(x, prior = rep(0.5, r),
                         verbose = FALSE)
  })
  expect_equal(res2$sensitivity,
               c(0.650871843714839, 0.723444998919003,
                 0.603650062308871, 0.256381743290724,
                 0.631512689774438)
  )
  expect_equal(res2$specificity,
               c(0.743603219845167, 0.306249452178814,
                 0.999999999844062, 0.936829464387461,
                 0.840374092685984)
  )
  table(res2$label, truth)

  #######################################
  # Given only 2 classes - should give same
  #######################################
  expect_message({
    multi_res = staple_multi_mat(x)
  })
  expect_equal(res$label*1, multi_res$label)
  expect_equal(res$sensitivity, multi_res$sensitivity[, "1"])
  expect_equal(res$specificity, multi_res$specificity[, "1"])



})
