###########################################################
context("Hatize and Inverse")
###########################################################

test_that("hatinv_byname works as expected", {
  # Test with a column vector
  v <- matrix(1:10, ncol = 1, dimnames = list(c(paste0("i", 1:10)), c("p1"))) %>%
    setrowtype("Industries") %>% setcoltype(NA)
  expect_equal(hatinv_byname(v), v %>% hatize_byname() %>% invert_byname())
  # Test with a row vector
  r <- matrix(1:5, nrow = 1, dimnames = list(c("r1"), c(paste0("c", 1:5)))) %>%
    setrowtype(NA) %>% setcoltype("Commodities")
  expect_equal(hatinv_byname(r), r %>% hatize_byname() %>% invert_byname())
  # Test with a list
  v_list <- list(v, v)
  expect_equal(hatinv_byname(v_list), v_list %>% hatize_byname() %>% invert_byname())
  # Test with a data frame
  DF <- data.frame(v_list = I(list()))
  DF[[1, "v_list"]] <- v
  DF[[2, "v_list"]] <- v
  DF <- DF %>% 
    dplyr::mutate(
      hatinv = hatinv_byname(v_list)
    )
  DF_expected <- data.frame(v_list = I(list()), hatinv = I(list()))
  DF_expected[[1, "v_list"]] <- v
  DF_expected[[2, "v_list"]] <- v
  DF_expected[[1, "hatinv"]] <- v %>% hatize_byname() %>% invert_byname()
  DF_expected[[2, "hatinv"]] <- v %>% hatize_byname() %>% invert_byname()
  # The hatinv column of DF_expected will have class = 'AsIs', but
  # the hatinv column of DF will have no class attribute.  
  # Eliminate that mismatch.
  attr(DF_expected$hatinv, which = "class") <- NULL
  expect_equal(DF, DF_expected)
  # Test when one of the elements of v is 0.
  v2 <- matrix(0:1, ncol = 1, dimnames = list(c(paste0("i", 0:1)), c("p1"))) %>%
    setrowtype("Industries") %>% setcoltype(NA)
  expect_equal(hatinv_byname(v2), matrix(c(.Machine$double.xmax, 0,
                                           0, 1), 
               nrow = 2, ncol = 2, byrow = TRUE,
               dimnames = list(c(paste0("i", 0:1)), c(paste0("i", 0:1)))) %>%  
               setrowtype("Industries") %>% setcoltype("Industries"))
  # Test when we want the 0 element of v to give Inf instead of .Machine$double.xmax.
  expect_equal(hatinv_byname(v2, inf_becomes = NULL), matrix(c(Inf, 0,
                                                               0, 1), 
                                                             nrow = 2, ncol = 2, byrow = TRUE,
                                                             dimnames = list(c(paste0("i", 0:1)), c(paste0("i", 0:1)))) %>%  
                 setrowtype("Industries") %>% setcoltype("Industries"))
})


###########################################################
context("Absolute value")
###########################################################

test_that("abs_byname works as expected", {
  expect_equal(abs_byname(1), 1)
  expect_equal(abs_byname(-1), 1)
  m <- matrix(c(-10,1,1,100), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("c", 1:2))) %>%
    setrowtype("Industry") %>% setcoltype("Commodity")
  expect_equal(abs_byname(m), abs(m))
})


###########################################################
context("Log and Exp")
###########################################################

test_that("log_byname works as expected", {
  expect_equal(log_byname(exp(1)), 1)
  m <- matrix(c(10,1,1,100), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("p", 1:2))) %>%
    setrowtype("Industry") %>% setcoltype("Product")
  
  expect_equal(log_byname(m), 
               matrix(c(2.302585, 0, 
                        0, 4.60517), byrow = TRUE, nrow = 2, ncol = 2,
                      dimnames = list(c("i1", "i2"), c("p1", "p2"))) %>% 
                 setrowtype("Industry") %>% setcoltype("Product"), 
               tolerance = 1e-7)
  expected_log10 <- matrix(c(1, 0, 
                             0, 2), byrow = TRUE, nrow = 2, ncol = 2,
                           dimnames = list(c("i1", "i2"), c("p1", "p2"))) %>% 
    setrowtype("Industry") %>% setcoltype("Product")
  expect_equal(log_byname(m, base = 10), expected_log10)
  # Also works with lists
  expect_equal(log_byname(list(m, m), base = 10), list(expected_log10, expected_log10))
})

test_that("exp_byname works as expected", {
  expect_equal(exp_byname(1), exp(1))
  m <- matrix(c(log(10),log(1),log(1),log(100)), 
              nrow = 2, dimnames = list(paste0("i", 1:2), paste0("p", 1:2))) %>%
    setrowtype("Industry") %>% setcoltype("Product")
  expected <- matrix(c(10, 1,
                       1, 100), byrow = TRUE, nrow = 2, ncol = 2, 
                     dimnames = list(c("i1", "i2"), c("p1", "p2"))) %>% 
    setrowtype("Industry") %>% setcoltype("Product")
  expect_equal(exp_byname(m), expected)
  # Also works for lists.
  expect_equal(exp_byname(list(m, m)), list(expected, expected))
})
  
  
###########################################################
context("Inversion")
###########################################################

test_that("invert_byname works as expected", {
  m <- matrix(c(10,0,0,100), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("p", 1:2))) %>%
    setrowtype("Industries") %>% setcoltype("Products")
  # For matrix inversion, rows become columns and columns become rows.
  # Furthermore, the types on rows and columns are flipped.
  minv <- matrix(c(0.1, 0, 0, 0.01), nrow = 2, dimnames = list(colnames(m), rownames(m))) %>% 
    setrowtype(coltype(m)) %>% setcoltype(rowtype(m))
  expect_equal(invert_byname(m), minv)
  expect_equal(matrixproduct_byname(m, invert_byname(m)), 
               matrix(c(1,0,0,1), nrow = 2, dimnames = list(rownames(m), rownames(m))) %>% 
                 setrowtype(rowtype(m)) %>% setcoltype(rowtype(m)))
  expect_equal(matrixproduct_byname(invert_byname(m), m), 
               matrix(c(1,0,0,1), nrow = 2, dimnames = list(colnames(m), colnames(m))) %>% 
                 setrowtype(coltype(m)) %>% setcoltype(coltype(m)))
  # Also works for lists
  expect_equal(invert_byname(list(m,m)), list(minv, minv))
  # Also works for data frames
  DF <- data.frame(m = I(list()))
  DF[[1, "m"]] <- m
  DF[[2, "m"]] <- m
  expect_equal(invert_byname(DF$m), list(minv, minv))
  DF_expected <- data.frame(m = I(list()), minv = I(list()))
  DF_expected[[1, "m"]] <- m
  DF_expected[[2, "m"]] <- m
  DF_expected[[1, "minv"]] <- minv
  DF_expected[[2, "minv"]] <- minv
  # Because DF_expected$minv is created with I(list()), its class is "AsIs".
  # Because DF$minv is created from an actual calculation, its class is NULL.
  # Need to set the class of DF_expected$minv to NULL to get a match.
  attr(DF_expected$minv, which = "class") <- NULL
  expect_equal(DF %>% dplyr::mutate(minv = invert_byname(m)), DF_expected)
})


###########################################################
context("Transpose")
###########################################################

test_that("transpose_byname works as expected", {
  m <- matrix(c(11,21,31,12,22,32), ncol = 2, dimnames = list(paste0("i", 1:3), paste0("p", 1:2))) %>%
    setrowtype("Industries") %>% setcoltype("Products")
  mT <- matrix(c(11, 12, 21, 22, 31, 32), nrow = 2, dimnames = list(paste0("p", 1:2), paste0("i", 1:3))) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  expect_equal(transpose_byname(m), mT)
  # Works for lists
  expect_equal(transpose_byname(list(m,m)), list(mT, mT))
  # Works for data frames
  DF <- data.frame(m = I(list()))
  DF[[1,"m"]] <- m
  DF[[2,"m"]] <- m
  expect_equal(transpose_byname(DF$m), list(mT, mT))
  DF_expected <- data.frame(m = I(list()), mT = I(list()))
  DF_expected[[1, "m"]] <- m
  DF_expected[[2, "m"]] <- m
  DF_expected[[1, "mT"]] <- mT
  DF_expected[[2, "mT"]] <- mT
  # Because DF_expected$mT is created with I(list()), its class is "AsIs".
  # Because DF$mT is created from an actual calculation, its class is NULL.
  # Need to set the class of DF_expected$mT to NULL to get a match.
  attr(DF_expected$mT, which = "class") <- NULL
  expect_equal(DF %>% dplyr::mutate(mT = transpose_byname(m)), DF_expected)
})

