context("Test results of rcs_per() function")

# generate results to test
rcs.per_result1 <- rcs_per(seq(0, 1, by = 0.001), nk = 5)
rcs.per_result2 <- rcs_per(seq(0, 1, by = 0.001), nk = 8)
set.seed(12345) # set seed for reproducible result - set.seed(12345)
rcs.per_result3 <- rcs_per(runif(1000), nk = 5)

# save only once - at time of generating tests
# saveRDS(rcs.per_result1, file = "./tests/testthat/rcs.per_result1.rds")
# saveRDS(rcs.per_result2, file = "./tests/testthat/rcs.per_result2.rds")
# saveRDS(rcs.per_result3, file = "./tests/testthat/rcs.per_result3.rds")

test_that("rcs.per_result1 is as expected", {
  expect_equal_to_reference(rcs.per_result1, file = "rcs.per_result1.rds")
})

test_that("rcs.per_result2 is as expected", {
  expect_equal_to_reference(rcs.per_result2, file = "rcs.per_result2.rds")
})

test_that("rcs.per_result3 is as expected", {
  expect_equal_to_reference(rcs.per_result3, file = "rcs.per_result3.rds")
})