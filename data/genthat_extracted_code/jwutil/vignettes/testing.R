## ----setup, echo = FALSE-------------------------------------------------
suppressPackageStartupMessages(library(jwutil, warn.conflicts = FALSE))
suppressPackageStartupMessages(library(testthat, warn.conflicts = FALSE))

## ----desc, echo = FALSE, results='asis'----------------------------------
cat(packageDescription("jwutil")$Description)

## ----extreme-------------------------------------------------------------
extreme_numbers

## ----zero----------------------------------------------------------------
zeroes
sapply(zeroes, class)

## ----combine-------------------------------------------------------------
expect_that_combine_all_args(sum(1, 2), testthat::equals(3))

## ----combine_alt---------------------------------------------------------
expect_that(sum(1, 2), testthat::equals(3))
expect_that(sum(2, 1), testthat::equals(3))

## ----combine_named, eval = FALSE-----------------------------------------
#  res <- gsub(pattern = "the", replacement = "le", x = "Pierre the chat")
#  expect_that_combine_all_args(
#    gsub(pattern = "the", replacement = "le", x = "Pierre the chat"),
#    testthat::equals(res)
#    )

## ----combine_first, eval=FALSE-------------------------------------------
#  expect_that_combine_first_arg(sum(c(-1, 0, 1)), testthat::equals(0))

## ----lsf-----------------------------------------------------------------
lsf("jwutil")[1:10]