test_that("transpose_byname works with lists of lists", {
  m <- matrix(c(11,21,31,12,22,32), ncol = 2, dimnames = list(paste0("i", 1:3), paste0("p", 1:2))) %>%
    setrowtype("Industries") %>% setcoltype("Products")
  mT <- matrix(c(11, 12, 21, 22, 31, 32), nrow = 2, dimnames = list(paste0("p", 1:2), paste0("i", 1:3))) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  
  # Here, we put a list of matrices into subsequent rows of a column of a data frame.
  # The unaryapply_byname function should recursively 
  # work its way down to the point where it finds matrices upon which it operates.
  listofm <- list(a = m, b = m)
  DF <- data.frame(listofm = I(list()))
  DF[[1,"listofm"]] <- listofm
  DF[[2,"listofm"]] <- listofm
  
  res <- DF %>% dplyr::mutate(
    listofmT = transpose_byname(listofm)
  )
  expect_equal(res$listofmT[[1]][[1]], mT)
  expect_equal(res$listofmT[[1]][[2]], mT)
  expect_equal(res$listofmT[[2]][[1]], mT)
  expect_equal(res$listofmT[[2]][[2]], mT)
  
  # Ensure that names of the list are preserved
  expect_equal(names(res$listofmT[[1]]), c("a", "b"))
  expect_equal(names(res$listofmT[[2]]), c("a", "b"))
})


###########################################################
context("Hatize")
###########################################################

