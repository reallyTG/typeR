context("httpResponse")

test_that("httpResponse.contentType() accepts various input", {
  expect_equal(
    httpResponse.contentType("file.csv"),
    paste0("Content-Type: ", "text/csv")
  )
  expect_equal(
    httpResponse.contentType(".csv"),
    paste0("Content-Type: ", "text/csv")
  )
  expect_equal(
    httpResponse.contentType("csv"),
    paste0("Content-Type: ", "text/csv")
  )
})

test_that("httpResponse.contentType() understands common types", {
  expect_equal(
    httpResponse.contentType("css"),
    paste0("Content-Type: ", "text/css")
  )
  expect_equal(
    httpResponse.contentType("csv"),
    paste0("Content-Type: ", "text/csv")
  )
  expect_equal(
    httpResponse.contentType("html"),
    paste0("Content-Type: ", "text/html")
  )
  expect_equal(
    httpResponse.contentType("txt"),
    paste0("Content-Type: ", "text/plain")
  )
  expect_equal(
    httpResponse.contentType("png"),
    paste0("Content-Type: ", "image/png")
  )
  expect_equal(
    httpResponse.contentType("gif"),
    paste0("Content-Type: ", "image/gif")
  )
  expect_equal(
    httpResponse.contentType("pdf"),
    paste0("Content-Type: ", "application/pdf")
  )
  expect_equal(
    httpResponse.contentType("ppt"),
    paste0("Content-Type: ", "application/vnd.ms-powerpoint")
  )
  expect_equal(
    httpResponse.contentType("pptx"),
    paste0("Content-Type: ", "application/vnd.openxmlformats-officedocument.presentationml.presentation")
  )
})

test_that("httpResponse.header() accepts various input", {
  expect_equal(
    httpResponse.header("file.csv"),
    paste0("Content-Type: ", "text/csv", "\n\n")
  )
  expect_equal(
    httpResponse.header(".csv"),
    paste0("Content-Type: ", "text/csv", "\n\n")
  )
  expect_equal(
    httpResponse.header("csv"),
    paste0("Content-Type: ", "text/csv", "\n\n")
  )
})

