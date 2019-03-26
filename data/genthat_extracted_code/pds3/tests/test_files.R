context("Real file tests")

test_that("mv10110413_6000000_001_rr.lbl", {
  file.name <- "mv10110413_6000000_001_rr.lbl"
  test.file <- file.path("..", "testdata", file.name)

  res <- pds3_read(test.file, assume_complete = T)
  expect_length(res, 3)
  expect_equal(nchar(res$extra_data), 0)
  expect_length(res$odl, 109)
  expect_equal(res$odl$MISSION_NAME, "EPOXI")
  expect_equal(res$odl[["EPOXI:INTERPOLATED_PIXEL_COUNT"]], 0)
  expect_equal(res$odl[["^EXT_DESTRIPE_IMAGE"]]$offset, 3301)
  expect_equal(res$odl$EXT_DESTRIPE_IMAGE$UNIT, "DATA_NUMBER")
})

test_that("ESP_011707_1440_COLOR.LBL", {
  file.name <- "ESP_011707_1440_COLOR.LBL"
  test.file <- file.path("..", "testdata", file.name)

  res <- pds3_read(test.file, assume_complete = T)
  expect_length(res, 3)
})

test_that("PSP_010737_2050_COLOR.LBL", {
  file.name <- "PSP_010737_2050_COLOR.LBL"
  test.file <- file.path("..", "testdata", file.name)

  res <- pds3_read(test.file, assume_complete = T)
  expect_length(res, 3)
})

test_that("RDRCUMINDEX.LBL", {
  file.name <- "RDRCUMINDEX.LBL"
  test.file <- file.path("..", "testdata", file.name)

  res <- pds3_read(test.file, assume_complete = T)
  expect_length(res, 3)
  expect_length(res$odl, 6)
  expect_length(res$odl$RDR_INDEX_TABLE$COLUMN, 54)
})

test_that("Basic parsing tests", {
  files <- c("JNCR_2016345_03C00002_V01.LBL",
             "P01_001330_1221_XN_57S223W.LBL")
  res <- lapply(files, function(file.name) {
    test.file <- file.path("..", "testdata", file.name)
    res <- pds3_read(test.file)
    expect_length(res, 3)
  })
})

test_that("File With End Data", {
  file.name <- "AAREADME.TXT"
  test.file <- file.path("..", "testdata", file.name)
  # This file has content after 'END' so we need to set assume_complete to
  # FALSE
  res <- pds3_read(test.file, assume_complete = FALSE)
  expect_length(res, 3)
  expect_equal(nchar(res$extra_data), 14538)
  expect_equal(res$odl$RECORD_TYPE, "STREAM")
  expect_equal(res$odl$TEXT$INTERCHANGE_FORMAT, "ASCII")
})