test_that("hatize_byname works as expected", {
  # Check the absurd situation where a non-vector is sent to hatize()
  supposed_to_be_a_vector <- matrix(1:4, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2")))
  expect_error(hatize_byname(supposed_to_be_a_vector), 
               "matrix v must have at least one dimension of length 1 in hatize_byname")
  v <- matrix(1:10, ncol = 1, dimnames = list(c(paste0("i", 1:10)), c("p1"))) %>%
    setrowtype("Industries") %>% setcoltype(NA)
  orderedRowNames <- c("i1", "i10", paste0("i", 2:9))
  v_hat_expected <- matrix(c(1,0,0,0,0,0,0,0,0,0,
                             0,10,0,0,0,0,0,0,0,0,
                             0,0,2,0,0,0,0,0,0,0,
                             0,0,0,3,0,0,0,0,0,0,
                             0,0,0,0,4,0,0,0,0,0,
                             0,0,0,0,0,5,0,0,0,0,
                             0,0,0,0,0,0,6,0,0,0,
                             0,0,0,0,0,0,0,7,0,0,
                             0,0,0,0,0,0,0,0,8,0,
                             0,0,0,0,0,0,0,0,0,9),
                           nrow = 10, 
                           dimnames = list(orderedRowNames, orderedRowNames)) %>% 
    setrowtype(rowtype(v)) %>% setcoltype(rowtype(v))
  r <- matrix(1:5, nrow = 1, dimnames = list("i1", paste0("p", 1:5))) %>%
    setrowtype(NA) %>% setcoltype("Commodities")
  orderedColNames <- paste0("p", 1:5)
  r_hat_expected <- matrix(c(1,0,0,0,0,
                             0,2,0,0,0,
                             0,0,3,0,0,
                             0,0,0,4,0,
                             0,0,0,0,5),
                           nrow = 5, 
                           dimnames = list(orderedColNames, orderedColNames)) %>% 
    setrowtype(coltype(r)) %>% setcoltype(coltype(r))
  expect_equal(hatize_byname(r), r_hat_expected)
  # This also works with lists.
  expect_equal(hatize_byname(list(v, v)), list(v_hat_expected, v_hat_expected))
  # And it works with data frames.
  DF <- data.frame(v = I(list()))
  DF[[1,"v"]] <- v
  DF[[2,"v"]] <- v
  expect_equal(hatize_byname(DF$v), list(v_hat_expected, v_hat_expected))
  DF_expected <- data.frame(v = I(list()), v_hat = I(list()))
  DF_expected[[1,"v"]] <- v
  DF_expected[[2,"v"]] <- v
  DF_expected[[1,"v_hat"]] <- v_hat_expected
  DF_expected[[2,"v_hat"]] <- v_hat_expected
  # Because DF_expected$v_hat is created with I(list()), its class is "AsIs".
  # Because DF$v_hat is created from an actual calculation, its class is NULL.
  # Need to set the class of DF_expected$v_hat to NULL to get a match.
  attr(DF_expected$v_hat, which = "class") <- NULL
  expect_equal(DF %>% dplyr::mutate(v_hat = hatize_byname(v)), DF_expected)
})


###########################################################
context("Identize")
###########################################################

test_that("identize_byname works as expected", {
  # Try first with a single number
  expect_equal(identize_byname(42), 1)
  # Now try with matrices.
  m <- matrix(1:16, ncol = 4, dimnames = list(c(paste0("i", 1:4)), paste0("p", 1:4))) %>%
    setrowtype("Industries") %>% setcoltype("Products")
  mI_expected <- matrix(c(1,0,0,0,
                          0,1,0,0,
                          0,0,1,0,
                          0,0,0,1),
                        nrow = 4, 
                        dimnames = dimnames(m)) %>% 
    setrowtype(rowtype(m)) %>% setcoltype(coltype(m))
  # Test for errors
  expect_error(identize_byname(m, margin = c(1,2,3,4)), "margin should have length 1 or 2 in fractionize_byname")
  expect_error(identize_byname(m, margin = c(3)), "Unknown margin 3 in identize_byname. margin should be 1, 2, or c\\(1,2\\)")
  expect_error(identize_byname(m, margin = c(-1)), "Unknown margin -1 in identize_byname. margin should be 1, 2, or c\\(1,2\\)")
  expect_error(identize_byname(m, margin = c(1,1,2,2)), "margin should have length 1 or 2 in fractionize_byname")
  
  # Test for column vector
  expect_equal(identize_byname(m, margin = 1), 
               matrix(1, nrow = nrow(m), ncol = 1) %>% 
                 setrownames_byname(rownames(m)) %>% setcolnames_byname(coltype(m)) %>% 
                 setrowtype(rowtype(m)) %>% setcoltype(coltype(m)))
  
  # Test for row vector
  expect_equal(identize_byname(m, margin = 2), 
               matrix(1, nrow = 1, ncol = ncol(m)) %>% 
                 setrownames_byname(rowtype(m)) %>% setcolnames_byname(colnames(m)) %>% 
                 setrowtype(rowtype(m)) %>% setcoltype(coltype(m))) 
  
  # Test for identity matrix
  expect_equal(identize_byname(m), mI_expected)
  expect_equal(identize_byname(m, margin = c(1,2)), mI_expected)
  expect_equal(identize_byname(m, margin = c(2,1)), mI_expected)
  
  # This also works with lists
  expect_equal(identize_byname(list(m, m)), list(mI_expected, mI_expected))
  # This also works for data frames
  DF <- data.frame(m = I(list()))
  DF[[1,"m"]] <- m
  DF[[2,"m"]] <- m
  expect_equal(identize_byname(DF$m), list(mI_expected, mI_expected))
  expect_equal(identize_byname(DF$m, margin = c(1,2)), list(mI_expected, mI_expected))
  expect_equal(identize_byname(DF$m, margin = c(2,1)), list(mI_expected, mI_expected))
  DF_expected <- data.frame(m = I(list()), mI = I(list()))
  DF_expected[[1,"m"]] <- m
  DF_expected[[2,"m"]] <- m
  DF_expected[[1,"mI"]] <- mI_expected
  DF_expected[[2,"mI"]] <- mI_expected
  # Because DF_expected$mI is created with I(list()), its class is "AsIs".
  # Because DF$mI is created from an actual calculation, its class is NULL.
  # Need to set the class of DF_expected$mI to NULL to get a match.
  attr(DF_expected$mI, which = "class") <- NULL
  expect_equal(DF %>% dplyr::mutate(mI = identize_byname(m)), DF_expected)
})


###########################################################
context("Fractionize")
###########################################################

test_that("fractionze_byname works as expected", {
  M <- matrix(c(1, 5,
                4, 5),
              nrow = 2, ncol = 2, byrow = TRUE, 
              dimnames = list(c("p1", "p2"), c("i1", "i2"))) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  expectedM_rows <- matrix(c(1/6, 5/6,
                             4/9, 5/9),
                           nrow = 2, ncol = 2, byrow = TRUE,
                           dimnames = list(c("p1", "p2"), c("i1", "i2"))) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  expectedM_cols <- matrix(c(1/5, 5/10,
                             4/5, 5/10),
                           nrow = 2, ncol = 2, byrow = TRUE,
                           dimnames = list(c("p1", "p2"), c("i1", "i2"))) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  expectedM_sumall <- matrix(c(1/15, 5/15,
                               4/15, 5/15),
                             nrow = 2, ncol = 2, byrow = TRUE,
                             dimnames = list(c("p1", "p2"), c("i1", "i2"))) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  
  # Test for errors
  expect_error(fractionize_byname(M, margin = c(2,2,1,1,0)), "margin should contain unique integers in fractionize_byname")
  expect_error(fractionize_byname(M, margin = c(2,2,1,1)), "margin should contain unique integers in fractionize_byname")
  expect_error(fractionize_byname(M, margin = c(1,1)), "margin should contain unique integers in fractionize_byname")
  expect_error(fractionize_byname(M, margin = c(2,2)), "margin should contain unique integers in fractionize_byname")
  expect_error(fractionize_byname(M, margin = c(1,2,3)), "margin should have length 1 or 2 in fractionize_byname")
  expect_error(fractionize_byname(M, margin = 3), "Unknown margin 3 in fractionize_byname")
  expect_error(fractionize_byname(M, margin = c(3,4)), "Unknown margin")
  expect_error(fractionize_byname(M, margin = -1), "Unknown margin")
  
  # Test with a single number
  expect_equal(fractionize_byname(2, margin = 1), 1) 
  expect_equal(fractionize_byname(-1, margin = 2), 1) 
  expect_equal(fractionize_byname(-5000, margin = c(1,2)), 1) 
  expect_true(is.nan(fractionize_byname(0, margin = 1)))
  
  # Test dividing by row sums
  expect_equal(fractionize_byname(M, margin = 1), expectedM_rows)
  
  # Test dividing by column sums
  expect_equal(fractionize_byname(M, margin = 2), expectedM_cols)
  
  # Test dividing by sum of all entries
  expect_equal(fractionize_byname(M, margin = c(1,2)), expectedM_sumall)
  expect_equal(fractionize_byname(M, margin = c(2,1)), expectedM_sumall)
  
  # Should also work for lists
  expect_equal(fractionize_byname(list(M,M), margin = 1), list(expectedM_rows, expectedM_rows))
  
  # Should also work for data frames
  DF <- data.frame(case = I(list()), M = I(list()))
  DF[[1, "case"]] <- 1
  DF[[1, "case"]] <- 2
  DF[[1, "M"]] <- M
  DF[[2, "M"]] <- M
  DF2 <- DF %>% 
    dplyr::mutate(
      F_row = fractionize_byname(M, margin = 1),
      F_col = fractionize_byname(M, margin = 2),
      F_tot = fractionize_byname(M, margin = c(2,1))
    )
  
  expect_equal(DF2$F_row, list(expectedM_rows, expectedM_rows))
  expect_equal(DF2$F_col, list(expectedM_cols, expectedM_cols))
  expect_equal(DF2$F_tot, list(expectedM_sumall, expectedM_sumall))
  
  # Test when a column contains zeroes
  Mzerocol <- matrix(c(1, 0,
                       2, 0),
                     nrow = 2, ncol = 2, byrow = TRUE,
                     dimnames = list(c("p1", "p2"), c("i1", "i2")))
  expect_equal(fractionize_byname(Mzerocol, margin = c(1,2)), 
               matrix(c(1/3, 0,
                        2/3, 0),
                      nrow = 2, ncol = 2, byrow = TRUE,
                      dimnames = list(c("p1", "p2"), c("i1", "i2"))))
  expect_equal(fractionize_byname(Mzerocol, margin = 1), 
               matrix(c(1, 0,
                        1, 0),
                      nrow = 2, ncol = 2, byrow = TRUE,
                      dimnames = list(c("p1", "p2"), c("i1", "i2"))))
  # Verify that the zero column now works and gives NaNs.
  expect_equal(fractionize_byname(Mzerocol, margin = 2), 
               matrix(c(1/3, 0/0,
                        2/3, 0/0), 
                      nrow = 2, ncol = 2, byrow = TRUE,
                      dimnames = list(c("p1", "p2"), c("i1", "i2"))))
  # But if we clean the matrix first, we will also get something that makes sense.
  expect_equal(fractionize_byname(clean_byname(Mzerocol, margin = 2), margin = 2),
               matrix(c(1/3,
                        2/3),
                      nrow = 2, ncol = 1, byrow = TRUE,
                      dimnames = list(c("p1", "p2"), c("i1"))))
  
  # Test when rows are zero.
  Mzerorow <- matrix(c(0, 0,
                       1, 2),
                     nrow = 2, ncol = 2, byrow = TRUE,
                     dimnames = list(c("p1", "p2"), c("i1", "i2")))
  expect_equal(fractionize_byname(Mzerorow, margin = c(1,2)), 
               matrix(c(0,   0,
                        1/3, 2/3),
                      nrow = 2, ncol = 2, byrow = TRUE,
                      dimnames = list(c("p1", "p2"), c("i1", "i2"))))
  expect_equal(fractionize_byname(Mzerorow, margin = 1), 
               matrix(c(0/0, 0/0,
                        1/3, 2/3),
                      nrow = 2, ncol = 2, byrow = TRUE,
                      dimnames = list(c("p1", "p2"), c("i1", "i2"))))
  expect_equal(fractionize_byname(Mzerorow, margin = 2), 
               matrix(c(0, 0,
                        1, 1),
                      nrow = 2, ncol = 2, byrow = TRUE,
                      dimnames = list(c("p1", "p2"), c("i1", "i2"))))
  
  # Test when everything is zero
  Mzero <- matrix(c(0, 0,
                    0, 0),
                  nrow = 2, ncol = 2, byrow = TRUE,
                  dimnames = list(c("p1", "p2"), c("i1", "i2")))
  expect_equal(fractionize_byname(Mzero, margin = 1), 
               matrix(c(0/0, 0/0,
                        0/0, 0/0), 
                      nrow = 2, ncol = 2, byrow = TRUE,
                      dimnames = list(c("p1", "p2"), c("i1", "i2"))))
  expect_equal(fractionize_byname(Mzero, margin = 2), 
               matrix(c(0/0, 0/0,
                        0/0, 0/0), 
                      nrow = 2, ncol = 2, byrow = TRUE,
                      dimnames = list(c("p1", "p2"), c("i1", "i2"))))
  expect_equal(fractionize_byname(Mzero, margin = c(1,2)), 
               matrix(c(0/0, 0/0,
                        0/0, 0/0), 
                      nrow = 2, ncol = 2, byrow = TRUE,
                      dimnames = list(c("p1", "p2"), c("i1", "i2"))))
})


###########################################################
context("Row selection")
###########################################################

m_rownames <- paste0("i", 1:4)
m_colnames <- paste0("p", 1:4)
m <- matrix(1:16, ncol = 4, dimnames = list(m_rownames, m_colnames)) %>%
  setrowtype("Industries") %>% setcoltype("Products")

n1 <- setrownames_byname(m, c("a1", "a2", "b1", "b2"))
n2 <- setcolnames_byname(m, c("a1", "a2", "b1", "b2"))

test_that("matrix row selection by name with exact matches (^name$) works as expected", {
  # Select only the first row (i1)
  expect_equal(select_rows_byname(m, retain_pattern = "^i1$"), 
               matrix(c(seq(1, 13, by = 4)), nrow = 1, dimnames = list(c("i1"), m_colnames)) %>% 
                 setrowtype(rowtype(m)) %>% setcoltype(coltype(m)))
  # Try same test using the make_pattern utility function.
  expect_equal(select_rows_byname(m, retain_pattern = make_pattern(row_col_names = "i1", pattern_type = "exact")), 
               matrix(c(seq(1, 13, by = 4)), nrow = 1, dimnames = list(c("i1"), m_colnames)) %>% 
                 setrowtype(rowtype(m)) %>% setcoltype(coltype(m)))
  # Select rows 1 and 4 (i1, i4)
  expect_equal(select_rows_byname(m, retain_pattern = "^i1$|^i4$"), 
               m[c(1, 4), ] %>% setrowtype(rowtype(m)) %>% setcoltype(coltype(m)))
  # Eliminate row 3 (i3)
  expect_equal(select_rows_byname(m, remove_pattern = "^i3$"), 
               m[-3, ] %>% setrowtype(rowtype(m)) %>% setcoltype(coltype(m)))
  # Eliminate rows 1 and 3
  expect_equal(select_rows_byname(m, remove_pattern = "^i1$|^i3$"), 
               m[c(-1,-3), ] %>% setrowtype(rowtype(m)) %>% setcoltype(coltype(m)))
  # Retain row 4.  Retain has precedence over remove.
  expect_equal(select_rows_byname(m, retain_pattern = "^i4$", remove_pattern = "^i1$|^i3$|^i4$"), 
               matrix(c(seq(4, 16, by = 4)), nrow = 1, dimnames = list(c("i4"), m_colnames)) %>% 
                 setrowtype(rowtype(m)) %>% setcoltype(coltype(m)))
  # Matches nothing.  NULL is returned.
  expect_null(select_rows_byname(m, retain_pattern = "^x$"))
  # Matches nothing.  All of m is returned.
  expect_equal(select_rows_byname(m, remove_pattern = "^x$"), m)
  
  # Here is a pathological case where the row name contains ( and ).
  # ( and ) need to be escaped properly for use in regex.
  crazymat <- matrix(1, nrow = 2, ncol = 2, 
                     dimnames = list(c("i (1)", "i (2)"), c("p (1)", "p (2)"))) %>% 
    setrowtype("Industries") %>% setcoltype("Prodcuts")
  expect_equal(select_rows_byname(crazymat, retain_pattern = make_pattern(row_col_names = "i (1)", pattern_type = "exact")), 
               matrix(1, nrow = 1, ncol = 2, dimnames = list("i (1)", c("p (1)", "p (2)"))) %>% 
                 setrowtype(rowtype(crazymat)) %>% setcoltype(coltype(crazymat)))
})

test_that("matrix row selection by name with inexact matches works as expected", {
  # Matches first two rows, because partial match is OK.
  expect_equal(select_rows_byname(n1, retain_pattern = "^a"), 
               n1[c(1,2), ] %>% setrowtype(rowtype(n1)) %>% setcoltype(coltype(n1)))
  # Deletes first two rows, because partial match is OK, and first two row names start with "a".
  expect_equal(select_rows_byname(n1, remove_pattern = "^a"), 
               n1[c(3,4), ] %>% setrowtype(rowtype(n1)) %>% setcoltype(coltype(n1)))
})

test_that("matrix row selection by name with inexact matches and multiple selectors", {
  # The retain_pattern selects all rows whose names start with "a" or "b".
  # This approach should retain rows with names "a1", "a2", "b1", and "b2", i.e.,
  # all rows in n1.
  expect_equal(select_rows_byname(n1, retain_pattern = "^a|^b"), n1)
})

test_that("matrix row selection by name in lists works as expected", {
  # Use same row names for each item in the list
  expect_equal(select_rows_byname(list(m,m), retain_pattern = "^i1$|^i4$"),
               list(m[c(1,4), ] %>% setrowtype(rowtype(m)) %>% setcoltype(coltype(m)), 
                    m[c(1,4), ] %>% setrowtype(rowtype(m)) %>% setcoltype(coltype(m))))
  # Using data frames
  DF <- data.frame(m = I(list()))
  DF[[1,"m"]] <- m
  DF[[2,"m"]] <- m
  DF <- DF %>% dplyr::mutate(trimmed = select_rows_byname(.$m, 
                                                   retain_pattern = make_pattern(row_col_names = c("i1", "i2"), 
                                                                                 pattern_type = "exact")))
  DF_expected <- data.frame(m = I(list()), trimmed = I(list()))
  DF_expected[[1,"m"]] <- m
  DF_expected[[2,"m"]] <- m
  DF_expected[[1,"trimmed"]] <- select_rows_byname(m, retain_pattern = "^i1$|^i2$")
  DF_expected[[2,"trimmed"]] <- select_rows_byname(m, retain_pattern = "^i1$|^i2$")
  # Need to use "expect_equivalent" because attributes are different 
  # because DF_expected was made differently from how the mutated data fram was made.
  expect_equivalent(DF, DF_expected)
})


###########################################################
context("Column selection")
###########################################################

test_that("matrix column selection by name with exact matches (^name$) works as expected", {
  # Select only the first column (p1)
  expect_equal(select_cols_byname(m, retain_pattern = "^p1$"), 
               matrix(1:4, ncol = 1, dimnames = list(m_rownames, c("p1"))) %>% 
                 setrowtype(rowtype(m)) %>% setcoltype(coltype(m)))
  # Try same test using the make_pattern utility function.
  expect_equal(select_cols_byname(m, retain_pattern = make_pattern(row_col_names = "p1", pattern_type = "exact")), 
               matrix(1:4, ncol = 1, dimnames = list(m_rownames, c("p1"))) %>% 
                 setrowtype(rowtype(m)) %>% setcoltype(coltype(m)))
  # Select columns 1 and 4 (p1, p4)
  expect_equal(select_cols_byname(m, retain_pattern = "^p1$|^p4$"), 
               m[ , c(1, 4)] %>% setrowtype(rowtype(m)) %>% setcoltype(coltype(m)))
  # Eliminate column 3 (p3)
  expect_equal(select_cols_byname(m, remove_pattern = "^p3$"), 
               m[ , -3] %>% setrowtype(rowtype(m)) %>% setcoltype(coltype(m)))
  # Eliminate columns 1 and 3
  expect_equal(select_cols_byname(m, remove_pattern = "^p1$|^p3$"), 
               m[ , c(-1,-3)] %>% setrowtype(rowtype(m)) %>% setcoltype(coltype(m)))
  # Retain column 4.  Retain has precedence over remove.
  expect_equal(select_cols_byname(m, retain_pattern = "^p4$", remove_pattern = "^p1$|^p3$|^p4$"), 
               matrix(13:16, ncol = 1, dimnames = list(m_rownames, c("p4"))) %>% 
                 setrowtype(rowtype(m)) %>% setcoltype(coltype(m)))
  # Matches nothing.  NULL is returned.
  expect_null(select_cols_byname(m, retain_pattern = "^x$"))
  # Matches nothing.  All of m is returned.
  expect_equal(select_cols_byname(m, remove_pattern = "^x$"), m)
})

test_that("matrix column selection by name with inexact matches works as expected", {
  # Matches first two columns, because partial match is OK.
  expect_equal(select_cols_byname(n2, retain_pattern = "^a"), 
               n2[ , c(1,2)] %>% setrowtype(rowtype(n2)) %>% setcoltype(coltype(n2)))
  # Deletes first two columns, because partial match is OK, and first two column names start with "a".
  expect_equal(select_cols_byname(n2, remove_pattern = "^a"), 
               n2[ , c(3,4)] %>% setrowtype(rowtype(n2)) %>% setcoltype(coltype(n2)))
})

test_that("matrix column selection by name with inexact matches and multiple selectors", {
  # The retain_pattern selects all columns whose names start with "a" or "b".
  # This approach should retain columns with names "a1", "a2", "b1", and "b2", i.e.,
  # all columns in n2.
  expect_equal(select_cols_byname(n2, retain_pattern = "^a|^b"), n2)
})

test_that("matrix column selection by name in lists works as expected", {
  # Use same column names for each item in the list
  expect_equal(select_cols_byname(list(m,m), retain_pattern = "^p1$|^p4$"),
               list(m[ , c(1,4)] %>% setrowtype(rowtype(m)) %>% setcoltype(coltype(m)), 
                    m[ , c(1,4)] %>% setrowtype(rowtype(m)) %>% setcoltype(coltype(m))))
  # Using data frames
  DF <- data.frame(m = I(list()))
  DF[[1,"m"]] <- m
  DF[[2,"m"]] <- m
  DF <- DF %>% dplyr::mutate(trimmed = select_cols_byname(.$m, 
                                                   retain_pattern = make_pattern(row_col_names = c("p1", "p2"), 
                                                                                 pattern_type = "exact")))
  DF_expected <- data.frame(m = I(list()), trimmed = I(list()))
  DF_expected[[1,"m"]] <- m
  DF_expected[[2,"m"]] <- m
  DF_expected[[1,"trimmed"]] <- select_cols_byname(m, retain_pattern = "^p1$|^p2$")
  DF_expected[[2,"trimmed"]] <- select_cols_byname(m, retain_pattern = "^p1$|^p2$")
  # Need to use "expect_equivalent" because attributes are different 
  # because DF_expected was made differently from how the mutated data fram was made.
  expect_equivalent(DF, DF_expected)
})


###########################################################
context("Row, column, and all sums")
###########################################################

test_that("rowsums_byname works as expected", {
  m <- matrix(c(1:6), ncol = 2, dimnames = list(paste0("i", 3:1), paste0("p", 1:2))) %>%
    setrowtype("Industries") %>% setcoltype("Products")
  # Note, columns are sorted by name after rowsums_byname
  rowsumsm_expected <- matrix(c(9, 7, 5), nrow = 3, dimnames = list(paste0("i", 1:3), coltype(m))) %>% 
    setrowtype(rowtype(m)) %>% setcoltype(coltype(m))
  expect_equal(rowsums_byname(m), rowsumsm_expected)
  expect_equal(rowsums_byname(m, "E.ktoe"), rowsumsm_expected %>% setcolnames_byname("E.ktoe"))
  # This also works with lists
  expect_equal(rowsums_byname(list(m, m)), list(rowsumsm_expected, rowsumsm_expected))
  expect_equal(rowsums_byname(list(m, m), "E.ktoe"), 
               list(rowsumsm_expected %>% setcolnames_byname("E.ktoe"), 
                    rowsumsm_expected %>% setcolnames_byname("E.ktoe")))
  expect_equal(rowsums_byname(list(m, m), NULL), list(rowsumsm_expected, rowsumsm_expected))
  # Also works with data frames
  DF <- data.frame(m = I(list()))
  DF[[1,"m"]] <- m
  DF[[2,"m"]] <- m
  expect_equal(rowsums_byname(DF$m), list(rowsumsm_expected, rowsumsm_expected))
  DF_expected <- data.frame(m = I(list()), mi = I(list()))
  DF_expected[[1,"m"]] <- m
  DF_expected[[2,"m"]] <- m
  DF_expected[[1,"mi"]] <- rowsumsm_expected
  DF_expected[[2,"mi"]] <- rowsumsm_expected
  # Because DF_expected$mi is created with I(list()), its class is "AsIs".
  # Because DF$mi is created from an actual calculation, its class is NULL.
  # Need to set the class of DF_expected$mi to NULL to get a match.
  attr(DF_expected$mi, which = "class") <- NULL
  expect_equal(DF %>% dplyr::mutate(mi = rowsums_byname(m)), DF_expected)
})

test_that("colsums_byname works as expected", {
  m <- matrix(c(1:6), ncol = 2, dimnames = list(paste0("i", 3:1), paste0("p", 1:2))) %>%
    setrowtype("Industries") %>% setcoltype("Products")
  colsumsm_expected <- matrix(c(6, 15), nrow = 1, dimnames = list(rowtype(m), colnames(m))) %>% 
    setrowtype(rowtype(m)) %>% setcoltype(coltype(m))
  expect_equal(colsums_byname(m), colsumsm_expected)
  expect_equal(colsums_byname(m, "E.ktoe"), colsumsm_expected %>% setrownames_byname("E.ktoe"))
  # This also works with lists
  expect_equal(colsums_byname(list(m, m)), list(colsumsm_expected, colsumsm_expected))
  expect_equal(colsums_byname(list(m, m), "E.ktoe"), 
               list(colsumsm_expected %>% setrownames_byname("E.ktoe"), 
                    colsumsm_expected %>% setrownames_byname("E.ktoe")))
  expect_equal(colsums_byname(list(m, m), NULL), list(colsumsm_expected, colsumsm_expected))
  # Also works with data frames
  DF <- data.frame(m = I(list()))
  DF[[1,"m"]] <- m
  DF[[2,"m"]] <- m
  expect_equal(colsums_byname(DF$m), list(colsumsm_expected, colsumsm_expected))
  DF_expected <- data.frame(m = I(list()), iTm = I(list()))
  DF_expected[[1,"m"]] <- m
  DF_expected[[2,"m"]] <- m
  DF_expected[[1,"iTm"]] <- colsumsm_expected
  DF_expected[[2,"iTm"]] <- colsumsm_expected
  # Because DF_expected$iTm is created with I(list()), its class is "AsIs".
  # Because DF$iTm is created from an actual calculation, its class is NULL.
  # Need to set the class of DF_expected$iTm to NULL to get a match.
  attr(DF_expected$iTm, which = "class") <- NULL
  expect_equal(DF %>% dplyr::mutate(iTm = colsums_byname(m)), DF_expected)
})

test_that("sumall_byname works as expected", {
  m <- matrix(2, nrow = 2, ncol = 2, dimnames = list(paste0("i", 1:2), paste0("c", 1:2))) %>%
    setrowtype("Industry") %>% setcoltype("Commodity")
  expect_equal(sumall_byname(m), 8)
  expect_equal(m %>% rowsums_byname %>% colsums_byname, 
               matrix(8, nrow = 1, ncol = 1, dimnames = list(rowtype(m), coltype(m))) %>% 
                 setrowtype(rowtype(m)) %>% setcoltype(coltype(m)))
  # Also works for lists
  expect_equal(sumall_byname(list(m,m)), list(8, 8))
  # Also works for data frames
  DF <- data.frame(m = I(list()))
  DF[[1,"m"]] <- m
  DF[[2,"m"]] <- m
  expect_equal(sumall_byname(DF$m), list(8,8))
  DF_expected <- data.frame(m = I(list()), summ = I(list()))
  DF_expected[[1,"m"]] <- m
  DF_expected[[2,"m"]] <- m  
  DF_expected[[1,"summ"]] <- 8
  DF_expected[[2,"summ"]] <- 8
  # Because DF_expected$summ is created with I(list()), its class is "AsIs".
  # Because DF$summ is created from an actual calculation, its class is NULL.
  # Need to set the class of DF_expected$summ to NULL to get a match.
  attr(DF_expected$summ, which = "class") <- NULL
  expect_equal(DF %>% dplyr::mutate(summ = sumall_byname(m)), DF_expected)
})


###########################################################
context("Row, column, and all prods")
###########################################################

test_that("rowprods_byname works as expected", {
  m <- matrix(c(1:6), ncol = 2, dimnames = list(paste0("i", 3:1), paste0("p", 1:2))) %>%
    setrowtype("Industries") %>% setcoltype("Products")
  # Note, columns are sorted by name after rowprods_byname
  rowprodsm_expected <- matrix(c(18, 10, 4), nrow = 3, dimnames = list(paste0("i", 1:3), coltype(m))) %>% 
    setrowtype(rowtype(m)) %>% setcoltype(coltype(m))
  expect_equal(rowprods_byname(m), rowprodsm_expected)
  expect_equal(rowprods_byname(m, "E.ktoe"), rowprodsm_expected %>% setcolnames_byname("E.ktoe"))
  # This also works with lists
  expect_equal(rowprods_byname(list(m, m)), list(rowprodsm_expected, rowprodsm_expected))
  expect_equal(rowprods_byname(list(m, m), "E.ktoe"), 
               list(rowprodsm_expected %>% setcolnames_byname("E.ktoe"), 
                    rowprodsm_expected %>% setcolnames_byname("E.ktoe")))
  expect_equal(rowprods_byname(list(m, m), NULL), list(rowprodsm_expected, rowprodsm_expected))
  # Also works with data frames
  DF <- data.frame(m = I(list()))
  DF[[1,"m"]] <- m
  DF[[2,"m"]] <- m
  expect_equal(rowprods_byname(DF$m), list(rowprodsm_expected, rowprodsm_expected))
  DF_expected <- data.frame(m = I(list()), mi = I(list()))
  DF_expected[[1,"m"]] <- m
  DF_expected[[2,"m"]] <- m
  DF_expected[[1,"mi"]] <- rowprodsm_expected
  DF_expected[[2,"mi"]] <- rowprodsm_expected
  # Because DF_expected$mi is created with I(list()), its class is "AsIs".
  # Because DF$mi is created from an actual calculation, its class is NULL.
  # Need to set the class of DF_expected$mi to NULL to get a match.
  attr(DF_expected$mi, which = "class") <- NULL
  expect_equal(DF %>% dplyr::mutate(mi = rowprods_byname(m)), DF_expected)
})

test_that("colprods_byname works as expected", {
  m <- matrix(c(1:6), ncol = 2, dimnames = list(paste0("i", 3:1), paste0("p", 1:2))) %>%
    setrowtype("Industries") %>% setcoltype("Products")
  colprodsm_expected <- matrix(c(6, 120), nrow = 1, dimnames = list(rowtype(m), colnames(m))) %>% 
    setrowtype(rowtype(m)) %>% setcoltype(coltype(m))
  expect_equal(colprods_byname(m), colprodsm_expected)
  expect_equal(colprods_byname(m, "E.ktoe"), colprodsm_expected %>% setrownames_byname("E.ktoe"))
  # This also works with lists
  expect_equal(colprods_byname(list(m, m)), list(colprodsm_expected, colprodsm_expected))
  expect_equal(colprods_byname(list(m, m), "E.ktoe"), 
               list(colprodsm_expected %>% setrownames_byname("E.ktoe"), 
                    colprodsm_expected %>% setrownames_byname("E.ktoe")))
  expect_equal(colprods_byname(list(m, m), NULL), list(colprodsm_expected, colprodsm_expected))
  # Also works with data frames
  DF <- data.frame(m = I(list()))
  DF[[1,"m"]] <- m
  DF[[2,"m"]] <- m
  expect_equal(colprods_byname(DF$m), list(colprodsm_expected, colprodsm_expected))
  DF_expected <- data.frame(m = I(list()), iTm = I(list()))
  DF_expected[[1,"m"]] <- m
  DF_expected[[2,"m"]] <- m
  DF_expected[[1,"iTm"]] <- colprodsm_expected
  DF_expected[[2,"iTm"]] <- colprodsm_expected
  # Because DF_expected$iTm is created with I(list()), its class is "AsIs".
  # Because DF$iTm is created from an actual calculation, its class is NULL.
  # Need to set the class of DF_expected$iTm to NULL to get a match.
  attr(DF_expected$iTm, which = "class") <- NULL
  expect_equal(DF %>% dplyr::mutate(iTm = colprods_byname(m)), DF_expected)
})

test_that("prodall_byname works as expected", {
  m <- matrix(2, nrow = 2, ncol = 2, dimnames = list(paste0("i", 1:2), paste0("c", 1:2))) %>%
    setrowtype("Industry") %>% setcoltype("Product")
  expect_equal(prodall_byname(m), 16)
  expect_equal(m %>% rowprods_byname %>% colprods_byname, 
               matrix(16, nrow = 1, ncol = 1, dimnames = list(rowtype(m), coltype(m))) %>% 
                 setrowtype(rowtype(m)) %>% setcoltype(coltype(m)))
  # Also works for lists
  expect_equal(prodall_byname(list(m,m)), list(16, 16))
  # Also works for data frames
  DF <- data.frame(m = I(list()))
  DF[[1,"m"]] <- m
  DF[[2,"m"]] <- m
  expect_equal(prodall_byname(DF$m), list(16, 16))
  DF_expected <- data.frame(m = I(list()), prodm = I(list()))
  DF_expected[[1,"m"]] <- m
  DF_expected[[2,"m"]] <- m  
  DF_expected[[1,"prodm"]] <- 16
  DF_expected[[2,"prodm"]] <- 16
  # Because DF_expected$summ is created with I(list()), its class is "AsIs".
  # Because DF$summ is created from an actual calculation, its class is NULL.
  # Need to set the class of DF_expected$summ to NULL to get a match.
  attr(DF_expected$prodm, which = "class") <- NULL
  expect_equal(DF %>% dplyr::mutate(prodm = prodall_byname(m)), DF_expected)
})


###########################################################
context("Iminus")
###########################################################

test_that("Iminus_byname works as expected", {
  m <- matrix(c(-21, -12, -21, -10), ncol = 2, dimnames = list(c("b", "a"), c("b", "a"))) %>%
    setrowtype("Industries") %>% setcoltype("Products")
  Iminus_expected <- matrix(c(11, 12, 
                              21, 22),
                            nrow = 2, byrow = TRUE, dimnames = list(c("a", "b"), c("a", "b"))) %>% 
    setrowtype(rowtype(m)) %>% setcoltype(coltype(m))
  # Rows and columns of m are unsorted
  expect_equal(diag(1, nrow = 2) - m, matrix(c(22, 12, 21, 11), nrow = 2, dimnames = dimnames(m)) %>% 
                 setrowtype(rowtype(m)) %>% setcoltype(coltype(m)))
  # Rows and columns of m are sorted prior to subtracting from the identity matrix
  expect_equal(Iminus_byname(m), Iminus_expected)
  # This also works with lists
  expect_equal(Iminus_byname(list(m,m)), list(Iminus_expected, Iminus_expected))
  # Also works with data frames
  DF <- data.frame(m = I(list()))
  DF[[1,"m"]] <- m
  DF[[2,"m"]] <- m
  expect_equal(Iminus_byname(DF$m), list(Iminus_expected, Iminus_expected))
  DF_expected <- data.frame(m = I(list()), Iminusm = I(list()))
  DF_expected[[1,"m"]] <- m
  DF_expected[[2,"m"]] <- m
  DF_expected[[1,"Iminusm"]] <- Iminus_expected
  DF_expected[[2,"Iminusm"]] <- Iminus_expected
  # Because DF_expected$Iminusm is created with I(list()), its class is "AsIs".
  # Because DF$Iminusm is created from an actual calculation, its class is NULL.
  # Need to set the class of DF_expected$Iminusm to NULL to get a match.
  attr(DF_expected$Iminusm, which = "class") <- NULL
  expect_equal(DF %>% dplyr::mutate(Iminusm = Iminus_byname(m)), DF_expected)
  
  # If m is not square before subtracting from I,
  # it will be made square by the function complete_and_sort.
  m2 <- matrix(c(1,2,3,4,5,6), ncol = 2, dimnames = list(c("a", "b", "c"), c("a", "b"))) %>%
    setrowtype("Industries") %>% setcoltype("Products")
  expect_equal(Iminus_byname(m2), 
               matrix(c(0, -4, 0, 
                        -2, -4, 0, 
                        -3, -6, 1), 
                      nrow = 3, byrow = TRUE, dimnames = list(c("a", "b", "c"), c("a", "b", "c"))) %>% 
                 setrowtype(rowtype(m2)) %>% setcoltype(coltype(m2)))
})


###########################################################
context("Matrix cleaning")
###########################################################

test_that("matrix cleaning works as expected", {
  # Clean on rows
  mat1 <- matrix(c(0,1,0,1), nrow = 2, dimnames = list(c("r (1)", "r (2)"), c("c (1)", "c (2)"))) %>% 
    setrowtype("Rows") %>% setcoltype("Cols")
  # Now clean in rows Should eliminate row 1.
  expect_equal(mat1 %>% clean_byname(margin = 1, clean_value = 0), 
               matrix(1, nrow = 1, ncol = 2, dimnames = list("r (2)", c("c (1)", "c (2)"))) %>% 
                 setrowtype("Rows") %>% setcoltype("Cols"))
  # No column consists of all zeroes. So nothing to clean in columns Should get "mat1" back.
  expect_equal(mat1 %>% clean_byname(margin = 2, clean_value = 0), mat1)
  # Clean on columns
  mat2 <- matrix(c(0,0,1,1), nrow = 2, dimnames = list(c("r (1)", "r (2)"), c("c (1)", "c (2)"))) %>% 
    setrowtype("Rows") %>% setcoltype("Cols")
  # No row consists of all zeroes. So nothing to clean in rows. Should get "mat2" back.
  expect_equal(mat2 %>% clean_byname(margin = 1, clean_value = 0), mat2)
  # Now clean in columns. Should eliminate column 1.
  expect_equal(mat2 %>% clean_byname(margin = 2, clean_value = 0), 
               matrix(1, nrow = 2, ncol = 1, dimnames = list(c("r (1)", "r (2)"), "c (2)")) %>% 
                 setrowtype("Rows") %>% setcoltype("Cols"))
})


###########################################################
context("Row and column naming")
###########################################################

test_that("getting row names works as expected", {
  m <- matrix(c(1:6), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("p", 1:3))) %>%
    setrowtype("Industries") %>% setcoltype("Products")
  expect_equal(getrownames_byname(m), c("i1", "i2"))
  # This also works for lists
  expect_equal(getrownames_byname(list(m,m)), list(c("i1", "i2"), c("i1", "i2")))
  # Also works for data frames
  DF <- data.frame(m = I(list()))
  DF[[1,"m"]] <- m
  DF[[2,"m"]] <- m
  expect_equal(getrownames_byname(DF$m), list(c("i1", "i2"), c("i1", "i2")))
})

