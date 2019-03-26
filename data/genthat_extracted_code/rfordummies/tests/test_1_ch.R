test_that("ch() functions return strings", {
  for (i in 1:20) {
    expect_is(
      z <- capture_output(
        eval(parse(text = sprintf("ch%02d()", i)))
      ), 
      "character")
    expect_true(length(z) > 0)
  }
})

test_that("ch() functions return strings", {
  expect_is(
    z <- capture_output(
      toc()
    ), 
    "character")
  expect_true(length(z) > 0)
})


test_that("saveElements saves excel file", {
  excel <- tempfile(fileext = ".xlsx")
  csv <- tempfile(fileext = ".csv")
  expect_false(file.exists(excel))
  expect_false(file.exists(csv))
  saveElements(outfile = excel, type = "excel")
  saveElements(outfile = csv, type = "csv")
  expect_true(file.exists(excel))
  expect_true(file.exists(csv))
})



