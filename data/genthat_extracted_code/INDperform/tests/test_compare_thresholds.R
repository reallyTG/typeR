context("test thresh_gam")

press2 <- ind_init_ex$press_train[[1]]
nthd <- length(press2)
lower <- stats::quantile(press2, prob = 0.2, na.rm = TRUE)
upper <- stats::quantile(press2, prob = 0.8, na.rm = TRUE)
t_val <- seq(from = lower, to = upper, by = (upper -
  lower)/nthd)  #steps 'even'
test <- compare_thresholds(t_val, press2)

x <- min(which(test$change == FALSE))

test_that("test compare_thresholds", {
  # test colclasses
  expect_is(test$change, "logical")
  expect_is(test$t_val, "numeric")
  # first one has to be TRUE!
  expect_true(test$change[1])
  # same values for press2 with x and x-1 --> no
  # change duo to different threshold
  expect_equal(press2[press2 < test$t_val[x]], press2[press2 <
    test$t_val[x - 1]])
})