test_that("getting column names works as expected", {
  m <- matrix(c(1:6), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("p", 1:3))) %>%
    setrowtype("Industries") %>% setcoltype("Products")
  expect_equal(getcolnames_byname(m), c("p1", "p2", "p3"))
  # This also works for lists
  expect_equal(getcolnames_byname(list(m,m)), list(c("p1", "p2", "p3"), c("p1", "p2", "p3")))
  # Also works for data frames
  DF <- data.frame(m = I(list()))
  DF[[1,"m"]] <- m
  DF[[2,"m"]] <- m
  expect_equal(getcolnames_byname(DF$m), list(c("p1", "p2", "p3"), c("p1", "p2", "p3")))
})

test_that("setting row names works as expected", {
  m1 <- matrix(c(1:6), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("p", 1:3))) %>%
    setrowtype("Industries") %>% setcoltype("Commodities")
  m2 <- setrownames_byname(m1, c("a", "b"))
  expect_equal(rownames(m2), c("a", "b"))
  m3 <- setrownames_byname(m1 %>% setrowtype("Industries") %>% setcoltype("Commodities"), c("c", "d"))
  expect_equal(rownames(m3), c("c", "d"))
  m4 <- m1 %>% setrownames_byname(NULL)
  expect_null(rownames(m4))
  m5 <- m1 %>% setrownames_byname(c(NA, NA))
  expect_equal(rownames(m5), c(NA_character_, NA_character_))
  # This also works for lists
  l1 <- list(m1,m1)
  l2 <- setrownames_byname(l1, c("a", "b"))
  expect_equal(list(rownames(l2[[1]]), rownames(l2[[2]])), list(c("a", "b"), c("a", "b")))
  # This also works with data frames
  DF1 <- data.frame(mcol = I(list()))
  DF1[[1,"mcol"]] <- m1
  DF1[[2,"mcol"]] <- m1
  DF2 <- DF1 %>% 
    dplyr::mutate(
      mcol2 = setrownames_byname(mcol, c("r1", "r2"))
    )
  expect_equal(rownames(DF2$mcol2[[1]]), c("r1", "r2"))
  expect_equal(rownames(DF2$mcol2[[2]]), c("r1", "r2"))
  DF3 <- DF1 %>% 
    dplyr::mutate(
      mcol2 = setrownames_byname(mcol, c("r3", "r4"))
    )
  expect_equal(list(rownames(DF3$mcol2[[1]]), rownames(DF3$mcol2[[2]])), list(c("r3", "r4"), c("r3", "r4")))
})

