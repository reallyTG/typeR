library("testthat")

test_that("Logging to file", {
  logFile <- tempfile()
  registerLogger(createLogger(name = "TEST",
                              threshold = "TRACE",
                              appenders = list(createFileAppender(layout = layoutParallel,
                                                                  fileName = logFile))))
  logInfo("Hello world")
  log <- readChar(logFile, file.info(logFile)$size)
  expect_true(grepl("Hello world", log))
  expect_true(unregisterLogger("TEST"))
  unlink(logFile)
})

test_that("Logging to file when log folder is deleted", {
  logFolder <- file.path(tempdir(), "logFolder")
  dir.create(logFolder)
  logFile <- file.path(logFolder, "log.txt")
  registerLogger(createLogger(name = "TEST",
                              threshold = "TRACE",
                              appenders = list(createFileAppender(layout = layoutParallel,
                                                                  fileName = logFile))))
  logInfo("Hello world")
  unlink(logFolder, recursive = TRUE)
  expect_warning(logInfo("Hello world"))
  expect_warning(expect_false(unregisterLogger("TEST")))
})
