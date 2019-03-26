context("Plot Function")

object_hrm <- HRM::hrm_test(value ~ group*dimension, subject = "subject", data = EEG)
object_hrm2 <- HRM::hrm_test(value ~ dimension, subject = "subject", data = EEG)


test_that("function plot", {
  expect_equivalent(class(object_hrm), "HRM")
  expect_equivalent(class(object_hrm2), "HRM")
  expect_equivalent(class(plot(object_hrm)), c("gg", "ggplot"))
  expect_equivalent(class(plot(object_hrm2)), c("gg", "ggplot"))
  expect_equivalent(class(plot(object_hrm2)), c("gg", "ggplot"))
  expect_equivalent(class(plot(object_hrm, xlab = "time", ylab = "mean", legend = FALSE,
                               legend.title = "", theme_bw() + theme(legend.title = element_blank(), legend.position="none"))
  ), c("gg", "ggplot"))
})