context("Check function related to Kendall random walk simulations")

kendall_rw <- simulate_kendall_rw(10, 100, runif, 0.75)
scaled_kendall <- transform_kendall_rw(kendall_rw, (1:100)^(-1/0.75))

symmetric_kendall_rw <- simulate_kendall_rw(10, 100, rnorm, 0.25, symmetric = T)
scaled_symmetric <- transform_kendall_rw(symmetric_kendall_rw, (1:100)^(-1/0.25))

summ <- summarise_kendall_rw(symmetric_kendall_rw, length)

testthat::test_that("Objects have the rights class", {
  testthat::expect_is(kendall_rw, "kendall_simulation")
  testthat::expect_is(scaled_kendall, "kendall_simulation")
  testthat::expect_is(scaled_kendall$simulation, "tbl_df")
})

testthat::test_that("Number of simulations and observations is correct", {
  testthat::expect_equal(max(kendall_rw$simulation$sim_id), 10)
  testthat::expect_equal(nrow(kendall_rw$simulation), 10*100)
})

testthat::test_that("R.W. on positive half-line is positive, symmetric is not", {
  testthat::expect_equal(all(kendall_rw$simulation$sim >= 0), TRUE)
  testthat::expect_equal(any(symmetric_kendall_rw$simulation$sim < 0), TRUE)
})

testthat::test_that("Scaling does the right thing", {
  testthat::expect_equal(any(kendall_rw$simulation$sim != scaled_kendall$simulation$sim), TRUE)
  testthat::expect_equal(scaled_kendall$simulation$sim/rep((1:100)^(-1/0.75), times = 10), kendall_rw$simulation$sim)
})


testthat::test_that("S3 methods are fine", {
  testthat::expect_silent(plot(symmetric_kendall_rw))
  testthat::expect_silent(plot(symmetric_kendall_rw, level = 100))
  testthat::expect_output(print(symmetric_kendall_rw))
  testthat::expect_silent(plot(symmetric_kendall_rw, max_x = 100))
  testthat::expect_silent(plot(symmetric_kendall_rw, max_id = 1))
  testthat::expect_silent(plot(summ, type = "density"))
  testthat::expect_silent(plot(summ, type = "histogram"))
  testthat::expect_silent(plot(summ, type = "boxplot"))
  testthat::expect_output(print(summ))
})

testthat::test_that("Summary/mutate function does the right thing", {
  testthat::expect_equal(unique(summ$aggregated), 100)
  testthat::expect_silent(mutate_kendall_rw(symmetric_kendall_rw, function(x) x^2))
  testthat::expect_is(mutate_kendall_rw(symmetric_kendall_rw, function(x) x^2, F), "kendall_simulation")
})

