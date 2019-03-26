library(stubthat)

context("Test SetTarget")

project <- list(projectName = "project for test", projectId = "56817c58c80891519c90a248",
                fileName = "my_data.csv", created = "2015-12-28T18:15:55.892525Z")
target <- "medv"
response <- "my_target"
fakeFeatureListId <- "flist-id"
fakeFeatureList <- list(projectId = project$projectId,
                        name = "FakeFeaturelist",
                        features = c("Grumpy", "Happy", "Sleepy", "Bashful",
                                     "Sneezy", "Dopey", "Doc"),
                        featurelistId = fakeFeatureListId)


# TODO: Add test that we fail appropriately when the status response includes a status
#       field that indicates failure.
# Note: That will require slightly reorganizing the tests, since at the moment
#       `withSetTargetMocks` expects the same assertions for each test.
withSetTargetMocks <- function(...) {

  # Set up stubs for PATCH and GET. We expect PATCH is called once (to request setting the target),
  # and GET is called three times:
  #  (1) get status of the async request (not done yet)
  #  (2) get status of the async request (now we're done)
  #  (3) get updated project data (we don't use this for anything, but it's part of the async
  #      workflow, so it's expected to happen)
  #
  # Note: This does not include the GET request to confirm that the project status is 'aim'
  #       (ready for target-setting), since that is mocked separately via GetProjectStatus

  fakeEndpoint <- "fake_endpoint"
  fakeToken <- "fake_token"

  patchStub <- stub(httr::PATCH)
  getStub <- stub(httr::GET)

  projectUrl <- datarobot:::UrlJoin(fakeEndpoint, "projects", project$projectId)
  aimUrl <- datarobot:::UrlJoin(projectUrl, "aim")
  statusUrl <- datarobot:::UrlJoin(fakeEndpoint, "status", "some-status")

  patchStub$onCall(1)$expects(url = aimUrl)
  patchStub$onCall(1)$returns(httr:::response(url = aimUrl,
                                              status_code = 202L,
                                              headers = list(location = statusUrl),
                                              content = raw(0)))

  getStub$onCall(1)$expects(url = statusUrl)
  getStub$onCall(1)$returns(httr:::response(url = statusUrl,
                                            status_code = 200L,
                                            content = charToRaw('{"status": "someStatus"}')))

  getStub$onCall(2)$expects(url = statusUrl)
  getStub$onCall(2)$returns(httr:::response(url = statusUrl,
                                            status_code = 303L,
                                            headers = list(location = projectUrl),
                                            content = raw(0)))

  getStub$onCall(3)$expects(url = projectUrl)
  getStub$onCall(3)$returns(httr:::response(url = projectUrl,
                                            status_code = 200L,
                                            content = raw(0)))

  with_mock("httr::PATCH" = patchStub$f,
            "httr::GET" = getStub$f,
            # Mock patch to be able to record the input so we can test against it
            "datarobot:::DataRobotPATCH" = function(routeString, addUrl, body = NULL,
                                                    returnRawResponse = FALSE, ...) {
              bodyForInspect <<- body
              datarobot:::MakeDataRobotRequest(httr::PATCH, routeString,
                                               addUrl, returnRawResponse,
                                               body = body, ...)
            },
            "datarobot:::Endpoint" = function() fakeEndpoint,
            "datarobot:::Token" = function() fakeToken,
            GetProjectStatus = function(...) list(stage = "aim"),
            ...) # Tests get injected here.
  expect_equal(patchStub$calledTimes(), 1)
  expect_equal(getStub$calledTimes(), 3)
}

test_that("Required parameters are present", {
  # TODO: Fix this.
  # (These don't use mocks and don't look for specific errors, so are likely to spuriously passs.)
  expect_error(SetTarget())
  expect_error(SetTarget(target = target))
  expect_error(SetTarget(project, target = NULL))
  expect_error(SetTarget(project, target = target, majorityDownsamplingRate = 0.9))
})


test_that("Use projectId only", {
  withSetTargetMocks({
    expect_message(SetTarget(project = project$projectId, target = target),
    "Autopilot started")
    expect_equal(as.character(bodyForInspect$target), target)
  })
})

test_that("Use full project list only", {
  withSetTargetMocks({
    expect_message(SetTarget(project = project, target = target),
    "Autopilot started")
    expect_equal(as.character(bodyForInspect$target), target)
  })
})

test_that("Use non-null metric", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, metric = "testMetric"),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$metric), "testMetric")
  })
})

test_that("Use non-null weights", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, weights = "testWeights"),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$weights), "testWeights")
  })
})

