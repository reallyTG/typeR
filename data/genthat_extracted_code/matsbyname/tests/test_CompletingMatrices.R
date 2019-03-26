# Contains tests for the CompletingMatrices.R file in the byname package.

###########################################################
context("Sorting rows and columns")
###########################################################

test_that("sort_rows_cols works as expected", {
  m <- matrix(c(1:6), nrow = 3, dimnames = list(c("r3", "r5", "r1"), c("c4", "c2")))
  msorted <- matrix(c(6, 3,
                      4, 1,
                      5, 2), byrow = TRUE, nrow = 3, 
                    dimnames = list(c("r1", "r3", "r5"), c("c2", "c4")))
  expect_equal(sort_rows_cols(m), msorted)
  expect_equal(sort_rows_cols(t(m)), 
               matrix(c(6, 4, 5,
                        3, 1, 2), byrow = TRUE, nrow = 2, 
                      dimnames = list(c("c2", "c4"), c("r1", "r3", "r5"))))
  # Sort rows only
  expect_equal(sort_rows_cols(m, margin = 1), 
               matrix(c(3, 6,
                        1, 4,
                        2, 5), byrow = TRUE, nrow = 3,
                      dimnames = list(c("r1", "r3", "r5"), c("c4", "c2"))))
  # Sort columns only
  expect_equal(sort_rows_cols(m, margin = 2), 
               matrix(c(4, 1,
                        5, 2,
                        6, 3), byrow = TRUE, nrow = 3,
                      dimnames = list(c("r3", "r5", "r1"), c("c2", "c4"))))
  # Try with a column vector
  v <- matrix(c(1:5), ncol = 1, dimnames = list(rev(paste0("r", 1:5)), "c1"))
  sortedv <- matrix(c(5, 
                      4, 
                      3, 
                      2, 
                      1), byrow = TRUE, nrow = 5, 
                    dimnames = list(c("r1", "r2", "r3", "r4", "r5"), "c1"))
  expect_equal(sort_rows_cols(v), sortedv)
  expect_equal(sort_rows_cols(v, margin = 1), sortedv)
  # No effect: only one column
  expect_equal(sort_rows_cols(v, margin = 2), v) 
  # Now try with a row vector
  r <- matrix(c(1:4), nrow = 1, dimnames = list("r1", rev(paste0("c", 1:4)))) 
  sortedr <- matrix(c(4:1), byrow = TRUE, nrow = 1, dimnames = list(c("r1"), c("c1", "c2", "c3", "c4")))
  # Sorts columns
  expect_equal(sort_rows_cols(r), sortedr)
  # No row name
  nrn <- matrix(c(1,2), nrow = 1, dimnames = list(NULL, c("c2", "c1"))) 
  # Sorts columns, because only one row.
  expect_equal(sort_rows_cols(nrn), matrix(2:1, nrow = 1, dimnames = list(NULL, c("c1", "c2"))))
  # No column name
  ncn <- matrix(c(1,2), ncol = 1, dimnames = list(c("r2", "r1"), NULL)) 
  # Sorts rows, because only one column.
  expect_equal(sort_rows_cols(ncn), matrix(c(2, 1), ncol = 1, dimnames = list(c("r1", "r2"), NULL)))
  # Also works with lists
  # Sorts rows and columns for both m's.
  sortedm <- matrix(c(6, 3,
                      4, 1,
                      5, 2), byrow = TRUE, nrow = 3, dimnames = list(c("r1", "r3", "r5"), c("c2", "c4")))
  expect_equal(sort_rows_cols(list(m,m)), list(sortedm, sortedm))
  # Sort only row with a special order.
  sorted1 <- matrix(c(2, 5, 
                      1, 4,
                      3, 6), byrow = TRUE, nrow = 3, dimnames = list(c("r5", "r3", "r1"), c("c4", "c2")))
  expect_equal(sort_rows_cols(a = list(m,m), margin = 1, roworder = c("r5", "r3", "r1")), 
               list(sorted1, sorted1))
  # Columns are sorted as default, because no colorder is given.
  sorted2 <- matrix(c(4, 1, 
                      5, 2,
                      6, 3), byrow = TRUE, nrow = 3, dimnames = list(c("r3", "r5", "r1"), c("c2", "c4")))
  expect_equal(sort_rows_cols(a = list(m,m), margin = 2, roworder = c("r5", "r3", "r1")), 
               list(sorted2, sorted2))
  # Both columns and rows sorted, rows by the list, columns in natural order.
  sorted3 <- matrix(c(5, 2,
                      4, 1,
                      6, 3), byrow = TRUE, nrow = 3, dimnames = list(c("r5", "r3", "r1"), c("c2", "c4")))
  expect_equal(sort_rows_cols(a = list(m,m), margin = c(1,2), roworder = c("r5", "r3", "r1")), 
               list(sorted3, sorted3))
  
  # Ensure that rowtypes and coltypes, if present, are maintained
  mtypes <- m %>% setrowtype("row") %>% setcoltype("col")
  expect_equal(sort_rows_cols(mtypes), msorted %>% setrowtype("row") %>% setcoltype("col"))
})

