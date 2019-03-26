context("acc_usage_methods_tests")
SLAccount <- account()

test_that("canGetRealTimeJobActivity", {
  jobAct<- getRealTimeJobActivity(SLAccount, "seleniumPipes")
  expect_identical(jobAct$concurrency$self$username, "seleniumPipes")
})

test_that("canGetUserActivity", {
  userAct <- getUserActivity(SLAccount, "seleniumPipes")
  expect_identical(userAct$subaccounts$testUser12367$all, 0L)
}
)

test_that("canGetAccountUsage", {
  actUsage <- getUserAccountUsage(SLAccount, "seleniumPipes")
  expect_gt(actUsage[,sum(no_of_jobs)], 0L)
}
)
