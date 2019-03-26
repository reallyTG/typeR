context("Test CreateGroupPartition")

fakeProjectId <- "project-id"
fakeProject <- list(projectName = "FakeProject",
                    projectId = fakeProjectId,
                    fileName = "fake.csv",
                    created = "faketimestamp")
fakeTarget <- "fake-target"


test_that("Required parameters are present", {
  expect_error(CreateGroupPartition())
  expect_error(CreateGroupPartition(validationType = "CV"))
  expect_error(CreateGroupPartition(validationType = "CV", holdoutPct = 20))
  expect_error(CreateGroupPartition(validationType = "CV", holdoutPct = 20, partitionKeyCols = 5))
  expect_error(CreateGroupPartition(validationType = "CV", holdoutPct = 20,
                                    partitionKeyCols = "tax"))
})

test_that("partitionKeyCols must be length-1 list", {
  expect_error(CreateGroupPartition(validationType = "CV", holdoutPct = 20,
                                    partitionKeyCols = "tax",
                                    reps = 5),
               "Please specify partition column name as a list containing a single string.")
  expect_error(CreateGroupPartition(validationType = "CV", holdoutPct = 20,
                                    partitionKeyCols = list("tax", "other_tax"),
                                    reps = 5),
               "Currently only one partition key column is supported.")
})

test_that("validationType = 'CV' option", {
  expect_error(CreateGroupPartition(validationType = "CV", holdoutPct = 20,
                                    partitionKeyCols = list("tax")),
                "reps must be specified")
  ValidCase <- CreateGroupPartition(validationType = "CV", holdoutPct = 20,
                                    partitionKeyCols = list("tax"),
                                     reps = 5)
  expect_equal(length(ValidCase), 5)
  expect_equal(ValidCase$cvMethod, "group")
  expect_equal(ValidCase$validationType, "CV")
  expect_equal(ValidCase$holdoutPct, 20)
  expect_equal(ValidCase$partitionKeyCols, list("tax"))
  expect_equal(ValidCase$reps, 5)
})

test_that("validationType = 'TVH' option", {
  expect_error(CreateGroupPartition(validationType = "TVH", holdoutPct = 20,
                                      partitionKeyCols = list("tax")),
                                      "validationPct must be specified")
  ValidCase <- CreateGroupPartition(validationType = "TVH", holdoutPct = 20,
                                    partitionKeyCols = list("tax"),
                                    validationPct = 16)
  expect_equal(length(ValidCase), 5)
  expect_equal(ValidCase$cvMethod, "group")
  expect_equal(ValidCase$validationType, "TVH")
  expect_equal(ValidCase$holdoutPct, 20)
  expect_equal(ValidCase$partitionKeyCols, list("tax"))
  expect_equal(ValidCase$validationPct, 16)
})


test_that("validationType = 'CV' option can be used to SetTarget", {
  with_mock("GetProjectStatus" = function(...) { list("stage" = "aim") },
            "datarobot::DataRobotPATCH" = function(...) {
              list(...) # Resolve params to test that they pass without error
            },
            "datarobot::WaitForAsyncReturn" = function(...) { "How about not" }, {
    groupPartition <- CreateGroupPartition(validationType = "CV",
                                           holdoutPct = 20,
                                           partitionKeyCols = list("tax"),
                                           reps = 5)
    SetTarget(project = fakeProject,
              target = fakeTarget,
              partition = groupPartition)
  })
})

test_that("validationType = 'TVH' option can be used to SetTarget", {
  with_mock("GetProjectStatus" = function(...) { list("stage" = "aim") },
            "datarobot::DataRobotPATCH" = function(...) {
              list(...) # Resolve params to test that they pass without error
            },
            "datarobot::WaitForAsyncReturn" = function(...) { "How about not" }, {
    groupPartition <- CreateGroupPartition(validationType = "TVH",
                                           partitionKeyCols = list("tax"),
                                           holdoutPct = 20,
                                           validationPct = 16)
    SetTarget(project = fakeProject,
              target = fakeTarget,
              partition = groupPartition)
  })
})


test_that("Invalid validationType returns message", {
  expect_error(CreateGroupPartition(validationType = "XYZ", holdoutPct = 20,
                                    partitionKeyCols = list("tax"),
                                     validationPct = 16),
                                    "not valid")
})
