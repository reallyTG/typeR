context("test-flow-center")

test_that("double-double", {
  a <- 3.3
  dc <- .C64("TEST_prod_double", c("double", "double"),
             a = a, b = 2,
             PACKAGE = "dotCall64",
             VERBOSE = 1)
  dc_e <- list(a = 6.6, b = 2)
  expect_equal(lapply(dc, typeof), lapply(dc_e, typeof))      
  expect_equal(dc, dc_e)
  expect_identical(a, 3.3, label = "[modified R object]")

  expr <- expression(.C64("TEST_prod_double",
                          c("double", "double"),
                          a = a, b = 2,
                          PACKAGE = "dotCall64",
                          VERBOSE = 2))
  expect_warning(eval(expr),
                 "alloc 0; coerce 0; dup 1;\ncast.in 0; cast.back 0;")
})


test_that("double-double-modifiedRead", {
  a <- 3.3
  dc <- .C64("TEST_prod_double", c("double", "double"),
             a = a, b = 2, INTENT = c("r", "rw"),
             PACKAGE = "dotCall64", VERBOSE = 1)
  dc_e <- list(a = NULL, b = 2)
  expect_equal(lapply(dc, typeof), lapply(dc_e, typeof))      
  expect_equal(dc, dc_e)
  expect_identical(a, 6.6, label = "[modified R object]")

  expr <- expression(.C64("TEST_prod_double",
                          c("double", "double"),
                          a = a, b = 2,
                          INTENT = c("r", "rw"),
                          PACKAGE = "dotCall64",
                          VERBOSE = 2))
  expect_warning(eval(expr),
                 "alloc 0; coerce 0; dup 1;\ncast.in 0; cast.back 0;")
  expect_warning(eval(expr),
                 "alloc 0; coerce 0; dup 0;\ncast.in 0; cast.back 0;")
})


test_that("int-int", {
  a <- 3L
  dc <- .C64("TEST_prod_int", c("int", "int"),
             a = a, b = 2L,
             PACKAGE = "dotCall64", VERBOSE = 1)
  dc_e <- list(a = 6L, b = 2L)
  expect_equal(lapply(dc, typeof), lapply(dc_e, typeof))      
  expect_equal(dc, dc_e)
  expect_identical(a, 3L, label = "[modified R object]")

  expr <- expression(.C64("TEST_prod_int",
                          c("int", "int"),
                          a = a, b = 2L,
                          PACKAGE = "dotCall64",
                          VERBOSE = 2))
  expect_warning(eval(expr),
                 "alloc 0; coerce 0; dup 1;\ncast.in 0; cast.back 0")
})


test_that("int-int-modifiedRead", {
  a <- 3L 
  dc <- .C64("TEST_prod_int", c("int", "int"),
             a = a, b = 2L, INTENT = c("r", "rw"),
             PACKAGE = "dotCall64", VERBOSE = 1)
  dc_e <- list(a = NULL, b = 2L)
  expect_equal(lapply(dc, typeof), lapply(dc_e, typeof))      
  expect_equal(dc, dc_e)
  expect_identical(a, 6L, label = "[modified R object]")

  expr <- expression(.C64("TEST_prod_int",
                          c("int", "int"),
                          a = a, b = 2L,
                          INTENT = c("r", "rw"),
                          PACKAGE = "dotCall64",
                          VERBOSE = 2))
  expect_warning(eval(expr),
                 "alloc 0; coerce 0; dup 0;\ncast.in 0; cast.back 0")
  expect_warning(eval(expr),
                 "alloc 0; coerce 0; dup 1;\ncast.in 0; cast.back 0")
})


test_that("int-double-rw", {
  a <- 3
  expr <- expression(.C64("TEST_prod_int", c("int", "int"),
                          a = a, b = 2,
                          PACKAGE = "dotCall64", VERBOSE = 1))
  dc <- suppressWarnings(eval(expr))
  dc_e <- list(a = 6L, b = 2L)
  expect_equal(lapply(dc, typeof), lapply(dc_e, typeof))      
  expect_equal(dc, dc_e)
  expect_identical(a, 3, label = "[modified R object]")
  expect_warning(eval(expr), "[dotCall64|wrong R object type]",
                 label = "[dotCall64|wrong R object type]")

  expr <- expression(.C64("TEST_prod_int",
                          c("int", "int"),
                          a = a, b = 2,
                          PACKAGE = "dotCall64",
                          VERBOSE = 2))
  expect_warning(eval(expr),
                 "alloc 0; coerce 1; dup 0;\ncast.in 0; cast.back 0")
})


test_that("int-double-r", {
  a <- 3
  expr <- expression(.C64("TEST_prod_int", c("int", "int"),
                          a = a, b = 2, INTENT = c("r", "rw"),
                          PACKAGE = "dotCall64", VERBOSE = 1))
  dc <- suppressWarnings(eval(expr))
  dc_e <- list(a = NULL, b = 2L)
  expect_equal(lapply(dc, typeof), lapply(dc_e, typeof))      
  expect_equal(dc, dc_e)
  expect_identical(a, 3, label = "[modified R object]")
  expect_warning(eval(expr), "[dotCall64|wrong R object type]",
                 label = "[dotCall64|wrong R object type]")

  expr <- expression(.C64("TEST_prod_int",
                          c("int", "int"),
                          a = a, b = 2,
                          INTENT = c("r", "rw"),
                          PACKAGE = "dotCall64",
                          VERBOSE = 2))
  expect_warning(eval(expr),
                 "alloc 0; coerce 1; dup 0;\ncast.in 0; cast.back 0")
})


test_that("double-int-rw", {
  a <- 3L
  expr <- expression(.C64("TEST_prod_double", c("double", "double"),
                          a = a, b = 2L,
                          PACKAGE = "dotCall64", VERBOSE = 1))
  dc <- suppressWarnings(eval(expr))
  dc_e <- list(a = 6, b = 2)
  expect_equal(lapply(dc, typeof), lapply(dc_e, typeof))      
  expect_equal(dc, dc_e)
  expect_identical(a, 3L, label = "[modified R object]")
  expect_warning(eval(expr), "[dotCall64|wrong R object type]",
                 label = "[dotCall64|wrong R object type]")

  expr <- expression(.C64("TEST_prod_double",
                          c("double", "double"),
                          a = a, b = 2L,
                          PACKAGE = "dotCall64",
                          VERBOSE = 2))
  expect_warning(eval(expr),
                 "alloc 0; coerce 1; dup 0;\ncast.in 0; cast.back 0")
})


test_that("double-int-r", {
  a <- 3L
  expr <- expression(.C64("TEST_prod_double", c("double", "double"),
                          a = a, b = 2L, INTENT = c("r", "rw"),
                          PACKAGE = "dotCall64", VERBOSE = 1))
  dc <- suppressWarnings(eval(expr))
  dc_e <- list(a = NULL, b = 2)
  expect_equal(lapply(dc, typeof), lapply(dc_e, typeof))      
  expect_equal(dc, dc_e)
  expect_identical(a, 3L, label = "[modified R object]")
  expect_warning(eval(expr), "[dotCall64|wrong R object type]",
                 label = "[dotCall64|wrong R object type]")

  expr <- expression(.C64("TEST_prod_double",
                          c("double", "double"),
                          a = a, b = 2L,
                          INTENT = c("r", "rw"),
                          PACKAGE = "dotCall64",
                          VERBOSE = 2))
  expect_warning(eval(expr),
                 "alloc 0; coerce 1; dup 0;\ncast.in 0; cast.back 0")
})