test_that("Use non-null featurelistId", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, featurelistId = fakeFeatureListId),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$featurelistId), fakeFeatureListId)
  })
})

test_that("Use non-null mode", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, mode = "testMode"),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$mode), "testMode")
  })
})

test_that("Use non-null seed", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, seed = 19),
      "Autopilot started")
    expect_equal(as.numeric(bodyForInspect$seed), 19)
  })
})

test_that("Use non-null positiveClass", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, positiveClass = "testClass"),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$positiveClass), "testClass")
  })
})

test_that("Use non-null blueprintThreshold", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, blueprintThreshold = 8),
      "Autopilot started")
    expect_equal(as.numeric(bodyForInspect$blueprintThreshold), 8)
  })
})

test_that("Use non-null responseCap", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, responseCap = 0.8),
      "Autopilot started")
    expect_equal(as.numeric(bodyForInspect$responseCap), 0.8)
  })
})

test_that("Use non-null downsampling", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target,
                smartDownsampled = TRUE, majorityDownsamplingRate = 0.9),
      "Autopilot started")
    expect_true(as.logical(bodyForInspect$smartDownsampled))
    expect_equal(as.numeric(bodyForInspect$majorityDownsamplingRate), 0.9)
  })
})

test_that("Use non-null scaleoutModelingMode", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target,
                scaleoutModelingMode = ScaleoutModelingMode$Autopilot),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$scaleoutModelingMode),
                 ScaleoutModelingMode$Autopilot)
  })
})

test_that("Use non-null accuracyOptimizedBlueprints", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target,
                accuracyOptimizedBlueprints = TRUE),
      "Autopilot started")
    expect_true(as.logical(bodyForInspect$accuracyOptimizedMb))
  })
})

test_that("Use non-null offset and exposure", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target,
                offset = c("offset_var1", "offset_var2"),
                exposure = "exposure_var"),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$offset), c("offset_var1", "offset_var2"))
    expect_equal(as.character(bodyForInspect$exposure), "exposure_var")
  })
})

test_that("Use non-null eventsCount", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target,
                eventsCount = "events_count_column"),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$eventsCount), "events_count_column")
  })
})

test_that("Use montonic constraints", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target,
                monotonicIncreasingFeaturelistId = "monotonic-flist-up",
                monotonicDecreasingFeaturelistId = "monotonic-flist-down",
                onlyIncludeMonotonicBlueprints = TRUE),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$monotonicIncreasingFeaturelistId),
                 "monotonic-flist-up")
    expect_equal(as.character(bodyForInspect$monotonicDecreasingFeaturelistId),
                 "monotonic-flist-down")
    expect_true(as.logical(bodyForInspect$onlyIncludeMonotonicBlueprints))
  })
})

test_that("Use actual feature lists for montonic constraints", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target,
                monotonicIncreasingFeaturelistId = fakeFeatureList,
                monotonicDecreasingFeaturelistId = fakeFeatureList,
                onlyIncludeMonotonicBlueprints = TRUE),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$monotonicIncreasingFeaturelistId),
                 fakeFeatureListId)
    expect_equal(as.character(bodyForInspect$monotonicDecreasingFeaturelistId),
                 fakeFeatureListId)
    expect_true(as.logical(bodyForInspect$onlyIncludeMonotonicBlueprints))
  })
})

test_that("Use valid targetTypes", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, targetType = TargetType$Multiclass),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$targetType), TargetType$Multiclass)
  })
})

test_that("Fail on invalid targetTypes", {
  expect_error(withSetTargetMocks(
    SetTarget(project = project, target = target, targetType = "MAGIC")),
    paste0("Invalid ", sQuote("TargetType"), ". Must be in ", sQuote("Binary"), ", ",
          sQuote("Multiclass"), ", ", sQuote("Regression"), " but got ", sQuote("MAGIC"),
          " instead."))
})


test_that("Use full autopilot mode", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, mode = AutopilotMode$FullAuto),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$mode), AutopilotMode$FullAuto)
    expect_false(as.logical(bodyForInspect$quickrun))
  })
})

test_that("Use manual mode", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, mode = AutopilotMode$Manual),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$mode), AutopilotMode$Manual)
    expect_false(as.logical(bodyForInspect$quickrun))
  })
})

test_that("Use quickrun mode", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, mode = AutopilotMode$Quick),
      "Autopilot started")
    # Quickrun does full auto, but with the quickrun parameter
    expect_equal(as.character(bodyForInspect$mode), AutopilotMode$FullAuto)
    expect_true(as.logical(bodyForInspect$quickrun))
  })
})


