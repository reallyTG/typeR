# Contains tests for apply_byname functions in the byname package.

###########################################################
context("Element apply")
###########################################################

test_that("elementapply_byname works as expected", {
  half <- function(x){
    x/2
  }
  m <- matrix(c(1:4), nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
    setrowtype("row") %>% setcoltype("col")
  expect_equal(elementapply_byname(FUN = half, a = m, row = "r1", col = "c1"), 
               matrix(c(0.5, 2, 3, 4), nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
                 setrowtype("row") %>% setcoltype("col"))
  expect_equal(elementapply_byname(FUN = half, a = m, row = "r2", col = "c1"), 
               matrix(c(1, 1, 3, 4), nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
                 setrowtype("row") %>% setcoltype("col"))
  expect_equal(elementapply_byname(FUN = half, a = m, row = "r1", col = "c2"), 
               matrix(c(1, 2, 1.5, 4), nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
                 setrowtype("row") %>% setcoltype("col"))
  expect_equal(elementapply_byname(FUN = half, a = m, row = "r2", col = "c2"), 
               matrix(c(1, 2, 3, 2), nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
                 setrowtype("row") %>% setcoltype("col"))
  
  # Try some pathological cases.
  expect_null(elementapply_byname(half, a = NULL, row = "r", col = "c"))
  expect_error(elementapply_byname(half, a = m, row = "bogus", col = "c1"), 
               "subscript out of bounds")
  
  # Try indices for rows and columns.
  expect_equal(elementapply_byname(half, a = m, row = 1, col = 1), 
               matrix(c(0.5, 2, 3, 4), nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
                 setrowtype("row") %>% setcoltype("col"))
  # Try a mix of names and indices
  expect_equal(elementapply_byname(half, a = m, row = 1, col = "c2"), 
               matrix(c(1, 2, 1.5, 4), nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
                 setrowtype("row") %>% setcoltype("col"))
  # Try with .FUNdots
  divide <- function(x, divisor){
    x/divisor
  }
  expect_equal(elementapply_byname(divide, a = m, row = 1, col = 1, .FUNdots = list(divisor = 2)), 
               matrix(c(0.5, 2, 3, 4), nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
                 setrowtype("row") %>% setcoltype("col"))
  expect_equal(elementapply_byname(divide, a = m, row = 1, col = 1, .FUNdots = list(divisor = 10)), 
               matrix(c(0.1, 2, 3, 4), nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
                 setrowtype("row") %>% setcoltype("col"))
  
  # Should also work with lists
  l <- list(m, m)
  expected <- matrix(c(10, 2, 3, 4), nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
                 setrowtype("row") %>% setcoltype("col")
  expect_equal(elementapply_byname(divide, a = l, row = 1, col = 1, .FUNdots = list(divisor = 0.1)), 
               list(expected, expected))
})


###########################################################
context("Unary apply")
###########################################################

test_that("unaryapply_byname works as expected", {
  productnames <- c("p1", "p2")
  industrynames <- c("i1", "i2")
  U <- matrix(1:4, ncol = 2, dimnames = list(productnames, industrynames)) %>%
    setrowtype("Products") %>% setcoltype("Industries")
  expect_equal(unaryapply_byname(FUN = `-`, a = U, rowcoltypes = "row"), 
               difference_byname(0, U) %>% setcoltype("Products"))
  expect_equal(unaryapply_byname(FUN = `-`, a = U, rowcoltypes = "col"), 
               difference_byname(0, U) %>% setrowtype("Industries"))
  expect_equal(unaryapply_byname(FUN = `-`, a = U, rowcoltypes = "all"), difference_byname(0, U))
})


###########################################################
context("Binary apply")
###########################################################

test_that("binaryapply_byname works as expected", {
  # Test a pathological case
  expect_equal(binaryapply_byname(FUN = sum, a = list(1, 2, 3), b = list(4,5,6)), 
               list(5, 7, 9))
  expect_error(binaryapply_byname(FUN = sum, 
                                  a = NULL, b = NULL, 
                                  match_type = "all", set_rowcoltypes = TRUE, .organize = FALSE), 
               "set_rowcoltypes == TRUE, but a and b and NULL. How can we set row and column types from NULL?")
})


###########################################################
context("Cumulative apply")
###########################################################

test_that("cumapply_byname works as expected", {
  expect_equal(cumapply_byname(FUN = `sum`, a = list(1, 2, 3)), list(1, 3, 6))
  expect_equal(cumapply_byname(FUN = `prod`, a = list(1, 2, 3)), list(1, 2, 6))
})


###########################################################
context("n-ary apply")
###########################################################

test_that("naryapply_byname works as expected", {
  # Test when there is only 1 item in ...
  expect_equal(naryapply_byname(FUN = `-`, 42), -42)
  expect_equal(naryapply_byname(FUN = `sum`, ... = list(1,2,3)), list(1,2,3))
  expect_equal(naryapply_byname(FUN = sum_byname, 2, 3), 5)
  expect_equal(naryapply_byname(FUN = sum_byname, 2, 3, 4, -4, -3, -2), 0)
  
  # Try with a unary function.
  expect_equal(naryapply_byname(FUN = `^`, list(1,2,3), .FUNdots = 2), list(1, 4, 9))
  
  # Try with naryapplylogical_byname
  expect_false(matsbyname:::naryapplylogical_byname(FUN = iszero_byname, 42))
})
