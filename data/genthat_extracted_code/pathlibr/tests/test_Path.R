context("Do Path objects work the way we want them to?")

d <- NULL

setup({
  d <<- tempdir()

  new_d <- file.path(d, "path","to","files")
  dir.create(new_d, recursive = TRUE)

  f1 <- file.path(new_d, "f1.txt")
  writeLines("This is file 1!", f1)

  f2 <- file.path(new_d, "f2.txt")
  writeLines("This is file 2", f2)
})


test_that("Are able to make new file Path", {
  print(d)
  p <- Path$new(d)

  p <- p$.$path

  expect_equal(p$name, "path")

  expect_identical(names(p$.), c("to"))

  files <- p$.$to$.$files

  expect_setequal(names(files$.), c("f1.txt", "f2.txt"))

})