partition <- CreateDatetimePartitionSpecification("dateColumn", autopilotDataSelectionMethod = NULL,
                                                  validationDuration = NULL,
                                                  holdoutStartDate = NULL, holdoutDuration = NULL,
                                                  gapDuration = NULL, numberOfBacktests = NULL,
                                                  backtests = NULL)
test_that("Datetime partition with empty backtests", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, partition = partition),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$cvMethod), "datetime")
    expect_equal(as.character(bodyForInspect$datetimePartitionColumn), "dateColumn")
    expect_false(as.logical(bodyForInspect$useTimeSeries))
    expect_false(as.logical(bodyForInspect$defaultToKnownInAdvance))
  })
})

partition <- CreateDatetimePartitionSpecification("dateColumn",
                                      featureSettings = list(featureName = "Product_offers",
                                                             knownInAdvance = TRUE))
test_that("Datetime partition with feature settings", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, partition = partition),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$cvMethod), "datetime")
    expect_equal(as.character(bodyForInspect$datetimePartitionColumn), "dateColumn")
    expect_false(as.logical(bodyForInspect$useTimeSeries))
    expect_false(as.logical(bodyForInspect$defaultToKnownInAdvance))
    expect_is(bodyForInspect$featureSettings, "list")
    expect_equal(bodyForInspect$featureSettings[[1]]$featureName, "Product_offers")
    expect_true(bodyForInspect$featureSettings[[1]]$knownInAdvance)
  })
})

partition <- CreateDatetimePartitionSpecification("dateColumn",
                                                  treatAsExponential = TreatAsExponential$Always,
                                                  differencingMethod = DifferencingMethod$Seasonal,
                                                  periodicities = list(list("timeSteps" = 10,
                                                                            "timeUnit" = "HOUR"),
                                                                       list("timeSteps" = 600,
                                                                            "timeUnit" = "MINUTE"),
                                                                       list("timeSteps" = 7,
                                                                            "timeUnit" = "DAY")))
test_that("Datetime partition with exponential, differencing, and periodicities", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, mode = AutopilotMode$Quick,
                partition = partition),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$cvMethod), "datetime")
    expect_equal(as.character(bodyForInspect$datetimePartitionColumn), "dateColumn")
    expect_false(as.logical(bodyForInspect$useTimeSeries))
    expect_false(as.logical(bodyForInspect$defaultToKnownInAdvance))
    expect_equal(as.character(bodyForInspect$treatAsExponential), TreatAsExponential$Always)
    expect_equal(as.character(bodyForInspect$differencingMethod), DifferencingMethod$Seasonal)
    expect_equal(bodyForInspect$periodicities[[1]]$timeSteps, 10)
    expect_equal(bodyForInspect$periodicities[[1]]$timeUnit, "HOUR")
    expect_equal(bodyForInspect$periodicities[[2]]$timeSteps, 600)
    expect_equal(bodyForInspect$periodicities[[2]]$timeUnit, "MINUTE")
  })
})

test_that("Datetime partition with invalid partition", {
  with_mock("datarobot:::Endpoint" = function() return(fakeEndpoint),
            "datarobot:::Token" = function() return(fakeToken),
            GetProjectStatus = function(...) return(list(stage = "aim")), {
    expect_error(SetTarget(project = project, target = target, mode = AutopilotMode$Quick,
                partition = list("dateColumn")),
      "must use a valid partition object")
  })
})

partition <- CreateDatetimePartitionSpecification("dateColumn", useTimeSeries = TRUE)
test_that("True time series partition", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, mode = AutopilotMode$Quick,
                partition = partition),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$cvMethod), "datetime")
    expect_equal(as.character(bodyForInspect$datetimePartitionColumn), "dateColumn")
    expect_true(as.logical(bodyForInspect$useTimeSeries))
    expect_false(as.logical(bodyForInspect$defaultToKnownInAdvance))
  })
})

partition <- CreateDatetimePartitionSpecification("dateColumn", useTimeSeries = TRUE,
                                                  multiseriesIdColumns = "series_id")
test_that("Multiseries partition", {
  withSetTargetMocks({
    expect_message(
      SetTarget(project = project, target = target, mode = AutopilotMode$Quick,
                partition = partition),
      "Autopilot started")
    expect_equal(as.character(bodyForInspect$cvMethod), "datetime")
    expect_equal(as.character(bodyForInspect$datetimePartitionColumn), "dateColumn")
    expect_equal(bodyForInspect$multiseriesIdColumns[[1]], "series_id")
    expect_true(as.logical(bodyForInspect$useTimeSeries))
    expect_false(as.logical(bodyForInspect$defaultToKnownInAdvance))
  })
})
