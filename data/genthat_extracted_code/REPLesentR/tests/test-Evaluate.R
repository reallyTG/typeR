testthat::context("Evaluate")

testthat::test_that("", {
  e <- new.env(parent = environment())
  fname <- system.file("Introduction.Rmd", package = "REPLesentR")
  file.copy(fname, tfname <- tempfile(fileext = ".Rmd"))
  slideDeck <- SlideDeck()$new(Read()$auto(tfname, quiet = TRUE))
  evaluate <- Evaluate(e, quiet = TRUE)
  evaluate$slideDeck(slideDeck)
  l <- as.list(e, all.names = TRUE)
  testthat::expect_true(all(c("hi", ".fileName") %in% names(l)))
  testthat::expect_true(l$hi == "Hi\n")
})
