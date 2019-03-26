context("more()")

fname <- "tmp/more_test.txt"

cat("Here's a\n", "file with\n", "line3\n", "line4\n", "line5\n",
    "line6\n", "line7\n", "line8\n", sep = "", file = fname)

test_that("more() returns produces expected output", {

  expect_output(more(fname), "Here's a\nfile with\nline3\nline4\nline5\nline6\nline7\nline8 ", fixed = TRUE)

  expect_output(more(fname, n = 3), "Here's a\nfile with\nline3 ", fixed = TRUE)
  
  expect_output(more(fname, display = "t"), "line3\nline4\nline5\nline6\nline7\nline8 ", fixed = TRUE)

  expect_output(more(fname, display = "h"), "Here's a\nfile with\nline3\nline4\nline5\nline6 ", fixed = TRUE)

  expect_output(more(fname, n = 7, display = "t"), "file with\nline3\nline4\nline5\nline6\nline7 ", fixed = TRUE)

  expect_output(more(fname, n = 0), " ", fixed = TRUE)

})

test_that("more() throws errors as expected", {

  expect_error(more("fakeFile.txt"), "'file' must be a char")
  expect_error(more(7), "'file' must be a char")
  expect_error(more(fname, n = TRUE), "'n' must be in one of")
  expect_error(more(fname, n = 5.4), "'n' must be in one of")
  expect_error(more(fname, n = -2), "'n' must be in one of")
  expect_error(more(fname, display = "wrong"), "'arg' should be one of")
      
})

unlink(fname)
