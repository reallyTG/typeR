context("read")
n_rows = nrow(readLines("test.svmlight"))
  
test_that("read basic", {
  m = read_svmlight("test.svmlight")
  expect_equal(names(m), c("x", "y"))
  expect_equal(nrow(m), n_rows)
})

test_that("read different formats", {
  formats = c("CsparseMatrix", "RsparseMatrix", "TsparseMatrix")
  for( f in formats) {
    m = read_svmlight("test.svmlight", type = f)
    expect_true(inherits(m$x, f))
  }
})