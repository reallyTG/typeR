context("test-flow-left")

test_that("int64-double-rw", {
  a <- 2**32
  dc <- .C64("TEST_prod_int64", c("int64", "int64"),
             a = a, b = 2,
             PACKAGE = "dotCall64", VERBOSE = 1)
  dc_e <- list(a = 2**33, b = 2)
  expect_equal(lapply(dc, typeof), lapply(dc_e, typeof))      
  expect_equal(dc, dc_e)
  expect_identical(a, 2**32, label = "[modified R object]")

  expr <- expression(.C64("TEST_prod_int64", c("int64", "int64"),
                          a = a, b = 2,
                          PACKAGE = "dotCall64", VERBOSE = 2))
  expect_warning(eval(expr),
                 "alloc 1; coerce 0; dup 0;\ncast.in 1; cast.back 1")
})

test_that("int64-double-r", {
  a <- 2**32
  dc <- .C64("TEST_prod_int64", c("int64", "int64"),
             a = a, b = 2, INTENT = c("r", "rw"),
             PACKAGE = "dotCall64", VERBOSE = 1)
  dc_e <- list(a = NULL, b = 2)
  expect_equal(lapply(dc, typeof), lapply(dc_e, typeof))      
  expect_equal(dc, dc_e)
  expect_identical(a, 2**32, label = "[modified R object]")
  ## a not modified, because not in place double -> long int transition

  expr <- expression(.C64("TEST_prod_int64", c("int64", "int64"),
                          a = a, b = 2, INTENT = c("r", "rw"),
                          PACKAGE = "dotCall64", VERBOSE = 2))
  expect_warning(eval(expr),
                 "alloc 1; coerce 0; dup 0;\ncast.in 1; cast.back 0")
  expect_warning(eval(expr),
                 "alloc 1; coerce 0; dup 0;\ncast.in 1; cast.back 1")

})


test_that("int64-integer-rw", {
  a <- 5L
  expr <- expression(.C64("TEST_prod_int64", c("int64", "int64"),
                          a = a, b = 2L,
                          PACKAGE = "dotCall64", VERBOSE = 1))
  dc <- suppressWarnings(eval(expr))
  dc_e <- list(a = 10, b = 2)
  expect_equal(lapply(dc, typeof), lapply(dc_e, typeof))      
  expect_equal(dc, dc_e)
  expect_identical(a, 5L, label = "[modified R object]")
  expect_warning(eval(expr), "[dotCall64|wrong R object type]",
                 label = "[dotCall64|wrong R object type]")

  expr <- expression(.C64("TEST_prod_int64", c("int64", "int64"),
                          a = a, b = 2L,
                          PACKAGE = "dotCall64", VERBOSE = 2))
  expect_warning(eval(expr),
                 "alloc 1; coerce 0; dup 0;\ncast.in 1; cast.back 1")

})

test_that("int64-integer-r", {
  a <- 5L
  expr <- expression(.C64("TEST_prod_int64", c("int64", "int64"),
                          a = a, b = 2L, INTENT = c("r", "rw"),
                          PACKAGE = "dotCall64", VERBOSE = 1))
  dc <- suppressWarnings(eval(expr))
  dc_e <- list(a = NULL, b = 2)
  expect_equal(lapply(dc, typeof), lapply(dc_e, typeof))      
  expect_equal(dc, dc_e)
  expect_identical(a, 5L, label = "[modified R object]")
  ## a not modified, because not in place double -> long int transition
  expect_warning(eval(expr), "[dotCall64|wrong R object type]",
                 label = "[dotCall64|wrong R object type]")

  expr <- expression(.C64("TEST_prod_int64", c("int64", "int64"),
                          a = a, b = 2L, INTENT = c("r", "rw"),
                          PACKAGE = "dotCall64", VERBOSE = 2))
  expect_warning(eval(expr),
                 "alloc 1; coerce 0; dup 0;\ncast.in 1; cast.back 0")
  expect_warning(eval(expr),
                 "alloc 1; coerce 0; dup 0;\ncast.in 1; cast.back 1")

})


test_that("int64-complex-rw", {
  a <- 5+5i
  expr <- expression(.C64("TEST_prod_int64", c("int64", "int64"),
                          a = a, b = 2+2i,
                          PACKAGE = "dotCall64", VERBOSE = 1))
  dc <- suppressWarnings(eval(expr))
  dc_e <- list(a = 10, b = 2)
  expect_equal(lapply(dc, typeof), lapply(dc_e, typeof))      
  expect_equal(dc, dc_e)
  expect_identical(a, 5+5i, label = "[modified R object]")
  expect_warning(eval(expr), "[dotCall64|wrong R object type]",
                 label = "[dotCall64|wrong R object type]")

  expr <- expression(.C64("TEST_prod_int64", c("int64", "int64"),
                          a = a, b = 2+2i,
                          PACKAGE = "dotCall64", VERBOSE = 2))
  
  expect_warning(eval(expr),
                 "alloc 0; coerce 1; dup 0;\ncast.in 1; cast.back 1")

})

test_that("int64-complex-r", {
  a <- 5+5i
  expr <- expression(.C64("TEST_prod_int64", c("int64", "int64"),
                          a = a, b = 2+2i, INTENT = c("r", "rw"),
                          PACKAGE = "dotCall64", VERBOSE = 1))
  dc <- suppressWarnings(eval(expr))
  dc_e <- list(a = NULL, b = 2)
  expect_equal(lapply(dc, typeof), lapply(dc_e, typeof))      
  expect_equal(dc, dc_e)
  expect_identical(a, 5+5i, label = "[modified R object]")
  ## a not modified, because not in place double -> long int transition
  expect_warning(eval(expr), "[dotCall64|wrong R object type]",
                 label = "[dotCall64|wrong R object type]")

  expr <- expression(.C64("TEST_prod_int64", c("int64", "int64"),
                          a = a, b = 2+2i, INTENT = c("r", "rw"),
                          PACKAGE = "dotCall64", VERBOSE = 2))
    expect_warning(eval(expr),
                 "alloc 0; coerce 1; dup 0;\ncast.in 1; cast.back 0")

})







