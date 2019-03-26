context("logging")

test_that("initializeLogging() stops when logDir is invalid", {
  expect_error(initializeLogging(),
               "Required parameter 'logDir' is missing.")
})

test_that("initializeLogging() creates files", {
  logDir <- tempdir()
  initializeLogging(logDir)
  logger.trace("TRACE message")
  logger.debug("DEBUG message")
  logger.info("INFO message")
  logger.error("ERROR message")
  expect_true(
    all(file.exists(
      file.path(logDir,'TRACE.log'),
      file.path(logDir,'DEBUG.log'),
      file.path(logDir,'INFO.log'),
      file.path(logDir,'ERROR.log')
    ))
  )
  file.remove(
    file.path(logDir,'TRACE.log'),
    file.path(logDir,'DEBUG.log'),
    file.path(logDir,'INFO.log'),
    file.path(logDir,'ERROR.log')
  )
})

test_that("log lines are properly formatted", {
  logger.setup()
  logger.setLevel(TRACE)
  expect_match(
    logger.fatal("test"),
    "FATAL \\[[0-9-]{10} [0-9:]{8}\\] test"
  )
  expect_match(
    logger.error("test"),
    "ERROR \\[[0-9-]{10} [0-9:]{8}\\] test"
  )
  expect_match(
    logger.warn("test"),
    "WARN \\[[0-9-]{10} [0-9:]{8}\\] test"
  )
  expect_match(
    logger.info("test"),
    "INFO \\[[0-9-]{10} [0-9:]{8}\\] test"
  )
  expect_match(
    logger.debug("test"),
    "DEBUG \\[[0-9-]{10} [0-9:]{8}\\] test"
  )
  expect_match(
    logger.trace("test"),
    "TRACE \\[[0-9-]{10} [0-9:]{8}\\] test"
  )
})

