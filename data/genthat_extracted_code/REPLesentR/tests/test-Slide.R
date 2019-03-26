testthat::context("Slide")

testthat::test_that("", {
  rawText <- c(
    "", "", "", "",
    "//CENTER HEAD LINE",
    "",
    "//code",
    "",
    "    x <- 1",
    "    y <- 2",
    "", "",
    "//center centered text",
    "- '//code' is very important",
    "//code",
    "",
    "    cat('real code is the real deal')",
    "",
    "",
    ""
  )

  slide <- Slide(rawText)
  testthat::expect_equal(slide$format, "center")
  testthat::expect_equal(length(slide$content), 9)
  testthat::expect_true(all(!grepl("^//", slide$content)))
  testthat::expect_true(any(grepl("//", slide$content)))
  testthat::expect_equal(length(slide$code), 3)
  testthat::expect_equal(
    attr(slide$content, "lineFormats"),
    c("center", rep("left", 5), "center", rep("left", 2))
  )

  Render(Layout(), Screen())$singleSlide(slide)

})