test_that("sort_rows_cols works with different-length arguments for lists", {
  m <- matrix(c(1:4), nrow = 2, ncol = 2, dimnames = list(c("r2", "r1"), c("c1", "c2"))) %>% 
    setrowtype("row") %>% setcoltype("col")
  m_sorted <- matrix(c(2, 1, 4, 3), nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
    setrowtype("row") %>% setcoltype("col")
  mlist <- list(m, m)
  expect_equal(sort_rows_cols(mlist, margin = c(1,2), roworder = c("r1", "r2"), colorder = NA), 
               list(m_sorted, m_sorted))
  # Now try in a matrix with a list of lists
  DF <- data.frame(m = I(list()))
  DF[[1, "m"]] <- mlist
  DF[[2, "m"]] <- mlist
  DF[[3, "m"]] <- mlist
  res <- DF %>% 
    dplyr::mutate(
      sorted = sort_rows_cols(m)
    )
  expect_equal(res$sorted[[1]][[1]], m_sorted)
  expect_equal(res$sorted[[1]][[2]], m_sorted)
  expect_equal(res$sorted[[2]][[1]], m_sorted)
  expect_equal(res$sorted[[1]][[2]], m_sorted)
  expect_equal(res$sorted[[3]][[1]], m_sorted)
  expect_equal(res$sorted[[1]][[2]], m_sorted)
})

test_that("sort_rows_cols works when specifying a row or col name that isn't present in a", {
  m <- matrix(c(1:4), nrow = 2, ncol = 2, dimnames = list(c("r2", "r1"), c("c1", "c2"))) %>% 
    setrowtype("row") %>% setcoltype("col")
  sorted_m <- matrix(c(2, 4, 1, 3), byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
    setrowtype("row") %>% setcoltype("col")
  expect_equal(sort_rows_cols(m), sorted_m)
  # It should not matter that "r3" doesn't exist in m.
  expect_equal(sort_rows_cols(m, roworder = c("r1", "r2", "r3")), sorted_m)
  # It should not matter that "c3" doesn't exist in m.
  expect_equal(sort_rows_cols(m, colorder = c("c1", "c2", "c3")), sorted_m)
  expect_equal(sort_rows_cols(m, colorder = c("c100", "c42", "c2", "c1", "cmillion")), 
               matrix(c(4, 2, 3, 1), byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c2", "c1"))) %>% 
                 setrowtype("row") %>% setcoltype("col"))
  expect_equal(sort_rows_cols(m, colorder = c("c2")), 
               matrix(c(4, 3), nrow = 2, ncol = 1, dimnames = list(c("r1", "r2"), "c2")) %>% 
                 setrowtype("row") %>% setcoltype("col"))
})

test_that("sort_rows_cols fails when row and col names are not unique", {
  mrowprob <- matrix(c(1:4), nrow = 2, ncol = 2, dimnames = list(c("r1", "r1"), c("c1", "c1"))) %>% 
    setrowtype("row") %>% setcoltype("col")
  expect_error(sort_rows_cols(mrowprob), "Row names not unique")
  mcolprob <- matrix(c(1:4), nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c1"))) %>% 
    setrowtype("row") %>% setcoltype("col")
  expect_error(sort_rows_cols(mcolprob), "Column names not unique")
})

test_that("sort_rows_cols duplicates a row when requested", {
  m <- matrix(c(1:4), nrow = 2, ncol = 2, dimnames = list(c("r2", "r1"), c("c1", "c2"))) %>% 
    setrowtype("row") %>% setcoltype("col")
  expect_equal(sort_rows_cols(m, roworder = c("r1", "r1")), 
               matrix(c(2, 4,
                        2, 4), byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c("r1", "r1"), c("c1", "c2"))) %>% 
                 setrowtype("row") %>% setcoltype("col"))
})  

test_that("sort_rows_cols works when sorting rows but rows are not named", {
  m <- matrix(c(1:4), nrow = 2, ncol = 2, dimnames = list(NULL, c("c1", "c2"))) %>% 
    setrowtype("row") %>% setcoltype("col")
  # In this situation, nothing is done.  Expect that m will be returned.
  expect_equal(sort_rows_cols(m, margin = 1), m)
})

  
###########################################################
context("Completing rows and columns")
###########################################################

test_that("complete_rows_cols works as expected", {

  # a is NULL, matrix is NULL.  Error.
  expect_error(complete_rows_cols(a = NULL), "Both a and mat are NULL in complete_rows_cols.")
   
  # a is NULL, matrix is present.  
  # Create a matrix of same size as matrix with names of matrix and values equal to fill.
  expect_equal(complete_rows_cols(a = NULL, mat = matrix(1, nrow = 3, ncol = 2, dimnames = list(c("r1", "r2", "r3"), c("c1", "c2"))), fill = 42), 
               matrix(42, nrow = 3, ncol = 2, dimnames = list(c("r1", "r2", "r3"), c("c1", "c2"))))
  
  # a is a single number, matrix is NULL.  a is returned.
  expect_equal(complete_rows_cols(a = 42), 42)
  
  # a is a single number, a named matrix is present, and each item has length 1.  
  # This should fail. 
  # There is no way to know which row or column names are already present.
  # Therefore, there is now way to know how to complete the number a.
  expect_error(complete_rows_cols(a = 42, mat = matrix(0, nrow = 1, ncol = 1, dimnames = list("row", "col"))))
  
  # If you want to take a single number and convert it to 
  # a matrix with named rows and columns, use
  # complete_rows_cols(a = NULL, mat = matrix(0, nrow = 1, ncol = 1, dimnames = list("row", "col"), fill = <<your number>>).
  expect_equal(complete_rows_cols(a = NULL, 
                                  mat = matrix(0, nrow = 1, ncol = 1, dimnames = list("row", "col")), 
                                  fill = 42), 
               matrix(42, nrow = 1, ncol = 1, dimnames = list("row", "col")))
  
  # a is a matrix without dimnames, names is NULL, matrix is NULL.  a is returned.
  expect_equal(complete_rows_cols(a = matrix(42, nrow = 3, ncol = 2)), matrix(42, nrow = 3, ncol = 2))
   
  # a is a matrix without dimnames, a matrix names is present.  
  # This is a degenerate case.
  # We don't know what row and column names are already present in a.
  # So we can't know how to complete a with names from matrix.
  # This should give an error.
  expect_error(complete_rows_cols(a = matrix(42, nrow = 3, ncol = 2), 
                                  mat = matrix(0, nrow = 3, ncol = 2, 
                                                  dimnames = list(c("r1", "r2", "r3"), c("c1", "c2")))), 
               "Can't complete a that is missing dimnames with non-NULL dimnames on mat.")
   
  # a is a matrix with dimnames, matrix is NULL.  a is completed relative to itself
  expect_equal(complete_rows_cols(a = matrix(42, nrow = 2, ncol = 1, dimnames = list(c("r1", "r2"), "c1"))), 
               matrix(c(42, 0, 0, 
                        42, 0, 0, 
                         0, 0, 0), byrow = TRUE, 
                      nrow = 3, ncol = 3, dimnames = list(c("r1", "r2", "c1"), c("c1", "r1", "r2"))))
  
  # a is a matrix with dimnames, names is NULL, but matrix is present.  Take names from matrix to complete a.
  expect_equal(complete_rows_cols(a = matrix(c(1:6), nrow = 3, dimnames = list(c("r1", "r2", "r3"), c("c1", "c2"))),
                                  mat = matrix(42, nrow = 4, ncol = 3, 
                                                     dimnames = list(c("r1", "r2", "r3", "r4"), c("c1", "c2", "c3")))), 
               matrix(c(1, 4, 0, 
                        2, 5, 0,
                        3, 6, 0,
                        0, 0, 0), nrow = 4, ncol = 3, byrow = TRUE, 
                      dimnames = list(c("r1", "r2", "r3", "r4"), c("c1", "c2", "c3"))))

  # In this example, a is non-NULL and has dimnames.
  # But we have no names. 
  # There is no "names" argument, and matrix has no row or column names.
  # So there is no way to know how to complete a.
  # So we give a warning and complete m1 relative to itself.
  m1 <- matrix(c(1:6), nrow = 3, dimnames = list(c("r1", "r2", "r3"), c("c1", "c2")))
  m2 <- matrix(c(7:12), ncol = 3)
  expect_warning(complete_rows_cols(a = m1, mat = m2), 
                 "NULL names in complete_rows_cols, despite matrix being specified. Completing a relative to itself.") %>% 
    # Now test that the result is correct.
    expect_equal(matrix(c(1, 4, 0, 0, 0,
                          2, 5, 0, 0, 0, 
                          3, 6, 0, 0, 0, 
                          0, 0, 0, 0, 0, 
                          0, 0, 0, 0, 0), byrow = TRUE,
                        nrow = 5, ncol = 5, 
                        dimnames = list(c("r1", "r2", "r3", "c1", "c2"), c("c1", "c2", "r1", "r2", "r3"))))
  
  # Now give m2 some dimnames.
  m2 <- matrix(c(7:12), ncol = 3, dimnames = list(c("r2", "r3"), c("c2", "c3", "c4")))
  complete_m1_m2 <- matrix(c(1,4,0,0,
                             2,5,0,0,
                             3,6,0,0),
                           nrow = 3, byrow = TRUE, 
                           dimnames = list(c("r1", "r2", "r3"), c("c1", "c2", "c3", "c4")))
  # Adds empty columns c3 and c4
  expect_equal(complete_rows_cols(m1, m2), complete_m1_m2)
  # Creates columns r2, r3; rows c2, c3, c4
  expect_equal(complete_rows_cols(m1, t(m2)),
               matrix(c(1,4,0,0,
                        2,5,0,0,
                        3,6,0,0,
                        0,0,0,0,
                        0,0,0,0,
                        0,0,0,0), 
                      nrow = 6, byrow = TRUE, 
                      dimnames = list(c("r1", "r2", "r3", "c2", "c3", "c4"), c("c1", "c2", "r2", "r3"))))
  # No changes because r2 and r3 already present in m1
  expect_equal(complete_rows_cols(m1, m2, margin = 1), m1)
  # Adds empty columns c3 and c4
  expect_equal(complete_rows_cols(m1, m2, margin = 2), 
               matrix(c(1,4,0,0,
                        2,5,0,0,
                        3,6,0,0),
                      nrow = 3, byrow = TRUE,
                      dimnames = list(c("r1", "r2", "r3"), c("c1", "c2", "c3", "c4"))))
  # Adds empty rows c2, c3, c4
  expect_equal(complete_rows_cols(m1, t(m2), margin = 1), 
               matrix(c(1,4,
                        2,5,
                        3,6,
                        0,0,
                        0,0,
                        0,0), 
                      nrow = 6, byrow = TRUE, 
                      dimnames = list(c("r1", "r2", "r3", "c2", "c3", "c4"), c("c1", "c2"))))
  # Adds columns c3 and c4 with 100's
  expect_equal(complete_rows_cols(m1, m2, fill = 100), 
               matrix(c(1,4,100,100,
                        2,5,100,100,
                        3,6,100,100),
                      nrow = 3, byrow = TRUE, 
                      dimnames = list(c("r1", "r2", "r3"), c("c1", "c2", "c3", "c4"))))
  # Doesn't work with data frames.  Need a matrix.
  expect_error(complete_rows_cols(data.frame(m1), data.frame(m2)), 
               "a cannot be a data frame in complete_rows_cols.")
  # Nothing added, because everything already present
  expect_equal(complete_rows_cols(m1, m1), m1)
  # Adds empty rows c1, c2 ; Adds empty columns r1, r2, r3 
  expect_equal(complete_rows_cols(m1, t(m1)), 
               matrix(c(1,4,0,0,0,
                        2,5,0,0,0,
                        3,6,0,0,0,
                        0,0,0,0,0,
                        0,0,0,0,0),
                      nrow = 5, byrow = TRUE, 
                      dimnames = list(c("r1", "r2", "r3", "c1", "c2"), c("c1", "c2", "r1", "r2", "r3"))))
  # Same as previous. With missing matrix, complete relative to transpose of itself.
  expect_equal(complete_rows_cols(m1), 
               matrix(c(1,4,0,0,0,
                        2,5,0,0,0,
                        3,6,0,0,0,
                        0,0,0,0,0,
                        0,0,0,0,0),
                      nrow = 5, byrow = TRUE, 
                      dimnames = list(c("r1", "r2", "r3", "c1", "c2"), c("c1", "c2", "r1", "r2", "r3"))))
  # Adds rows r10, r11; cols c10, c11
  complete_m1_m2_new_names <- matrix(c(1,4,0,0,
                                       2,5,0,0,
                                       3,6,0,0,
                                       0,0,0,0,
                                       0,0,0,0),
                                     nrow = 5, byrow = TRUE,
                                     dimnames = list(c("r1", "r2", "r3", "r10", "r11"), c("c1", "c2", "c10", "c11")))
  expect_equal(complete_rows_cols(m1, mat = matrix(0, nrow = 2, ncol = 2, 
                                                      dimnames = list(c("r10", "r11"), c("c10", "c11")))), 
               complete_m1_m2_new_names)
  
  
  # Also works with lists
  expect_equal(complete_rows_cols(a = list(m1,m1)), list(complete_rows_cols(m1), complete_rows_cols(m1)))
  expect_equal(complete_rows_cols(a = list(m1,m1), mat = list(m2,m2)), list(complete_m1_m2, complete_m1_m2))
  # No changes because r2, r3 already present in m1
  expect_equal(complete_rows_cols(a = list(m1,m1), mat = list(m2,m2), margin = 1), list(m1, m1))
  expect_equal(complete_rows_cols(a = list(m1,m1), mat = list(m2,m2), margin = 2), 
               list(complete_m1_m2, complete_m1_m2))
  
  # Check what happens when a is a list but m1 is a single matrix.
  expect_equal(complete_rows_cols(a = list(m1,m1), mat = m2, margin = 1), list(m1, m1))
  
  # Test what happens when matrices are missing row or column names or both.
  A <- matrix(1:4, nrow = 2)
  expect_equal(complete_rows_cols(A), A)
  expect_equal(complete_rows_cols(A %>% magrittr::set_rownames(c("r1", "r2")) %>% magrittr::set_colnames(c("c1", "c2"))), 
               matrix(c(1, 3, 0, 0, 
                        2, 4, 0, 0, 
                        0, 0, 0, 0,
                        0, 0, 0, 0), byrow = TRUE, nrow = 4, ncol = 4,
                      dimnames = list(c("r1", "r2", "c1", "c2"), 
                                      c("c1", "c2", "r1", "r2")))
  )
  
  # Test with list for x and NULL for matrix
  expect_equal(complete_rows_cols(a = list(A, A)), list(A, A))
  B <- A %>% magrittr::set_rownames(c("r1", "r2")) %>% magrittr::set_colnames(c("c1", "c2")) %>% 
    setrowtype("row") %>% setcoltype("col")
  B_completed <- matrix(c(1, 3, 0, 0, 
                          2, 4, 0, 0, 
                          0, 0, 0, 0, 
                          0, 0, 0, 0), byrow = TRUE, nrow = 4, ncol = 4,
                        dimnames = list(c("r1", "r2", "c1", "c2"), c("c1", "c2", "r1", "r2"))) %>% 
    setrowtype("row") %>% setcoltype("col")
  expect_equal(complete_rows_cols(a = B), B_completed)
  expect_equal(complete_rows_cols(a = list(B, B)), list(B_completed, B_completed))
  
  B_filled <- matrix(42, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
    setrowtype("row") %>% setcoltype("col")
  expect_equal(complete_rows_cols(mat = list(B, B), fill = 42), list(B_filled, B_filled))
})

test_that("completing fails when dimnames aren't present for a", {
  a <- matrix(1:4, byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(NULL, c("c1", "c2")))
  mata <- matrix(1:6, byrow = TRUE, nrow = 3, ncol = 2, dimnames = list(c("r1", "r2", "r3"), c("c1", "c2")))
  expect_error(complete_rows_cols(a = a, mat = mata, margin = 1), 
               "NULL dimnames for margin = 1 on a")
  
  b <- matrix(1:4, byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), NULL))
  matb <- matrix(1:6, byrow = TRUE, nrow = 3, ncol = 2, dimnames = list(c("r1", "r2", "r3"), c("c1", "c2")))
  expect_error(complete_rows_cols(a = b, mat = matb, margin = 2), 
               "NULL dimnames for margin = 2 on a")
})

test_that("completing works when list is present and lists and ... have different lengths", {
  m1 <- matrix(c(1:6), nrow = 3, dimnames = list(c("r1", "r2", "r3"), c("c1", "c2")))
  m2 <- matrix(c(7:12), ncol = 3, dimnames = list(c("r2", "r3"), c("c2", "c3", "c4")))
  complete_m1_m2 <- matrix(c(1,4,0,0,
                             2,5,0,0,
                             3,6,0,0),
                           nrow = 3, byrow = TRUE, 
                           dimnames = list(c("r1", "r2", "r3"), c("c1", "c2", "c3", "c4")))
  # Adds empty columns c3 and c4
  expect_equal(complete_rows_cols(m1, m2), complete_m1_m2)
  # Try in a list
  expect_equal(complete_rows_cols(a = list(m1, m1, m1), 
                                  mat = list(m2, m2, m2)), 
                                  list(complete_m1_m2, complete_m1_m2, complete_m1_m2))
  # Now try with different arguments
  expect_equal(complete_rows_cols(m1, m2, fill = 0, margin = c(1,2)), complete_m1_m2)
  # And in a list
  expect_equal(complete_rows_cols(list(m1, m1, m1), list(m2, m2, m2), fill = 0, margin = c(1,2)), 
               list(complete_m1_m2, complete_m1_m2, complete_m1_m2))
})

test_that("complete_rows_cols works correctly when x is unspecified and fillrow is specified", {
  mat <- matrix(c(11, 12, 21, 22), byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2")))
  # Try with wrong dimnames
  expect_error(complete_rows_cols(mat = mat, fillrow = matrix(42, nrow = 1, ncol = 2, dimnames = list("r42", c("c3", "c4")))), 
               "colnames of fillrow must match colnames of mat in complete_rows_cols.")
  expect_equal(complete_rows_cols(mat = mat, fillrow = matrix(c(11, 12), nrow = 1, ncol = 2, dimnames = list("r42", c("c1", "c2")))), 
               matrix(c(11, 12, 
                        11, 12), byrow = TRUE, nrow = 2, ncol = 2, dimnames = dimnames(mat)))
})

test_that("complete_rows_cols works correctly when x is unspecified and fillcol is specified", {
  mat <- matrix(c(11, 12, 21, 22), byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2")))
  # Try with wrong dimnames
  expect_error(complete_rows_cols(mat = mat, fillcol = matrix(42, nrow = 2, ncol = 1, dimnames = list(c("r3", "r4"), "c42"))), 
               "rownames of fillcol must match rownames of mat in complete_rows_cols.")
  # Try with correct dimnames
  expect_equal(complete_rows_cols(mat = mat, fillcol = matrix(c(11, 21), nrow = 2, ncol = 1, dimnames = list(c("r1", "r2"), "c42"))), 
               matrix(c(11, 11, 
                        21, 21), byrow = TRUE, nrow = 2, ncol = 2, dimnames = dimnames(mat)))
})

test_that("complete_rows_cols works correctly when fillrow is specified.", {
  a <- matrix(c(11, 12, 21, 22), byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2")))
  b <- matrix(c(1:6), byrow = TRUE, nrow = 3, ncol = 2, dimnames = list(c("r1", "r2", "r3"), c("c1", "c2")))
  # Test for problematic cases.
  # fillrow is not a matrix
  expect_error(complete_rows_cols(a, b, fillrow = 42), "fillrow must be a matrix in complete_rows_cols.")
  # Number of rows is greater than 1
  fillrow_tall <- matrix(c(42, 42), nrow = 2, ncol = 1, dimnames = list(c("r43", "r44"), "c2"))
  expect_error(complete_rows_cols(a, b, fillrow = fillrow_tall), "fillrow must be a matrix with one row in complete_rows_cols.")
  # Number of columns doesn't match
  fillrow_wide <- matrix(42, nrow = 1, ncol = 3, dimnames = list("r42", c("c1", "c2", "c3")))
  expect_equal(complete_rows_cols(a, b, fillrow = fillrow_wide), 
               matrix(c(11, 12, 
                        21, 22, 
                        42, 42), byrow = TRUE, nrow = 3, ncol = 2, dimnames = list(c("r1", "r2", "r3"), c("c1", "c2"))))
  # Column names of fillrow don't match column names of x
  fillrow_badnames <- matrix(c(31, 32), byrow = TRUE, nrow = 1, ncol = 2, dimnames = list("r42", c("c3", "c4")))
  expect_error(complete_rows_cols(a = a, mat = b, fillrow = fillrow_badnames), "Some columns of matrix a are not present in matrix fillrow in complete_rows_cols.")
  # Test a case that should work
  fillrow <- matrix(c(31, 32), byrow = TRUE, nrow = 1, ncol = 2, dimnames = list("r42", c("c1", "c2")))
  expect_equal(complete_rows_cols(a = a, mat = b, fillrow = fillrow), 
               matrix(c(11, 12,
                        21, 22,
                        31, 32), byrow = TRUE, nrow = 3, ncol = 2, dimnames = list(c("r1", "r2", "r3"), c("c1", "c2"))))
})

test_that("complete_rows_cols works correctly when fillcol is specified.", {
  a <- matrix(c(11, 12, 21, 22), byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2")))
  b <- matrix(c(1:6), byrow = TRUE, nrow = 2, ncol = 3, dimnames = list(c("r1", "r2"), c("c1", "c2", "c3")))
  # Test for problematic cases.
  # fillcol is not a matrix
  expect_error(complete_rows_cols(a, b, fillcol = 42), "fillcol must be a matrix in complete_rows_cols.")
  # Number of columns is greater than 1
  fillcol_wide <- matrix(c(42, 42), nrow = 1, ncol = 2, dimnames = list("r42", c("c42", "c43")))
  expect_error(complete_rows_cols(a, b, fillcol = fillcol_wide), "fillcol must be a matrix with one column in complete_rows_cols.")
  # Number of rows doesn't match
  fillcol_tall <- matrix(42, nrow = 3, ncol = 1, dimnames = list(c("r1", "r2", "r3"), "c3"))
  expect_equal(complete_rows_cols(a, b, fillcol = fillcol_tall), 
               matrix(c(11, 12, 42, 
                        21, 22, 42), byrow = TRUE, nrow = 2, ncol = 3, dimnames = list(c("r1", "r2"), c("c1", "c2", "c3"))))
  # Row names of fillcol don't match row names of x
  fillcol_badnames <- matrix(c(13, 23), nrow = 2, ncol = 1, dimnames = list(c("r3", "r4"), "c1"))
  expect_error(complete_rows_cols(a = a, mat = b, fillcol = fillcol_badnames), "Some rows of matrix a are not present in matrix fillcol in complete_rows_cols.")
  # Test a case that should work
  fillcol <- matrix(c(13, 23), nrow = 2, ncol = 1, dimnames = list(c("r1", "r2"), "c42"))
  expect_equal(complete_rows_cols(a = a, mat = b, fillcol = fillcol), 
               matrix(c(11, 12, 13,
                        21, 22, 23), byrow = TRUE, nrow = 2, ncol = 3, dimnames = list(c("r1", "r2"), c("c1", "c2", "c3"))))
})

test_that("fillrow, fillcol collisions work as expected.", {
  mat <- matrix(c(11, 12, 21, 22), byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2")))
  fillrow <- matrix(c(11, 12), byrow = TRUE, nrow = 1, ncol = 2, dimnames = list("r42", c("c1", "c2")))
  fillcol <- matrix(c(11, 21), nrow = 2, ncol = 1, dimnames = list(c("r1", "r2"), "c42"))
  expect_equal(complete_rows_cols(mat = mat, fillrow = fillrow, fillcol = fillcol), 
               matrix(c(11, 12,
                        11, 12), byrow = TRUE, nrow = 2, ncol = 2, dimnames = dimnames(mat)))
})

test_that("complete_rows_cols works when orders are different for row fill.", {
  a <- matrix(c(21, 22), byrow = TRUE, nrow = 1, ncol = 2, dimnames = list("r2", c("c1", "c2")))
  mat <- matrix(c(11, 12, 21, 22), byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2")))
  fillrow <- matrix(c(1, 2), byrow = TRUE, nrow = 1, ncol = 2, dimnames = list("row", c("c1", "c2")))
  # fillrow is added to the bottom, as expected.
  expect_equal(complete_rows_cols(a = a, mat = mat, fillrow = fillrow, margin = 1), 
               matrix(c(21, 22, 1, 2), byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c("r2", "r1"), c("c1", "c2"))))
  # Now try with a fillrow that has different column names. Should give an error.
  fillrow <- matrix(c(2, 1), byrow = TRUE, nrow = 1, ncol = 2, dimnames = list("row", c("c1", "c42")))
  expect_error(complete_rows_cols(a = a, mat = mat, fillrow = fillrow, margin = 1), 
               "Some columns of matrix a are not present in matrix fillrow in complete_rows_cols.")
  # Now try with a fillrow that has the correct column names, but they are out of order.
  # This works, because complete_rows_cols sorts the columns of fillrow to match
  # the columns of a.
  fillrow <- matrix(c(2, 1), byrow = TRUE, nrow = 1, ncol = 2, dimnames = list("row", c("c2", "c1")))
  expect_equal(complete_rows_cols(a = a, mat = mat, fillrow = fillrow, margin = 1), 
               matrix(c(21, 22, 1, 2), byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c("r2", "r1"), c("c1", "c2"))))
  # Try with duplicated column names in matrix a.
  a_dup <- matrix(c(1, 2), nrow = 1, ncol = 2, dimnames = list("r1", c("c1", "c1")))
  expect_error(complete_rows_cols(a = a_dup, mat = mat, fillrow = fillrow, margin = 1), 
               "Duplicated column names found in matrix a in complete_rows_cols.")
  # Try with duplicated column names in fillrow.
  fillrow_dup <- matrix(c(1, 2), nrow = 1, ncol = 2, dimnames = list("row", c("c1", "c1")))
  expect_error(complete_rows_cols(a = a, mat = mat, fillrow = fillrow_dup, margin = 1), 
               "Duplicated column names found in matrix fillrow in complete_rows_cols.")
})

test_that("complete_rows_cols works when orders are different for column fill.", {
  a <- matrix(c(11, 21), nrow = 2, ncol = 1, dimnames = list(c("r1", "r2"), "c2"))
  mat <- matrix(c(11, 12, 21, 22), byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2")))
  fillcol <- matrix(c(1, 2), nrow = 2, ncol = 1, dimnames = list(c("r1", "r2"), "col"))
  # fillcol is added at the right, as expected.
  expect_equal(complete_rows_cols(a = a, mat = mat, fillcol = fillcol, margin = 2), 
               matrix(c(11, 1, 21, 2), byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c2", "c1"))))
  # Now try with a fillcol that has different column names. Should give an error.
  fillcol <- matrix(c(2, 1),nrow = 2, ncol = 1, dimnames = list(c("r2", "r42"), "col"))
  expect_error(complete_rows_cols(a = a, mat = mat, fillcol = fillcol, margin = 2), 
               "Some rows of matrix a are not present in matrix fillcol in complete_rows_cols.")
  # Now try with a fillcol that has the correct row names, but they are out of order.
  # This works, because complete_rows_cols sorts the rows of fillcol to match
  # the columns of a.
  fillcol <- matrix(c(2, 1), nrow = 2, ncol = 1, dimnames = list(c("r2", "r1"), "col"))
  expect_equal(complete_rows_cols(a = a, mat = mat, fillcol = fillcol, margin = 2), 
               matrix(c(11, 1, 
                        21, 2), byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c2", "c1"))))
  # Try with duplicated row names in matrix a.
  a_dup <- matrix(c(1, 2), nrow = 2, ncol = 1, dimnames = list(c("r1", "r1"), "c1"))
  expect_error(complete_rows_cols(a = a_dup, mat = mat, fillcol = fillcol, margin = 2), 
               "Duplicated row names found in matrix a in complete_rows_cols.")
  # Try with duplicated row names in fillcol.
  fillcol_dup <- matrix(c(1, 2), nrow = 2, ncol = 1, dimnames = list(c("r1", "r1"), "col"))
  expect_error(complete_rows_cols(a = a, mat = mat, fillcol = fillcol_dup, margin = 2), 
               "Duplicated row names found in matrix fillcol in complete_rows_cols.")
})



###########################################################
context("Completing and sorting matrices")
###########################################################

test_that("complete_and_sort works as expected", {
  m1 <- matrix(c(1:6), nrow = 3, dimnames = list(c("r1", "r2", "r3"), c("c2", "c1")))
  m2 <- matrix(c(7:12), ncol = 3, dimnames = list(c("r3", "r4"), c("c2", "c3", "c4")))
  m1_completed <- matrix(c(0,0,0,0,0,
                           0,0,0,0,0,
                           4,1,0,0,0,
                           5,2,0,0,0,
                           6,3,0,0,0), 
                         nrow = 5, ncol = 5, byrow = TRUE, 
                         dimnames = list(c("c1", "c2", "r1", "r2", "r3"), c("c1", "c2", "r1", "r2", "r3")))
  m2_completed <- matrix(c(0,0,0,0,0,
                           0,0,0,0,0,
                           0,0,0,0,0,
                           7,9,11,0,0,
                           8,10,12,0,0), 
                         nrow = 5, ncol = 5, byrow = TRUE,
                         dimnames = list(c("c2", "c3", "c4", "r3", "r4"), c("c2", "c3", "c4", "r3", "r4")))
  m1m2_completed <- list(a = matrix(c(4,1,0,0,
                                      5,2,0,0,
                                      6,3,0,0,
                                      0,0,0,0),
                                    nrow = 4, ncol = 4, byrow = TRUE,
                                    dimnames = list(c("r1", "r2", "r3", "r4"), c("c1", "c2", "c3", "c4"))), 
                         b = matrix(c(0,0,0,0,
                                      0,0,0,0,
                                      0,7,9,11,
                                      0,8,10,12),
                                    nrow = 4, ncol = 4, byrow = TRUE,
                                    dimnames = list(c("r1", "r2", "r3", "r4"), c("c1", "c2", "c3", "c4"))))
  
  # Complete relative to itself
  expect_equal(complete_and_sort(m1), m1_completed)
  expect_equal(complete_and_sort(m2), m2_completed)
  
  # Complete relative to each other
  expect_equal(complete_and_sort(m1, m2), m1m2_completed)
  
  # Specify row order. Unspecified rows are dropped
  expect_equal(complete_and_sort(m1, m2, roworder = c("r3", "r2", "r1")), 
               list(a = matrix(c(6,3,0,0,
                                 5,2,0,0,
                                 4,1,0,0),
                               nrow = 3, ncol = 4, byrow = TRUE,
                               dimnames = list(c("r3", "r2", "r1"), c("c1", "c2", "c3", "c4"))), 
                    b = matrix(c(0,7,9,11,
                                 0,0,0,0,
                                 0,0,0,0),
                               nrow = 3, ncol = 4, byrow = TRUE,
                               dimnames = list(c("r3", "r2", "r1"), c("c1", "c2", "c3", "c4")))))
  
  # Specify column order. Unspecified columns are dropped
  expect_equal(complete_and_sort(m1, m2, colorder = c("c4", "c3")), 
               list(a = matrix(c(0,0,
                                 0,0,
                                 0,0,
                                 0,0),
                               nrow = 4, ncol = 2, byrow = TRUE,
                               dimnames = list(c("r1", "r2", "r3", "r4"), c("c4", "c3"))), 
                    b = matrix(c(0,0,
                                 0,0,
                                 11,9,
                                 12,10),
                               nrow = 4, ncol = 2, byrow = TRUE,
                               dimnames = list(c("r1", "r2", "r3", "r4"), c("c4", "c3")))))
  
  # Complete and sort for rows only
  expect_equal(complete_and_sort(m1, m2, margin = 1), 
               list(a = matrix(c(1,4,
                                 2,5,
                                 3,6,
                                 0,0),
                               nrow = 4, ncol = 2, byrow = TRUE,
                               dimnames = list(c("r1", "r2", "r3", "r4"), c("c2", "c1"))), 
                    b = matrix(c(0,0,0,
                                 0,0,0,
                                 7,9,11,
                                 8,10,12),
                               nrow = 4, ncol = 3, byrow = TRUE,
                               dimnames = list(c("r1", "r2", "r3", "r4"), c("c2", "c3", "c4")))))
  
  # Complete and sort for columns only
  expect_equal(complete_and_sort(m1, m2, margin = 2), 
               list(a = matrix(c(4,1,0,0,
                                 5,2,0,0,
                                 6,3,0,0),
                               nrow = 3, ncol = 4, byrow = TRUE,
                               dimnames = list(c("r1", "r2", "r3"), c("c1", "c2", "c3", "c4"))), 
                    b = matrix(c(0,7,9,11,
                                 0,8,10,12),
                               nrow = 2, ncol = 4, byrow = TRUE,
                               dimnames = list(c("r3", "r4"), c("c1", "c2", "c3", "c4")))))
  
  # transpose m2. Get lots of rows and columns.
  expect_equal(complete_and_sort(m1, t(m2)), 
               list(a = matrix(c(0,0,0,0,
                                 0,0,0,0,
                                 0,0,0,0,
                                 4,1,0,0,
                                 5,2,0,0,
                                 6,3,0,0),
                               nrow = 6, ncol = 4, byrow = TRUE,
                               dimnames = list(c("c2", "c3", "c4", "r1", "r2", "r3"), c("c1", "c2", "r3", "r4"))), 
                    b = matrix(c(0,0,7,8,
                                 0,0,9,10,
                                 0,0,11,12,
                                 0,0,0,0,
                                 0,0,0,0,
                                 0,0,0,0),
                               nrow = 6, ncol = 4, byrow = TRUE,
                               dimnames = list(c("c2", "c3", "c4", "r1", "r2", "r3"), c("c1", "c2", "r3", "r4")))))
  
  expect_equal(complete_and_sort(m1, t(m2), margin = 1), 
               list(a = matrix(c(0,0,
                                 0,0,
                                 0,0,
                                 1,4,
                                 2,5,
                                 3,6),
                               nrow = 6, ncol = 2, byrow = TRUE,
                               dimnames = list(c("c2", "c3", "c4", "r1", "r2", "r3"), c("c2", "c1"))), 
                    b = matrix(c(7,8,
                                 9,10,
                                 11,12,
                                 0,0,
                                 0,0,
                                 0,0),
                               nrow = 6, ncol = 2, byrow = TRUE,
                               dimnames = list(c("c2", "c3", "c4", "r1", "r2", "r3"), c("r3", "r4")))))
  
  expect_equal(complete_and_sort(m1, t(m2), margin = 2), 
               list(a = matrix(c(4,1,0,0,
                                 5,2,0,0,
                                 6,3,0,0),
                               nrow = 3, ncol = 4, byrow = TRUE,
                               dimnames = list(c("r1", "r2", "r3"), c("c1", "c2", "r3", "r4"))), 
                    b = matrix(c(0,0,7,8,
                                 0,0,9,10,
                                 0,0,11,12),
                               nrow = 3, ncol = 4, byrow = TRUE,
                               dimnames = list(c("c2", "c3", "c4"), c("c1", "c2", "r3", "r4")))))
  
  v <- matrix(1:6, ncol = 2, dimnames = list(c("r3", "r1", "r2"), c("c2", "c1")))
  expect_equal(complete_and_sort(v, v), 
               list(a = matrix(c(5,2,
                                 6,3,
                                 4,1),
                               nrow = 3, ncol = 2, byrow = TRUE,
                               dimnames = list(c("r1", "r2", "r3"), c("c1", "c2"))), 
                    b = matrix(c(5,2,
                                 6,3,
                                 4,1),
                               nrow = 3, ncol = 2, byrow = TRUE,
                               dimnames = list(c("r1", "r2", "r3"), c("c1", "c2")))))
  
  # Also works with lists
  expect_equal(complete_and_sort(list(m1,m1), list(m2,m2)), 
               list(a = list(m1m2_completed$a, m1m2_completed$a), b = list(m1m2_completed$b, m1m2_completed$b)))
  
  # Should return unmodified matrices if row or column names are missing.
  m_bare <- matrix(c(1:4), nrow = 2)
  # Given no dimnames on m_bare, it is returned unmodified.
  expect_equal(complete_and_sort(m_bare, margin = 1), m_bare)
  expect_equal(complete_and_sort(m_bare, margin = 2), m_bare)
  m_rownames <- matrix(c(1:4), nrow = 2, dimnames = list(c("r2", "r1"), NULL))
  expect_equal(complete_and_sort(m_rownames, m1, margin = 1), 
               list(a = matrix(c(2,4,
                                 1,3,
                                 0,0),
                               nrow = 3, ncol = 2, byrow = TRUE,
                               dimnames = list(c("r1", "r2", "r3"), NULL)),
                    b = matrix(c(1,4,
                                 2,5,
                                 3,6),
                               nrow = 3, ncol = 2, byrow = TRUE,
                               dimnames = list(c("r1", "r2", "r3"), c("c2", "c1")))))
  m_colnames <- matrix(c(1:6), nrow = 2, dimnames = list(NULL, c("c3", "c2", "c1")))
  expect_equal(complete_and_sort(m_colnames, m1, margin = 2),
               list(a = matrix(c(5,3,1,
                                 6,4,2),
                               nrow = 2, ncol = 3, byrow = TRUE,
                               dimnames = list(NULL, c("c1", "c2", "c3"))),
                    b = matrix(c(4,1,0,
                                 5,2,0,
                                 6,3,0),
                               nrow = 3, ncol = 3, byrow = TRUE,
                               dimnames = list(c("r1", "r2", "r3"), c("c1", "c2", "c3")))))
  # Now try with matrices that have no dimnames
  a <- matrix(1:4, nrow = 2)
  b <- matrix(1:4, nrow = 2)
  expect_equal(complete_and_sort(a, b), list(a = a, b = b))
})

test_that("complete_and_sort preserves row and column types", {
  # a and b are same matrices.
  # Completing and sorting against each other should produce a (or b).
  a <- matrix(c(1:4), nrow = 2, dimnames = list(c("p1", "p2"), c("i1", "i2"))) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  b <- matrix(c(1:4), nrow = 2, dimnames = list(c("p1", "p2"), c("i1", "i2"))) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  expect_equal(complete_rows_cols(a, b), a)
  expect_equal(complete_rows_cols(b, a), b)
  expect_equal(complete_and_sort(a, b), list(a = a, b = a))
  expect_equal(complete_and_sort(a, b), list(a = b, b = a))
})


###########################################################
context("Utilities")
###########################################################

test_that("make_list works as expected", {
  m <- matrix(c(1:6), nrow = 3, dimnames = list(c("r1", "r2", "r3"), c("c2", "c1")))

  expect_equal(make_list(m, n = 1), list(m))
  expect_equal(make_list(m, n = 2), list(m, m))
  expect_equal(make_list(m, n = 5), list(m, m, m, m, m))
  l1 <- list(c(1,2), c(3,4))
  # Expect c(1,2), c(3,4), c(1,2), c(3,4)
  expect_equal(make_list(l1, n = 4), c(l1, l1))
  # Expect [c(1,2), c(3,4)], [c(1,2), c(3,4)], [c(1,2), c(3,4)], [c(1,2), c(3,4)]
  expect_equal(make_list(l1, n = 4, lenx = 1), list(l1, l1, l1, l1))
  # Expect a warning, because length isn't a multiple
  expect_warning(make_list(l1, n = 3), "n not evenly divisible by length\\(x\\)")
  
  m1 <- matrix(1:4, nrow = 2)
  m2 <- m + 100
  l2 <- list(m1, m2)
  expect_equal(make_list(l2, n = 4), c(l2, l2))
  expect_warning(make_list(l2, n = 1), "n not evenly divisible by length\\(x\\)")
  expect_warning(make_list(l2, n = 5), "n not evenly divisible by length\\(x\\)")
  
  l3 <- list(c("r10", "r11"), c("c10", "c11"))
  expect_equal(make_list(l3, n = 2), l3) # Confused by x being a list
  expect_equal(make_list(l3, n = 2, lenx = 1), list(l3, l3)) # Fix by setting lenx = 1
  
  margin <- c(1, 2)
  # This approach spreads 1, 2 to the two items in the list.
  expect_equal(make_list(margin, n = 2), list(1, 2))
  # This approach considers c(1,2) to be the item to be repeated.
  expect_equal(make_list(margin, n = 2, lenx = 1), list(c(1,2), c(1,2)))
})
  
