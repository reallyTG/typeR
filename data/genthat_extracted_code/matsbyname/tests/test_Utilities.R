# This file contains tests for functions in Utilities.R.

###########################################################
context("Organizing arguments")
###########################################################

test_that("errors are generated when organize_args is called with baloney", {
  expect_error(matsbyname:::organize_args(b = 42), 
               "Missing argument a with no fill in organize_args.")
  expect_error(matsbyname:::organize_args(a = NULL, b = 42), 
               "Null argument a with no fill in organize_args.")
  expect_error(matsbyname:::organize_args(a = 42), 
               "Missing argument b with no fill in organize_args.")
  expect_error(matsbyname:::organize_args(a = 42, b = NULL), 
               "Null argument b with no fill in organize_args.")
  expect_error(matsbyname:::organize_args(a = matrix(1), b = matrix(1), match_type = "bogus"), 
               "Unknown match_type bogus in organize_args.")
  expect_error(matsbyname:::organize_args(a = matrix(1) %>% setcoltype("col"), 
                                          b = matrix(1) %>% setrowtype("bogus"), 
                                          match_type = "matmult"))
})

test_that("oddball match_type works as expected", {
  expect_equal(matsbyname:::organize_args(a = 1, b = 2, match_type = "none"), 
               list(a = 1, b = 2))
  expect_error(matsbyname:::organize_args(a = matrix(1), b = matrix(2), match_type = "bogus"), 
               "Unknown match_type bogus in organize_args.")
  expect_equal(matsbyname:::organize_args(a = matrix(1), b = matrix(2), match_type = "none"),
               list(a = matrix(1), b = matrix(2)))
})


###########################################################
context("Selecting rows and columns")
###########################################################

test_that("an error is generated when no retain or remove patterns are default", {
  # Check with non-NULL values for a.
  m <- matrix(1:4, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
    setrowtype("rows") %>% setcoltype("cols")
  expect_error(m %>% select_rows_byname(), 
               "neither retain_pattern nor remove_pattern are different from default")
  expect_error(m %>% select_cols_byname(), 
               "neither retain_pattern nor remove_pattern are different from default")
})

test_that("selecting rows and columns works even when there is a NULL situation", {
  # Check the degenerate condition.
  expect_null(select_rows_byname(a = NULL))
  expect_null(select_cols_byname(a = NULL))
  m <- matrix(1:4, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
    setrowtype("rows") %>% setcoltype("cols")
  # Try with rows
  expect_equal(m %>% select_rows_byname(retain_pattern = "r1"), 
               matrix(c(1, 3), ncol = 2, dimnames = list("r1", c("c1", "c2"))) %>% 
                 setrowtype("rows") %>% setcoltype("cols"))
  # Should work when there is nothing to select.
  expect_null(m %>% select_rows_byname(retain_pattern = "r3"))
  # Try with columns
  expect_equal(m %>% select_cols_byname(retain_pattern = "c1"), 
               matrix(1:2, nrow = 2, dimnames = list(c("r1", "r2"), "c1")) %>% 
                 setrowtype("rows") %>% setcoltype("cols"))
  # Should work when there is nothing to select.
  expect_null(m %>% select_cols_byname(retain_pattern = "c3"))
})

test_that("setting row and column names works even when there is a NULL situation", {
  m <- matrix(1:4, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
    setrowtype("rows") %>% setcoltype("cols")
  # Try with rows
  expect_equal(m %>% setrownames_byname(c("a", "b")), 
               matrix(1:4, nrow = 2, ncol = 2, dimnames = list(c("a", "b"), c("c1", "c2"))) %>% 
                 setrowtype("rows") %>% setcoltype("cols"))
  expect_null(setrownames_byname(NULL, c("a", "b")))
  # Try with columns
  expect_equal(m %>% setcolnames_byname(c("a", "b")), 
               matrix(1:4, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("a", "b"))) %>% 
                 setrowtype("rows") %>% setcoltype("cols"))
  expect_null(setcolnames_byname(NULL, c("a", "b")))
})
  

###########################################################
context("Cleaning")
###########################################################

test_that("bad margins in clean_byname work as expected", {
  m <- matrix(c(0, 0, 0, 1, 2, 3), nrow = 3, ncol = 2, dimnames = list(c("r1", "r2", "r3"), c("c1", "c2")))
  expect_error(clean_byname(m, margin = 42), 
               "margin = 42 in clean_byname. Must be 1 or 2.")
  
})

test_that("cleaning both rows and cols works as expected", {
  m <- matrix(c(0, 0, 0, 1, 2, 3), nrow = 3, ncol = 2, dimnames = list(c("r1", "r2", "r3"), c("c1", "c2")))
  expect_equal(clean_byname(m), 
               matrix(1:3, nrow = 3, ncol = 1, dimnames = list(c("r1", "r2", "r3"), "c2")))
})


###########################################################
context("Is zero")
###########################################################

test_that("iszero_byname works as expected", {
  m <- matrix(0, nrow = 3, ncol = 2)
  expect_true(iszero_byname(m))
  n <- matrix(1, nrow = 42, ncol = 5)
  expect_false(iszero_byname(n))
})