test_that("setting col names works as expected", {
  m1 <- matrix(c(1:6), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("p", 1:3))) %>%
    setrowtype("Industries") %>% setcoltype("Commodities")
  m2 <- setcolnames_byname(m1, c("a", "b", "c"))
  expect_equal(colnames(m2), c("a", "b", "c"))
  m3 <- setcolnames_byname(m1 %>% setrowtype("Industries") %>% setcoltype("Commodities"), c("d", "e", "f"))
  expect_equal(colnames(m3), c("d", "e", "f"))
  m4 <- m1 %>% setcolnames_byname(NULL)
  expect_null(colnames(m4))
  m5 <- m1 %>% setcolnames_byname(c(NA, NA, NA))
  expect_equal(colnames(m5), c(NA_character_, NA_character_, NA_character_))
  # This also works for lists
  l1 <- list(m1,m1)
  l2 <- setcolnames_byname(l1, c("a", "b", "c"))
  expect_equal(list(colnames(l2[[1]]), colnames(l2[[2]])), list(c("a", "b", "c"), c("a", "b", "c")))
  # This also works with data frames
  DF1 <- data.frame(mcol = I(list()))
  DF1[[1,"mcol"]] <- m1
  DF1[[2,"mcol"]] <- m1
  DF2 <- DF1 %>% 
    dplyr::mutate(
      mcol2 = setcolnames_byname(mcol, c("c1", "c2", "c3"))
    )
  expect_equal(colnames(DF2$mcol2[[1]]), c("c1", "c2", "c3"))
  expect_equal(colnames(DF2$mcol2[[2]]), c("c1", "c2", "c3"))
  DF3 <- DF1 %>% 
    dplyr::mutate(
      mcol2 = setcolnames_byname(mcol, c("c1", "c2", "c3"))
    )
  expect_equal(list(colnames(DF3$mcol2[[1]]), colnames(DF3$mcol2[[2]])), list(c("c1", "c2", "c3"), c("c1", "c2", "c3")))
})


