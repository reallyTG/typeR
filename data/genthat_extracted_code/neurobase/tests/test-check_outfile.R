test_that("check_outfile", {
  outfile = tempfile()
  expect_equal(check_outfile(outfile = outfile, retimg = TRUE), outfile)

  expect_type(check_outfile(outfile = NULL, retimg = TRUE), "character")

  expect_error(check_outfile(outfile = NULL, retimg = FALSE))
  
})