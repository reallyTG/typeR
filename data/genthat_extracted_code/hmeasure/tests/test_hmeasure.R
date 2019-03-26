context("Performance metrics behave reasonably")

n = 10
ground_truth = c(rep(0, 10), rep(1, 10)) # create labels
# initialise two sets of scores that classify perfectly
sA = ground_truth
sB = ground_truth
# noise up the first set of scores a little
sA[9:12] = 0.5
# noise up the second set of scores a lot more
sB[6:15] = 0.5
scores = data.frame(A=sA, B=sB)
metrics = HMeasure(ground_truth, scores)$metrics

test_that("Classifier A is better than B", {
  expect_true(metrics$AUC[1] >= metrics$AUC[2])
  expect_true(metrics$AUCH[1] >= metrics$AUCH[2])
  expect_true(metrics$H[1] >= metrics$H[2])
  expect_true(metrics$MER[1] <= metrics$H[2])
})
