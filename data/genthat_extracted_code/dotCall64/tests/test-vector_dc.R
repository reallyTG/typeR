context("test-vector_dc")

test_that("int", {
   expr <- expression(
         .C64("TEST_times2_int", c("int", "int"),
              a = 2L, r = integer(1),
              INTENT = c("rw", "w"),
              PACKAGE = "dotCall64",
              VERBOSE = 1))
  expr_list <- expression(
         .C64("TEST_times2_int", c("int", "int"),
              a = 2L, r = list(mode = "integer", length = 1L),
              INTENT = c("rw", "w"),
              PACKAGE = "dotCall64",
              VERBOSE = 1))
  expr_dc <- expression(
         .C64("TEST_times2_int", c("int", "int"),
              a = 2L, r = integer_dc(1),
              INTENT = c("rw", "w"),
              PACKAGE = "dotCall64",
              VERBOSE = 1))

  ## warnings
  expect_warning(eval(expr), "[dotCall64|referenced 'w' argument]",
                 label = "[dotCall64|referenced 'w' argument]")
  expect_warning(eval(expr_list), "[dotCall64|referenced 'w' argument]",
                 label = "[dotCall64|referenced 'w' argument]")
  expect_warning(eval(expr_list),
                 "[dotCall64|referenced 'w' argument]",
                 label = "[dotCall64|referenced 'w' argument]")
  expect_silent(eval(expr_dc))
})


test_that("numeric", {
   expr <- expression(
         .C64("TEST_times2_double", c("double", "double"),
              a = 2, r = numeric(1),
              INTENT = c("rw", "w"),
              PACKAGE = "dotCall64",
              VERBOSE = 1))
  expr_list <- expression(
         .C64("TEST_times2_double", c("double", "double"),
              a = 2, r = list(mode = "integer", length = 1L),
              INTENT = c("rw", "w"),
              PACKAGE = "dotCall64",
              VERBOSE = 1))
  expr_dc <- expression(
         .C64("TEST_times2_double", c("double", "double"),
              a = 2, r = numeric_dc(1),
              INTENT = c("rw", "w"),
              PACKAGE = "dotCall64",
              VERBOSE = 1))
  ## warnings
  expect_warning(eval(expr), "[dotCall64|referenced 'w' argument]",
                 label = "[dotCall64|referenced 'w' argument]")
  expect_warning(eval(expr_list), "[dotCall64|referenced 'w' argument]",
                 label = "[dotCall64|referenced 'w' argument]")
  expect_warning(eval(expr_list),
                 "[dotCall64|referenced 'w' argument]",
                 label = "[dotCall64|referenced 'w' argument]")
  expect_silent(eval(expr_dc))
})


test_that("wrong type", {
   expr <- expression(
         .C64("TEST_times2_double", c("double", "double"),
              a = 2L, r = character(1),
              INTENT = c("rw", "w"),
              PACKAGE = "dotCall64",
              VERBOSE = 1))
  expr_list <- expression(
         .C64("TEST_times2_double", c("double", "double"),
              a = 2L, r = list(mode = "character", length = 1L),
              INTENT = c("rw", "w"),
              PACKAGE = "dotCall64",
              VERBOSE = 1))
  expr_dc <- expression(
         .C64("TEST_times2_double", c("double", "double"),
              a = 2L, r = vector_dc("character", 1L),
              INTENT = c("rw", "w"),
              PACKAGE = "dotCall64",
              VERBOSE = 1))

  ## warnings
  expect_warning(eval(expr), "[dotCall64|referenced 'w' argument]",
                 label = "[dotCall64|referenced 'w' argument]")
  expect_warning(eval(expr), "[dotCall64|wrong R object type]",
                 label = "[dotCall64|wrong R object type]")

  expect_warning(eval(expr_list), "[dotCall64|referenced 'w' argument]",
                 label = "[dotCall64|referenced 'w' argument]")
  expect_warning(eval(expr_list), "[dotCall64|wrong R object type]",
                 label = "[dotCall64|wrong R object type]")

  expect_error(eval(expr_dc),
                 "not yet supported by allocInitializedVector",
               label = "[error allocInitializedVector]")
})





