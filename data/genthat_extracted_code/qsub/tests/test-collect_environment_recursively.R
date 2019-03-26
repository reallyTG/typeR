context("Check collect_environment_recursively")


hi <- "bcuiwcuow"

test_that("Check whether collect_environment_recursively works", {
  collect <- as.list(qsub:::collect_environment_recursively(environment(), "hi"))
  expect_equal(collect$hi, hi)

})
