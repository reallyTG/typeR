context("Test StratifiedPartition")

fakeProjectId <- "project-id"
fakeProject <- list(projectName = "FakeProject",
                    projectId = fakeProjectId,
                    fileName = "fake.csv",
                    created = "faketimestamp")
fakeTarget <- "fake-target"

test_that("Required parameters are present", {
  expect_error(CreateStratifiedPartition())
  expect_error(CreateStratifiedPartition(validationType = "CV"))
})

test_that("validationType = 'CV' option", {
  expect_error(CreateStratifiedPartition(validationType = "CV",
                                         holdoutPct = 20),
                                         "reps must be specified")
  ValidCase <- CreateStratifiedPartition(validationType = "CV",
                                         holdoutPct = 20, reps = 5)
  expect_equal(length(ValidCase), 4)
  expect_equal(ValidCase$cvMethod, "stratified")
  expect_equal(ValidCase$validationType, "CV")
  expect_equal(ValidCase$holdoutPct, 20)
  expect_equal(ValidCase$reps, 5)
})

test_that("validationType = 'TVH' option", {
  expect_error(CreateStratifiedPartition(validationType = "TVH",
                                         holdoutPct = 20),
                                         "validationPct must be specified")
  ValidCase <- CreateStratifiedPartition(validationType = "TVH",
                                         holdoutPct = 20,
                                         validationPct = 16)
  expect_equal(length(ValidCase), 4)
  expect_equal(ValidCase$cvMethod, "stratified")
  expect_equal(ValidCase$validationType, "TVH")
  expect_equal(ValidCase$holdoutPct, 20)
  expect_equal(ValidCase$validationPct, 16)
})


test_that("validationType = 'CV' option can be used to SetTarget", {
  with_mock("GetProjectStatus" = function(...) { list("stage" = "aim") },
            "datarobot::DataRobotPATCH" = function(...) {
              list(...) # Resolve params to test that they pass without error
            },
            "datarobot::WaitForAsyncReturn" = function(...) { "How about not" }, {
    stratifiedPartition <- CreateStratifiedPartition(validationType = "CV",
                                                     holdoutPct = 20,
                                                     reps = 5)
    SetTarget(project = fakeProject,
              target = fakeTarget,
              partition = stratifiedPartition)
  })
})

test_that("validationType = 'TVH' option can be used to SetTarget", {
  with_mock("GetProjectStatus" = function(...) { list("stage" = "aim") },
            "datarobot::DataRobotPATCH" = function(...) {
              list(...) # Resolve params to test that they pass without error
            },
            "datarobot::WaitForAsyncReturn" = function(...) { "How about not" }, {
    stratifiedPartition <- CreateStratifiedPartition(validationType = "TVH",
                                                     holdoutPct = 20,
                                                     validationPct = 16)
    SetTarget(project = fakeProject,
              target = fakeTarget,
              partition = stratifiedPartition)
  })
})


test_that("Invalid validationType returns message", {
  expect_error(CreateStratifiedPartition(validationType = "XYZ",
                                         holdoutPct = 20,
                                         validationPct = 16))
})
