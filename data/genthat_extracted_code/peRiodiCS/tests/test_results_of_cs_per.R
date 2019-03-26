context("Test results of cs_per() function")

# generate results to test
cs.per_result1 <- cs_per(x = seq(0, 1, by = 0.001), knots = 5)
cs.per_result2 <- cs_per(seq(0, 1, by = 0.001), knots = 8)
set.seed(12345) # set seed for reproducible result - set.seed(12345)
cs.per_result3 <- cs_per(runif(1000), knots = 5)

# save only once - at time of generating tests
# saveRDS(cs.per_result1, file = "./tests/testthat/cs.per_result1.rds")
# saveRDS(cs.per_result2, file = "./tests/testthat/cs.per_result2.rds")
# saveRDS(cs.per_result3, file = "./tests/testthat/cs.per_result3.rds")

test_that("cs.per_result1 is as expected", {
  expect_equal_to_reference(cs.per_result1, file = "cs.per_result1.rds")
})

test_that("cs.per_result2 is as expected", {
  expect_equal_to_reference(cs.per_result2, file = "cs.per_result2.rds")
})

test_that("cs.per_result3 is as expected", {
  expect_equal_to_reference(cs.per_result3, file = "cs.per_result3.rds")
})