###########################################################
context("Row and column types")
###########################################################

test_that("setrowtype and rowtype works as expected", {
  productnames <- c("p1", "p2")
  industrynames <- c("i1", "i2")
  U <- matrix(1:4, ncol = 2, dimnames = list(productnames, industrynames)) %>% setrowtype("Products")
  expect_null(U %>% setrowtype(NULL) %>% rowtype())
  expect_equal(rowtype(U), "Products")
  # This also works for lists
  Ul <- setrowtype(list(U,U), rowtype = "Products")
  expect_equal(rowtype(Ul), list("Products", "Products"))
  Ul2 <- setrowtype(list(U,U), rowtype = "Junk")
  expect_equal(rowtype(Ul2), list("Junk", "Junk"))
  # Also works for data frames
  DF <- data.frame(U = I(list()))
  DF[[1,"U"]] <- U
  DF[[2,"U"]] <- U
  DF2 <- setrowtype(DF$U, "Products")
  expect_equal(rowtype(DF2), list("Products", "Products"))
  DF3 <- DF %>% dplyr::mutate(newcol = setrowtype(U, "Products"))
  expect_equal(DF3$newcol %>% rowtype, list("Products", "Products"))
})

test_that("setcoltype and coltype works as expected", {
  productnames <- c("p1", "p2")
  industrynames <- c("i1", "i2")
  U <- matrix(1:4, ncol = 2, dimnames = list(productnames, industrynames)) %>% setcoltype("Industries")
  expect_null(U %>% setcoltype(NULL) %>% coltype())
  expect_equal(coltype(U), "Industries")
  # This also works for lists
  Ul <- setcoltype(list(U,U), coltype = "Industries")
  expect_equal(coltype(Ul), list("Industries", "Industries"))
  Ul2 <- setcoltype(list(U,U), coltype = "Junk")
  expect_equal(coltype(Ul2), list("Junk", "Junk"))
  # Also works for data frames
  DF <- data.frame(U = I(list()))
  DF[[1,"U"]] <- U
  DF[[2,"U"]] <- U
  DF2 <- setcoltype(DF$U, "Industries")
  expect_equal(coltype(DF2), list("Industries", "Industries"))
  DF3 <- DF %>% dplyr::mutate(newcol = setcoltype(U, "Industries"))
  expect_equal(DF3$newcol %>% coltype, list("Industries", "Industries"))
})


