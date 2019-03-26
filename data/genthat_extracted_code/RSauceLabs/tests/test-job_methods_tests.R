context("job_methods_tests")
SLAccount <- account()

test_that("canGetJobsBasic", {
  jobs <- getJobs(SLAccount, "seleniumPipes", limit = 10L)
  expect_equal(length(jobs$data$id), 10L)
})

test_that("canGetJobsFull", {
  jobs <- getJobs(SLAccount, "seleniumPipes", limit = 10L, getFullJobs = TRUE)
  expect_equal(sum(c("browser", "passed") %in% names(jobs$data)), 2L)
})

test_that("canUpdateJob", {
  jobs <- getJobs(SLAccount, "seleniumPipes", limit = 10L, getFullJobs = TRUE)
  # use first job
  appJob <- jobs$data[1,]
  appJob$passed <- ifelse(is.na(appJob$passed), FALSE, appJob$passed)
  build <- ifelse(identical(appJob$passed,"someBuild"), "someBuild1", "someBuild")
  newData <- updateJob(SLAccount, username = "seleniumPipes", jobID = appJob$id,
                       name = "newName", passed = !appJob$passed
                       , build = build)
  expect_identical(appJob$passed, !newData$passed)
  expect_false(appJob$name == newData$name)
  expect_identical(newData$name, "newName")
  expect_false(identical(appJob$build, newData$build))
  expect_identical(newData$build, "someBuild")
  oldData <- updateJob(SLAccount, username = "seleniumPipes", jobID = appJob$id,
                       name = appJob$name, passed = appJob$passed, build = appJob$build)
}
)

test_that("canStopJob", {
  jobs <- getJobs(SLAccount, "seleniumPipes", limit = 10L)
  # use first job
  appJob <- jobs$data[1,]
  sJob <- stopJob(SLAccount, "seleniumPipes", appJob$id)
  expect_identical(appJob$id, sJob$id)
}
)

test_that("canGetJobAssets", {
  jobs <- getJobs(SLAccount, "seleniumPipes", limit = 10L)
  # use first job
  appJob <- jobs$data[1,]
  jobAssets <- getJobAssetNames(SLAccount, "seleniumPipes", appJob$id)
}
)

test_that("canGetJobAssetFiles", {
  jobs <- getJobs(SLAccount, "seleniumPipes", limit = 10L)
  # use first job
  appJob <- jobs$data[1,]
  print(appJob)
  selLog <- getJobAssetFiles(SLAccount, username = "seleniumPipes", jobID = appJob$id)
}
)
