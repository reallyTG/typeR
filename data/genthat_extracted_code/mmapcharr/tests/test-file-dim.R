################################################################################

context("file-dim")

################################################################################

test_that("Get dimensions after write()", {
  
  write(1:5, tmpfile <- tempfile(), ncolumns = 1)
  dim_file(tmpfile)
  expect_equal(nelem(tmpfile), 1)
  expect_equal(nline(tmpfile), 5)
  
  write(1:6, tmpfile <- tempfile(), ncolumns = 3)
  dim_file(tmpfile)
  expect_equal(nelem(tmpfile), 5)  ## 3 + 2 spaces
  expect_equal(nline(tmpfile), 2)
  
  write(1:10, tmpfile <- tempfile(), ncolumns = 2)
  expect_error(dim_file(tmpfile), ERROR_FILE, fixed = TRUE)
})

################################################################################

test_that("Get dimensions after write.table()", {
  
  write.table(matrix(1:4, 2), tmpfile <- tempfile(), 
              row.names = FALSE, col.names = FALSE)
  dim_file(tmpfile)
  expect_equal(nelem(tmpfile), 3)  ## 2 + 1 space
  expect_equal(nline(tmpfile), 2)
  
  write.table(matrix(1:4), tmpfile <- tempfile(), 
              row.names = FALSE, col.names = FALSE)
  dim_file(tmpfile)
  expect_equal(nelem(tmpfile), 1) 
  expect_equal(nline(tmpfile), 4)
  
  cat("\n", file = tmpfile, append = TRUE)
  expect_error(dim_file(tmpfile), ERROR_FILE, fixed = TRUE)
})

################################################################################