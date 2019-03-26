context("AUC")

test_that("Toy example with ties", {
  group <- c(0,0,0,0,0,1,1,1,1,1)
  marker <- c(0.442, 0.571, 0.641, 0.641, 1.785, 0.543, 0.571, 0.666, 1.666, 1.666)
  toy.example.ties.data <-data.frame(marker,group)
  my.auc <- calculate.empirical.AUC(data = toy.example.ties.data, marker = "marker", status = "group", tag.healthy = 0)
  expect_equal(my.auc, 0.4*0.6+(0.6+0.8)*0.2/2+0.2*1)
})

test_that("Melanoma example without ties", {
  data(melanoma)
  pred <- prediction(melanoma$X, melanoma$group)
  ROCR.auc <- performance(pred, "auc")@y.values[[1]]
  my.auc <- calculate.empirical.AUC(data = melanoma, marker = "X", status = "group", tag.healthy = 0)
  expect_equal(my.auc, ROCR.auc)
})

test_that("Prostate example with ties", {
  data(prostate)
  pred <- prediction(prostate$marker, prostate$status)
  ROCR.auc <- performance(pred, "auc")@y.values[[1]]
  my.auc <- calculate.empirical.AUC(data = prostate, marker = "marker", status = "status", tag.healthy = 0)
  expect_equal(my.auc, ROCR.auc)
})

test_that("Coronary artery example with ties", {
  data(elastase)
  pred <- prediction(elastase$elas, elastase$status)
  ROCR.auc <- performance(pred, "auc")@y.values[[1]]
  my.auc <- calculate.empirical.AUC(data = elastase, marker = "elas", status = "status", tag.healthy = 0)
  expect_equal(my.auc, ROCR.auc)
})