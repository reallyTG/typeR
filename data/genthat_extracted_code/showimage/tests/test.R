
context("showimage")

test_that("creates a non-empty image file", {
  ## Showimage is hard to test. Nevertheless, we test that it creates
  ## a non-empty image file.

  png(f1 <- tempfile(fileext = ".png"))
  on.exit(unlink(f1), add = TRUE)
  plot.new()
  dev.off()

  png(f2 <- tempfile(fileext = ".png"))
  on.exit(unlink(f2), add = TRUE)
  plot.new()

  rlogo <- system.file("img", "Rlogo.png", package="png")
  show_image(rlogo)
  dev.off()

  expect_true(tools::md5sum(f1) != tools::md5sum(f2))
})

test_that("errors", {
  expect_error(show_image(tempfile()), "File does not exist")

  f <- tempfile(fileext = ".jpg")
  on.exit(unlink(f), add = TRUE)
  cat("foobar\n", file = f)

  expect_error(show_image(f), "Unknown image type")
})