###########################################################
context("Row and column names")
###########################################################

test_that("setrownames_byname works as expected", {
  m <- matrix(c(1:6), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("c", 1:3))) %>%
    setrowtype("Industries") %>% setcoltype("Commodities")
  m2 <- setrownames_byname(m, c("a", "b"))
  expect_equal(m %>% setrownames_byname(c("a", "b")) %>% rownames(), 
               c("a", "b"))
  expect_equal(m %>% setrownames_byname(rownames(m2)) %>% rownames(), c("a", "b"))
  expect_equal(m %>% setrownames_byname(c("c", "d")) %>% rownames(), c("c", "d"))
  expect_null(m %>% setrownames_byname(NULL) %>% rownames())
  expect_equal(m %>% setrownames_byname(c(NA, NA)) %>% rownames(), c(NA_character_, NA_character_))
  # The function should convert the constant to a matrix and apply the row name
  expect_equal(2 %>% setrownames_byname("row"), 
               matrix(2, nrow = 1, ncol = 1, dimnames = list(c("row"), NULL)))
})

test_that("setcolnames_byname works as expected", {
  m <- matrix(c(1:6), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("c", 1:3))) %>%
    setrowtype("Industries") %>% setcoltype("Commodities")
  expect_equal(m %>% setcolnames_byname(c("a", "b", "c")) %>% colnames(), 
               c("a", "b", "c"))
  expect_equal(m %>% setcolnames_byname(c("d", "e", "f")) %>% colnames(), c("d", "e", "f"))
  expect_null(m %>% setcolnames_byname(NULL) %>% colnames())
  expect_equal(m %>% setcolnames_byname(c(NA, NA, NA)) %>% colnames(), c(NA_character_, NA_character_, NA_character_))
  # The function should convert the constant to a matrix and apply the col name
  expect_equal(2 %>% setcolnames_byname("col"), 
               matrix(2, nrow = 1, ncol = 1, dimnames = list(NULL, c("col"))))
})


###########################################################
context("Cumulative sum")
###########################################################

test_that("cumsum_byname works as expected", {
  expect_null(cumsum_byname(NULL))
  expect_true(is.na(cumsum_byname(NA)))
  expect_equal(cumsum_byname(2), 2)
  
  lst <- list(1, 2, 3, 4, 5)
  lst_expected <- list(1, 3, 6, 10, 15)
  expect_equal(cumsum_byname(lst), lst_expected)
  # Try in a data frame.
  DF <- data.frame(l1 = I(lst), l2 = I(lst))
  CS <- DF %>% 
    dplyr::mutate(
      cs1 = cumsum_byname(l1), 
      cs2 = cumsum_byname(l2)
    )
  expect_equal(CS$cs1, lst_expected)
  expect_equal(CS$cs2, lst_expected)
  
  # Try with matrices
  rowmat <- matrix(c(1, 2, 3), nrow = 1)
  expect_equal(cumsum_byname(rowmat), rowmat)
  # Test in a list
  expect_equal(cumsum_byname(list(rowmat, rowmat, rowmat)), list(rowmat, 2*rowmat, 3*rowmat))
  # Test in a data frame
  DF2 <- data.frame(m = I(list(rowmat, rowmat, rowmat))) %>% 
    dplyr::mutate(
      m2 = cumsum_byname(m)
    )
  expect_equal(DF2$m2, list(rowmat, 2*rowmat, 3*rowmat))
  # Test with a matrix that will take advantage of the "by name" aspect of sum_byname
  m1 <- matrix(c(1), nrow = 1, ncol = 1, dimnames = list("r1", "c1")) %>% 
    setrowtype("row") %>% setcoltype("col")
  m2 <- matrix(c(2), nrow = 1, ncol = 1, dimnames = list("r2", "c2")) %>% 
    setrowtype("row") %>% setcoltype("col")
  m3 <- matrix(c(3), nrow = 1, ncol = 1, dimnames = list("r3", "c3")) %>% 
    setrowtype("row") %>% setcoltype("col")
  mlist <- list(m1, m2, m3)
  expected <- list(m1, sum_byname(m1, m2), sum_byname(m1, m2) %>% sum_byname(m3))
  expect_equal(cumsum_byname(mlist), expected)
  
  # Ensure that groups are respected in the context of mutate.
  DF3 <- data.frame(grp = c("A", "A", "B"), m = I(mlist)) %>% 
    dplyr::group_by(grp) %>% 
    dplyr::mutate(
      m2 = cumsum_byname(m)
    )
  expect_equal(DF3$m2, list(m1, sum_byname(m1, m2), m3))
})


###########################################################
context("Cumulative product")
###########################################################

