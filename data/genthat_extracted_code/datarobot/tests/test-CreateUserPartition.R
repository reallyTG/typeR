context("Test CreateUserPartition")

fakeProjectId <- "project-id"
fakeProject <- list(projectName = "FakeProject",
                    projectId = fakeProjectId,
                    fileName = "fake.csv",
                    created = "faketimestamp")
fakeTarget <- "fake-target"

test_that("Required parameters are present", {
  expect_error(CreateUserPartition())
  expect_error(CreateUserPartition(validationType = "CV"))
  expect_error(CreateGroupPartition(validationType = "CV", userPartitionCol = 5))
  expect_error(CreateGroupPartition(validationType = "CV", userPartitionCol = list()))
})

test_that("validationType = 'CV' option with holdout", {
  ValidCase <- CreateUserPartition(validationType = "CV",
                                   userPartitionCol = "TVHflag",
                                   cvHoldoutLevel = "H")
  expect_equal(length(ValidCase), 4)
  expect_equal(ValidCase$cvMethod, "user")
  expect_equal(ValidCase$validationType, "CV")
  expect_equal(ValidCase$userPartitionCol, "TVHflag")
  expect_equal(ValidCase$cvHoldoutLevel, "H")
})

test_that("validationType = 'CV' option explicit without holdout", {
  ValidCase <- CreateUserPartition(validationType = "CV",
                                   userPartitionCol = "TVHflag",
                                   cvHoldoutLevel = NA)
  expect_equal(length(ValidCase), 4)
  expect_equal(ValidCase$cvMethod, "user")
  expect_equal(ValidCase$validationType, "CV")
  expect_equal(ValidCase$userPartitionCol, "TVHflag")
  expect_equal(ValidCase$cvHoldoutLevel, NA)
})

test_that("validationType = 'CV' option implicit without holdout", {
  ValidCase <- CreateUserPartition(validationType = "CV",
                                   userPartitionCol = "TVHflag")
  expect_equal(length(ValidCase), 4)
  expect_equal(ValidCase$cvMethod, "user")
  expect_equal(ValidCase$validationType, "CV")
  expect_equal(ValidCase$userPartitionCol, "TVHflag")
  expect_equal(ValidCase$cvHoldoutLevel, NA)
})

test_that("validationType = 'TVH' option", {
  expect_error(CreateUserPartition(validationType = "TVH",
                                   userPartitionCol = "TVHflag"),
               "trainingLevel must be specified")
  expect_error(CreateUserPartition(validationType = "TVH",
                                   userPartitionCol = "TVHflag",
                                   trainingLevel = "T",
                holdoutLevel = "H"), "validationLevel must be specified")
  ValidCase <- CreateUserPartition(validationType = "TVH",
                                   userPartitionCol = "TVHflag",
                                   trainingLevel = "T",
                                   holdoutLevel = "H",
                                   validationLevel = "V")
  expect_equal(length(ValidCase), 6)
  expect_equal(ValidCase$cvMethod, "user")
  expect_equal(ValidCase$validationType, "TVH")
  expect_equal(ValidCase$userPartitionCol, "TVHflag")
  expect_equal(ValidCase$trainingLevel, "T")
  expect_equal(ValidCase$holdoutLevel, "H")
  expect_equal(ValidCase$validationLevel, "V")
  CreateUserPartition(validationType = "TVH",
                      userPartitionCol = "TVHflag",
                      trainingLevel = "T",
                      validationLevel = "V")
})


test_that("validationType = 'CV' option can be used to SetTarget", {
  with_mock("GetProjectStatus" = function(...) { list("stage" = "aim") },
            "datarobot::DataRobotPATCH" = function(...) {
              list(...) # Resolve params to test that they pass without error
            },
            "datarobot::WaitForAsyncReturn" = function(...) { "How about not" }, {
    userPartition <- CreateUserPartition(validationType = "CV",
                                         userPartitionCol = "TVHflag",
                                         trainingLevel = "T",
                                         holdoutLevel = "H",
                                         validationLevel = "V")
    SetTarget(project = fakeProject,
              target = fakeTarget,
              partition = userPartition)
  })
})

test_that("validationType = 'TVH' option can be used to SetTarget", {
  with_mock("GetProjectStatus" = function(...) { list("stage" = "aim") },
            "datarobot::DataRobotPATCH" = function(...) {
              list(...) # Resolve params to test that they pass without error
            },
            "datarobot::WaitForAsyncReturn" = function(...) { "How about not" }, {
    userPartition <- CreateUserPartition(validationType = "TVH",
                                         userPartitionCol = "TVHflag",
                                         trainingLevel = "T",
                                         holdoutLevel = "H",
                                         validationLevel = "V")
    SetTarget(project = fakeProject,
              target = fakeTarget,
              partition = userPartition)
  })
})

test_that("Invalid validationType returns message", {
  expect_error(CreateUserPartition(validationType = "XYZ",
                                   userPartitionCol = "TVHflag"),
               "not valid")
})
