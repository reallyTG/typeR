context("stripExtension()")

test_that("stripExtension() performs equivalently to historical results", {

  x1 <- stripExtension(c("this old file.doc", "that young file.rtf",
                         "this.good.file.doc", "this_bad_file"))

  # created using 'hardCode(x1, vname = "x1.test", vert = F)'
  x1.test <- c("this old file", "that young file", "this.good.file", "this_bad_file")

  expect_identical(x1, x1.test)
  
  x2 <- stripExtension(c("this old file*doc", "that young file*rtf",
                         "this*good*file*doc", "this_bad_file"), split.char = "*")

  # created using 'hardCode(x2, vname = "x2.test", vert = F)'
  x2.test <- c("this old file", "that young file", "this*good*file", "this_bad_file")

  expect_identical(x2, x2.test)
  
  # Named vectors are not required, but are included here to make the
  # output easier to read.  This example demonstrates a number of
  # pathological cases.
  x3 <- stripExtension(c(a = NA, b = ".doc", c = "this.pdf", d = "this.file.", e = ".",
                         f = "noExtension", g = "direc.name/filename.txt", h = ""))
    
  # Created using 'hardCode(x3, vname = "x3.test", vert = F)'
  x3.test <- c(NA, "", "this", "this.file", "", "noExtension", "direc.name/filename", "")
  names(x3.test) <- names(x3)

  expect_identical(x3, x3.test)
  
})

test_that("stripExtension() returns errors as expected", {

  expect_error(stripExtension(7), "'vec' must be a character vector")
  expect_error(stripExtension("7", split.char = "22"), "'split.char' must be")
  expect_error(stripExtension("7", split.char = 4), "'split.char' must be")  
  expect_error(stripExtension("7", split.char = c(".", ",")), "'split.char' must be")  
    
})
