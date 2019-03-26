context("reducer tests")

util <- pds3_lexer_parser()
parser <- util$parser
lexer <- util$lexer

test_that("Simple Assignment", {
  string <- "TEST = 12312
  END"

  dat <- parser$parse(string, lexer)
  res <- pds3:::reduce(dat)

  expect_length(res, 1)
  expect_equal(res$TEST, 12312)
})

test_that("Simple Assignment", {
  string <- "TEST = 12312
  TEST2 = \"Another string\"
  END"

  dat <- parser$parse(string, lexer)
  res <- pds3:::reduce(dat)

  expect_length(res, 2)
  expect_equal(res$TEST, 12312)
  expect_equal(res$TEST2, "Another string")
})

test_that("Simple Assignment 3", {
  string <- "TEST = 12312
  TEST2 = \"Another string\"
  TEST3 = 'FACE'
  END"

  dat <- parser$parse(string, lexer)
  res <- pds3:::reduce(dat)

  expect_length(res, 3)
  expect_equal(res$TEST, 12312)
  expect_equal(res$TEST2, "Another string")
})

test_that("Simple OBJECT", {
  string <- "TEST = 12312
  BEGIN_OBJECT = OBJECT1
    TEST2 = 'INNER'
  END_OBJECT = OBJECT1
  END"

  dat <- parser$parse(string, lexer)
  expect_length(dat, 4)
  res <- pds3:::reduce(dat)

  expect_length(res, 2)
  expect_equal(res$TEST, 12312)
  expect_equal(res$OBJECT1$TEST2, "INNER")
})

test_that("Merger Object Assignment", {
  string <- "TEST = 12312
  BEGIN_OBJECT = OBJECT1
    TEST2 = 'INNER'
  END_OBJECT = OBJECT1
  BEGIN_OBJECT = OBJECT1
    TEST2 = 'INNER2'
    TEST3 = 'INNER3'
  END_OBJECT = OBJECT1
  END"
  dat <- parser$parse(string, lexer)
  res <- reduce(dat)
  expect_length(res$OBJECT1, 2)
  expect_equal(res$OBJECT1[[1]]$TEST2, "INNER")
  expect_equal(res$OBJECT1[[2]]$TEST2, "INNER2")
  expect_equal(res$OBJECT1[[2]]$TEST3, "INNER3")
  expect_equal(res$TEST, 12312)
})
