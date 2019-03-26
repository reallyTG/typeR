################################################################################

context("FBM_ACCESSORS")

################################################################################

test_file <- system.file("testdata/geno3pops.lfmm", package = "mmapcharr")
X <- mmapchar(test_file, code = mmapcharr:::CODE_012)
x <- as.matrix(read.table(test_file)); dimnames(x) <- NULL

################################################################################

test_extract <- function(call) {
  call <- deparse(substitute(call))
  eval(parse(text = sprintf("expect_equal(%s, %s)",
                            sub("^mat", "X", call),
                            sub("^mat", "x", call))), parent.frame())
}

################################################################################

test_that("same dimensions", {
  expect_equal(nrow(X), nrow(x))
  expect_equal(ncol(X), ncol(x))
  expect_equal(dim(X), dim(x))
  expect_equal(length(X), length(x))
})

test_that("same accessing", {
  
  test_extract(mat[])
  test_extract(mat[, , drop = FALSE])
  test_extract(mat[, , drop = TRUE])
  test_extract(mat[1, ])
  test_extract(mat[1, , drop = FALSE])
  test_extract(mat[1, , drop = TRUE])
  test_extract(mat[cbind(1:5, 1:5)])
  
  for (ind in list(1:5, -(1:5), c(TRUE, FALSE, TRUE))) {
    
    test_extract(mat[ind, ])
    test_extract(mat[ind, , drop = FALSE])
    test_extract(mat[ind, , drop = TRUE])
    test_extract(mat[, 1])
    test_extract(mat[, 1, drop = FALSE])
    test_extract(mat[, 1, drop = TRUE])
    test_extract(mat[1, 1])
    test_extract(mat[1, 1, drop = FALSE])
    test_extract(mat[1, 1, drop = TRUE])
    test_extract(mat[ind, 1])
    test_extract(mat[ind, 1, drop = FALSE])
    test_extract(mat[ind, 1, drop = TRUE])
    test_extract(mat[, ind])
    test_extract(mat[, ind, drop = FALSE])
    test_extract(mat[, ind, drop = TRUE])
    test_extract(mat[1, ind])
    test_extract(mat[1, ind, drop = FALSE])
    test_extract(mat[1, ind, drop = TRUE])
    test_extract(mat[ind, ind])
    test_extract(mat[ind, ind, drop = FALSE])
    test_extract(mat[ind, ind, drop = TRUE])
  }
  
})

################################################################################