test_that("cumprod_byname works as expected", {
  expect_null(cumprod_byname(NULL))
  expect_true(is.na(cumprod_byname(NA)))
  expect_equal(cumprod_byname(2), 2)

  lst <- list(1, 2, 3, 4, 5)
  lst_expected <- list(1, 2, 6, 24, 120)
  expect_equal(cumprod_byname(lst), lst_expected)
  # Try in a data frame.
  DF <- data.frame(l1 = I(lst), l2 = I(lst))
  CS <- DF %>%
    dplyr::mutate(
      cs1 = cumprod_byname(l1),
      cs2 = cumprod_byname(l2)
    )
  expect_equal(CS$cs1, lst_expected)
  expect_equal(CS$cs2, lst_expected)

  # Try with matrices
  rowmat <- matrix(c(1, 2, 3), nrow = 1)
  expect_equal(cumprod_byname(rowmat), rowmat)
  # Test in a list
  expected_powers <- list(rowmat, rowmat*rowmat, rowmat*rowmat*rowmat)
  expect_equal(cumprod_byname(list(rowmat, rowmat, rowmat)), expected_powers)
  # Test in a data frame
  DF2 <- data.frame(m = I(list(rowmat, rowmat, rowmat))) %>%
    dplyr::mutate(
      m2 = cumprod_byname(m)
    )
  expect_equal(DF2$m2, expected_powers)
  # Test with a matrix that will take advantage of the "by name" aspect of sum_byname
  m1 <- matrix(c(1), nrow = 1, ncol = 1, dimnames = list("r1", "c1")) %>%
    setrowtype("row") %>% setcoltype("col")
  m2 <- matrix(c(2), nrow = 1, ncol = 1, dimnames = list("r2", "c2")) %>%
    setrowtype("row") %>% setcoltype("col")
  m3 <- matrix(c(3), nrow = 1, ncol = 1, dimnames = list("r3", "c3")) %>%
    setrowtype("row") %>% setcoltype("col")
  mlist <- list(m1, m2, m3)
  expected <- list(m1, sum_byname(m1, m2) * 0, (sum_byname(m1, m2) %>% sum_byname(m3)) * 0)
  expect_equal(cumprod_byname(mlist), expected)

  # Ensure that groups are respected in the context of mutate.
  DF3 <- data.frame(grp = c("A", "A", "B"), m = I(mlist)) %>%
    dplyr::group_by(grp) %>%
    dplyr::mutate(
      m2 = cumprod_byname(m)
    )
  expect_equal(DF3$m2, list(m1, sum_byname(m1, m2) * 0, m3))
})


###########################################################
context("Replace NaN")
###########################################################

test_that("replaceNaN works as expected", {
  expected <- matrix(c(1,0))
  suppressWarnings(a <- matrix(c(1, sqrt(-1))))
  expect_equal(replaceNaN_byname(a), expected)
  # Should work with lists
  expect_equal(replaceNaN_byname(list(a,a)), list(expected, expected))
  # Try with a different value
  expect_equal(replaceNaN_byname(a, 42), matrix(c(1,42)))
})


###########################################################
context("Counting values")
###########################################################

test_that("count_vals_byname works as expected", {
  m <- matrix(c(0, 1, 2, 3, 4, 0), nrow = 3, ncol = 2)
  # By default, looks for 0's and checks for equality
  expect_equal(count_vals_byname(m), 2)
  expect_equal(count_vals_byname(m, compare_fun = "==", 0), 2)
  expect_equal(count_vals_byname(m, compare_fun = `==`, 0), 2)
  expect_equal(count_vals_byname(m, "==", 0), 2)
  expect_equal(count_vals_byname(m, compare_fun = "!="), 4)
  expect_equal(count_vals_byname(m, compare_fun = `!=`), 4)
  expect_equal(count_vals_byname(m, "<", 1), 2)
  expect_equal(count_vals_byname(m, "<=", 1), 3)
  expect_equal(count_vals_byname(m, ">=", 3), 2)
  expect_equal(count_vals_byname(m, ">", 4), 0)
  expect_equal(count_vals_byname(m, `>`, 4), 0)
  # Should also work for lists
  l <- list(m, m)
  expect_equal(count_vals_byname(l, `>`, 4), list(0, 0))
})


test_that("compare_byname works as expected", {
  m <- matrix(c(0, 1, 2, 3, 4, 0), nrow = 3, ncol = 2)
  expect_equal(compare_byname(m), matrix(c(TRUE, FALSE, FALSE, FALSE, FALSE, TRUE), nrow = 3, ncol = 2))
  expect_equal(compare_byname(m, "<", 3), 
               matrix(c(TRUE, TRUE, TRUE, FALSE, FALSE, TRUE), nrow = 3, ncol = 2))
})
  
  
test_that("count_vals_inrows_byname works as expected", {
  m <- matrix(c(0, 1, 2, 3, 4, 0), nrow = 3, ncol = 2)
  # By default, looks for 0's and checks for equality
  expect_equal(count_vals_inrows_byname(m), matrix(c(1, 0, 1), nrow = 3, ncol = 1))
  expect_equal(count_vals_inrows_byname(m, compare_fun = "==", 0), matrix(c(1, 0, 1), nrow = 3, ncol = 1))
  expect_equal(count_vals_inrows_byname(m, compare_fun = `==`, 0), matrix(c(1, 0, 1), nrow = 3, ncol = 1))
  expect_equal(count_vals_inrows_byname(m, "==", 0), matrix(c(1, 0, 1), nrow = 3, ncol = 1))
  expect_equal(count_vals_inrows_byname(m, compare_fun = "!="), matrix(c(1, 2, 1), nrow = 3, ncol = 1))
  expect_equal(count_vals_inrows_byname(m, compare_fun = `!=`), matrix(c(1, 2, 1), nrow = 3, ncol = 1))
  expect_equal(count_vals_inrows_byname(m, "<", 1), matrix(c(1, 0, 1), nrow = 3, ncol = 1))
  expect_equal(count_vals_inrows_byname(m, "<=", 1), matrix(1, nrow = 3, ncol = 1))
  expect_equal(count_vals_inrows_byname(m, ">=", 3), matrix(c(1, 1, 0), nrow = 3, ncol = 1))
  expect_equal(count_vals_inrows_byname(m, ">", 4), matrix(c(0, 0, 0), nrow = 3, ncol = 1))
  expect_equal(count_vals_inrows_byname(m, `>`, 4), matrix(c(0, 0, 0), nrow = 3, ncol = 1))
  # Should also work for lists
  l <- list(m, m)
  ans <- matrix(c(0, 0, 0), nrow = 3, ncol = 1)
  expect_equal(count_vals_inrows_byname(l, `>`, 4), list(ans, ans))
})


test_that("count_vals_incols_byname works as expected", {
  m <- matrix(c(0, 1, 2, 3, 4, 0), nrow = 3, ncol = 2)
  # By default, looks for 0's and checks for equality
  expect_equal(count_vals_incols_byname(m), matrix(c(1, 1), nrow = 1, ncol = 2))
  expect_equal(count_vals_incols_byname(m, compare_fun = "==", 0), matrix(c(1, 1), nrow = 1, ncol = 2))
  expect_equal(count_vals_incols_byname(m, compare_fun = `==`, 0), matrix(c(1, 1), nrow = 1, ncol = 2))
  expect_equal(count_vals_incols_byname(m, "==", 0), matrix(c(1, 1), nrow = 1, ncol = 2))
  expect_equal(count_vals_incols_byname(m, compare_fun = "!="), matrix(c(2, 2), nrow = 1, ncol = 2))
  expect_equal(count_vals_incols_byname(m, compare_fun = `!=`), matrix(c(2, 2), nrow = 1, ncol = 2))
  expect_equal(count_vals_incols_byname(m, "<", 1), matrix(c(1, 1), nrow = 1, ncol = 2))
  expect_equal(count_vals_incols_byname(m, "<=", 1), matrix(c(2, 1), nrow = 1, ncol = 2))
  expect_equal(count_vals_incols_byname(m, ">=", 3), matrix(c(0, 2), nrow = 1, ncol = 2))
  expect_equal(count_vals_incols_byname(m, ">", 4), matrix(c(0, 0), nrow = 1, ncol = 2))
  expect_equal(count_vals_incols_byname(m, `>`, 4), matrix(c(0, 0), nrow = 1, ncol = 2))
  # Should also work for lists
  l <- list(m, m)
  ans <- matrix(c(0, 2), nrow = 1, ncol = 2)
  expect_equal(count_vals_incols_byname(l, `>`, 2), list(ans, ans))
})


###########################################################
context("Any")
###########################################################

test_that("any_byname works as expected", {
  m <- matrix(rep(TRUE, times = 4), nrow = 2, ncol = 2)
  expect_true(all_byname(m))
  expect_true(any_byname(m))
  
  n <- matrix(c(TRUE, FALSE), nrow = 2, ncol = 1)
  expect_false(all_byname(n))
  expect_true(any_byname(n))
  
  # Also works for lists
  expect_equal(all_byname(list(m,m)), list(TRUE, TRUE))
  expect_equal(any_byname(list(m,m)), list(TRUE, TRUE))
  expect_equal(all_byname(list(n,n)), list(FALSE, FALSE))
  expect_equal(any_byname(list(n,n)), list(TRUE, TRUE))
  
})
