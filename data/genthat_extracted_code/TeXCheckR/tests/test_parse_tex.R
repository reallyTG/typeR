context("parse_tex")

test_that("parse_tex no braces", {
  x <- c("No tex group")
  x_parsed <- parse_tex(x)
  
  expect_equal(nrow(parse_tex(x)), nchar(x))
  expect_true(all(parse_tex(x)[["line_no"]] == 1L))
  expect_true(all(parse_tex(x)[["GROUP_ID"]] == 1L))
  expect_true(all(parse_tex(x)[["tex_group"]] == 0L))
})

test_that("parse_tex single group", {
  x <- c("One {tex} group")
  x_parsed <- parse_tex(x)
  
  expect_equal(nrow(x_parsed), nchar(x))
  expect_true(all(x_parsed[["line_no"]] == 1L))
  expect_equal(x_parsed[6][["tex_group"]], 1L)
  expect_equal(x_parsed[6][["GROUP_ID1"]], 1L)
})


test_that("GRP_ID identifies group", {
  x <- "12{4{6}8}a{c}{f}hi"
  x_parsed <- parse_tex(x)
  expect_equal(x_parsed[4][["GROUP_ID1"]], x_parsed[8][["GROUP_ID1"]])
})

test_that("Verify % is not parsed", {
  expect_identical(parse_tex(c("A {", "f ", "Z}")),
                   parse_tex(c("A {", "f %}", "Z}%[]")))
})

test_that("Parse tiny documents", {
  library(data.table)
  expect_identical(parse_tex(character(0L)), data.table())
  expect_identical(parse_tex(c("", "A{B}"))[["GROUP_ID1"]], 
                   c(NA_integer_, 1L, 1L, 1L))
  expect_equal(range(parse_tex(c("", ""))[["line_no"]]), 1:2)
                   
})



