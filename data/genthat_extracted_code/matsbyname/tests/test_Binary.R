# Contains tests for binary functions in the byname package.

###########################################################
context("Sums")
###########################################################

# Define some matrices with product and industry names and types
# These matrices will be used in the tests below.
productnames <- c("p1", "p2")
industrynames <- c("i1", "i2")
U <- matrix(1:4, ncol = 2, dimnames = list(productnames, industrynames)) %>%
  setrowtype("Products") %>% setcoltype("Industries")
V <- matrix(1:4, ncol = 2, dimnames = list(industrynames, productnames)) %>%
  setrowtype("Industries") %>% setcoltype("Products")
Y <- matrix(1:4, ncol = 2, dimnames = list(rev(productnames), rev(industrynames))) %>%
  setrowtype("Products") %>% setcoltype("Industries")
Z <- matrix(rev(1:4), ncol = 2, dimnames = list(rev(productnames), rev(industrynames))) %>%
  setrowtype("Products") %>% setcoltype("Industries")

UplusY <- matrix(5, nrow = 2, ncol = 2, dimnames = dimnames(U)) %>%
  setrowtype(rowtype(U)) %>% setcoltype(coltype(U))
UYZ <- sum_byname(U, Y) %>% sum_byname(Z)
UminusZ <- matrix(0, nrow = 2, ncol = 2, dimnames = dimnames(U)) %>% 
  setrowtype(rowtype(U)) %>% setcoltype(coltype(U))

Uplus100 <- U + 100

test_that("sums of constants works as expected", {
  # Simple sum of constants
  expect_equal(sum_byname(2, 3), 5)
  expect_equal(sum_byname(2, 3, 4), 9)
  
  # If summed against NULL, return the item.
  expect_equal(sum_byname(NULL, 1), 1)
  expect_equal(sum_byname(2, NULL), 2)
  expect_equal(sum_byname(2, NULL, NULL), 2)
  expect_equal(sum_byname(NULL, NULL, 2, NULL, NULL), 2)
  expect_equal(sum_byname(list(NULL, 1), list(2, 3)), list(2, 4))
  expect_equal(sum_byname(list(NULL, 1, 2), list(2, 3, NULL), list(4, NULL, 5)), list(6, 4, 7))
  # If summed against NA, return NA
  expect_equal(sum_byname(2, NA), NA_integer_)
  expect_equal(sum_byname(3, 2, NA), NA_integer_)
})

test_that("sums of matrices works as expected", {
  # If only one argument, return it.
  expect_equal(sum_byname(U), U)
  
  # This is a non-sensical test.  Row and column names are not respected. 
  # Row names, column names, and row and column types come from the first operand (U).
  expect_equal(U + Y, 
               matrix(c(2, 4, 6, 8), ncol = 2, dimnames = dimnames(U)) %>% 
                 setrowtype(rowtype(U)) %>% setcoltype(coltype(U)))
  # Now, row and column names are respected.
  expect_equal(sum_byname(U, Y), UplusY)
  expect_equal(sum_byname(U, Y, Z), sum_byname(U, Z) %>% sum_byname(Y))
  
  expect_equal(sum_byname(U, 100), U + 100)
  expect_equal(sum_byname(200, Y), 200 + Y %>% sort_rows_cols() %>% 
                                               setrowtype(rowtype(Y)) %>% 
                                               setcoltype(coltype(Y)))
  
  # This is a non-sensical test.  Row and column names are not respected.
  # Row names, column names, and row and column types come from the first operand (U).
  expect_equal(U + V,
               matrix(c(2, 4, 6, 8), ncol = 2, dimnames = dimnames(U)) %>% 
                 setrowtype(rowtype(U)) %>% setcoltype(coltype(U)))
  
  # We should not be able to add U and V, because their row and column types differ.
  # Would like to test for entire error message which is 
  # "rowtype(a) == rowtype(b) is not TRUE"
  # However, it seems that the testthat package has trouble dealing with "(" in error messages.
  # So, we'll just test for the first word.
  expect_error(sum_byname(U, V), "rowtype")
})

test_that("sums of matrices in lists and data frames works as expected", {
  # Define a data frame to be used with testing below.
  DF <- data.frame(U = I(list()), Y = I(list()), Z = I(list()))
  DF[[1,"U"]] <- U
  DF[[2,"U"]] <- U
  DF[[1,"Y"]] <- Y
  DF[[2,"Y"]] <- Y
  DF[[1,"Z"]] <- Z
  DF[[2,"Z"]] <- Z
  
  # sum_byname should also work with lists.
  expect_equal(sum_byname(list(U,U), list(Y, Y)), list(UplusY, UplusY))
  expect_equal(sum_byname(list(U,U), list(100,100)), list(Uplus100, Uplus100))
  expect_equal(sum_byname(list(U,U), as.list(rep_len(100, 2))), list(Uplus100, Uplus100))
  
  # sum_byname also should work with data frames, as they are lists.
  expect_equal(sum_byname(DF$U, DF$Y), list(UplusY, UplusY))
  expect_equal(DF %>% dplyr::mutate(sums = sum_byname(U, Y)), 
               DF %>% dplyr::mutate(sums = list(UplusY, UplusY)))
  
  # And sum_byname should work with more than 2 operands.
  expect_equal(sum_byname(DF$U, DF$Y, DF$Z), list(UYZ, UYZ))
})

test_that("sums of matrices that are in lists in a cell of a data frame works as expected", {
  ulist <- list(U, U)
  ylist <- list(Y, Y)
  zlist <- list(Z, Z)
  DF <- data.frame(Ulist = I(list()), Ylist = I(list()), Zlist = I(list()))
  # Put lists in each cell of the data frame.
  DF[[1,"Ulist"]] <- ulist
  DF[[2,"Ulist"]] <- ulist
  DF[[1,"Ylist"]] <- ylist
  DF[[2,"Ylist"]] <- ylist
  DF[[1,"Zlist"]] <- zlist
  DF[[2,"Zlist"]] <- zlist
  
  # Operate on the lists in each cell of the data frame.
  res <- DF %>% 
    dplyr::mutate(
      sum = sum_byname(Ulist, Ylist),
      bigsum = sum_byname(Ulist, Ylist, Zlist)
    )
  expect_equal(res$sum[[1]][[1]], UplusY)
  expect_equal(res$sum[[1]][[2]], UplusY)
  expect_equal(res$sum[[2]][[1]], UplusY)
  expect_equal(res$sum[[2]][[2]], UplusY)
  
  expect_equal(res$bigsum[[1]][[1]], UYZ)
  expect_equal(res$bigsum[[1]][[2]], UYZ)
  expect_equal(res$bigsum[[2]][[1]], UYZ)
  expect_equal(res$bigsum[[2]][[2]], UYZ)
})

test_that("sums of matrices that are in lists in a cell of a data frame works as expected", {
  # Now check to see what happens when one of the operands
  # is a list and the other is not.
  DF2 <- data.frame(ulist2_col = I(list()), Y = I(list()))
  # Put lists in each cell of the data frame.
  ulist2 <- list(U, U)
  DF2[[1,"ulist2_col"]] <- ulist2
  DF2[[2,"ulist2_col"]] <- ulist2
  DF2[[1,"Y"]] <- Y
  DF2[[2,"Y"]] <- Y
  res2 <- DF2 %>% 
    dplyr::mutate(
      sum = sum_byname(ulist2_col, Y)
    )
  expect_equal(res2$sum[[1]][[1]], UplusY)
  expect_equal(res2$sum[[1]][[2]], UplusY)
  expect_equal(res2$sum[[2]][[1]], UplusY)
  expect_equal(res2$sum[[2]][[2]], UplusY)
  
  # Try when the matrix length will not be a multiple of the list length.
  U3 <- matrix(1:5, nrow = 5, ncol = 1, dimnames = list(c("p1", "p2", "p3", "p4", "p5"), "i1")) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  U3plusY <- sum_byname(U3, Y)
  ulist3 <- list(U3, U3, U3)
  DF3 <- data.frame(ulist3_col = I(list()), Y = I(list()))
  DF3[[1,"ulist3_col"]] <- ulist3
  DF3[[2,"ulist3_col"]] <- ulist3
  DF3[[3,"ulist3_col"]] <- ulist3
  DF3[[1,"Y"]] <- Y
  DF3[[2,"Y"]] <- Y
  DF3[[3,"Y"]] <- Y
  res3 <- DF3 %>% 
    dplyr::mutate(
      sum = sum_byname(ulist3_col, Y)
    )
  expect_equal(res3$sum[[1]][[1]], U3plusY)
  expect_equal(res3$sum[[1]][[2]], U3plusY)
  expect_equal(res3$sum[[1]][[3]], U3plusY)
  expect_equal(res3$sum[[2]][[1]], U3plusY)
  expect_equal(res3$sum[[2]][[2]], U3plusY)
  expect_equal(res3$sum[[2]][[3]], U3plusY)
  expect_equal(res3$sum[[3]][[1]], U3plusY)
  expect_equal(res3$sum[[3]][[2]], U3plusY)
  expect_equal(res3$sum[[3]][[3]], U3plusY)
})


###########################################################
context("Differences")
###########################################################

test_that("differences of constants works as expected", {
  # Simple difference of constants
  expect_equal(difference_byname(100, 50), 50)
  
  # If differenced against NULL, return the item.
  expect_equal(difference_byname(NULL, 1), -1)
  expect_equal(difference_byname(2, NULL), 2)
  expect_equal(difference_byname(list(NULL, 1), list(1, 1)), list(-1, 0))
  # If summed against NA, return NA
  expect_equal(difference_byname(2, NA), NA_integer_)
})

test_that("differences of matrices works as expected", {
  # If only one argument, return it.
  expect_equal(difference_byname(U), U)
  
  # This is a non-sensical test.  Row and column names are not respected. 
  # Row names, column names, and row and column types come from the first operand (U).
  expect_equal(U - Z, matrix(c(-3, -1, 1, 3), nrow = 2, dimnames = dimnames(U)) %>% 
                      setrowtype(rowtype(U)) %>% setcoltype(coltype(U)))
               
  # Row and column names respected! Should be all zeroes.
  expect_equal(difference_byname(U, Z), matrix(0, nrow = 2, ncol = 2, dimnames = dimnames(U)) %>% 
                                        setrowtype(rowtype(U)) %>% setcoltype(coltype(U)))
  expect_equal(difference_byname(100, U), matrix(c(99, 98, 97, 96), nrow = 2, dimnames = dimnames(U)) %>% 
                 setrowtype(rowtype(U)) %>% setcoltype(coltype(U)))
  # difference_byname should sort the rows and column names.
  # So we expect the dimnames of the difference to be the same as the dimnames of U (which has sorted dimnames).
  expect_equal(difference_byname(10, Z), matrix(c(9, 8, 7, 6), ncol = 2, dimnames = dimnames(U)) %>% 
                                        setrowtype(rowtype(Z)) %>% setcoltype(coltype(Z)))
  # When subtrahend is missing, return minuend (in this case, Z) with sorted rows and columns.
  expect_equal(difference_byname(Z), sort_rows_cols(Z))
  # When minuend is missing, return - subtrahend (in this case, -Z)
  expect_equal(difference_byname(subtrahend = Z), hadamardproduct_byname(-1, Z))
})
  
test_that("differences of matrices in lists and data frames works as expected", {
  # Define a data frame to be used with testing below.
  DF <- data.frame(U = I(list()), Z = I(list()))
  DF[[1,"U"]] <- U
  DF[[2,"U"]] <- U
  DF[[1,"Z"]] <- Z
  DF[[2,"Z"]] <- Z

  expect_equal(difference_byname(list(100, 100), list(50, 50)), list(50, 50))
  expect_equal(difference_byname(list(U, U), list(Z, Z)), list(UminusZ, UminusZ))
  expect_equal(difference_byname(DF$U, DF$Z), list(UminusZ, UminusZ))
  expect_equal(DF %>% dplyr::mutate(diffs = difference_byname(U, Z)), 
               DF %>% dplyr::mutate(diffs = list(UminusZ)))
})


###########################################################
context("Products")
###########################################################

test_that("matrixproduct_byname works as expected", {
  V <- matrix(1:6, ncol = 3, dimnames = list(c("i1", "i2"), c("p1", "p2", "p3"))) %>%
    setrowtype("Industries") %>% setcoltype("Products")
  Y <- matrix(1:4, ncol = 2, dimnames = list(c("p2", "p1"), c("s2", "s1"))) %>%
    setrowtype("Products") %>% setcoltype("Sectors")
  Z <- matrix(11:14, ncol = 2, dimnames = list(c("s2", "s1"), c("c1", "c2"))) %>% 
    setrowtype("Sectors") %>% setcoltype("Columns")
  VY <- matrix(c(13,5,
                 20,8),
               nrow = 2, ncol = 2, byrow = TRUE,
               dimnames = list(c("i1", "i2"), c("s1", "s2"))) %>% 
    setrowtype("Industries") %>% setcoltype("Sectors")
  VYZ <- matrixproduct_byname(VY, Z)
  # Fails. 3 columns of V cannot be matrix multiplied into 2 rows of Y.  Y lacks a row named p3.
  expect_error(V %*% Y, "non-conformable arguments")
  # Succeeds because Y is completed to include a row named p3 (that contains zeroes).
  # Furthermore, rows and columns of Y are sorted to be in alphabetical order.
  expect_equal(matrixproduct_byname(V, Y), VY)
  expect_equal(matrixproduct_byname(V, Y, Z), VYZ)
  
  M <- matrix(c(11, 12,
                21, 22),
              nrow = 2, ncol = 2, byrow = TRUE) %>% 
    setrownames_byname(c("C", "D")) %>% setcolnames_byname(c("A", "B"))
  I <- identize_byname(M) %>%
    setrownames_byname(c("A", "B")) %>% setcolnames_byname(c("E", "F"))
  expect_equal(matrixproduct_byname(M, I), M %>% setcolnames_byname(colnames(I)))
  I2 <- I %>% setrownames_byname(c("G", "H"))
  # Next line produces results you would expect if you respect 
  # names for the columns of M and the rows of I2.
  expect_equal(matrixproduct_byname(M, I2), 
               matrix(c(0,0,
                        0,0),
                      nrow = 2, ncol = 2, byrow = TRUE) %>% 
                 setrownames_byname(c("C", "D")) %>% 
                 setcolnames_byname(c("E", "F")))
  
  # This works, but does not respect the fact that column names of M
  # are different from the row names of I2.
  expect_equal(M %*% I2, M %>% setrownames_byname(c("C", "D")) %>% setcolnames_byname(c("E", "F")))
               
  # This also works with lists
  expect_equal(matrixproduct_byname(list(V,V), list(Y,Y)), list(VY, VY))
  # And data frames (whose columns are lists)
  DF <- data.frame(V = I(list()), Y = I(list()), Z = I(list()))
  DF[[1,"V"]] <- V
  DF[[2,"V"]] <- V
  DF[[1,"Y"]] <- Y
  DF[[2,"Y"]] <- Y
  DF[[1,"Z"]] <- Z
  DF[[2,"Z"]] <- Z
  expect_equal(matrixproduct_byname(DF$V, DF$Y), list(VY, VY))
  expect_equal(matrixproduct_byname(DF$V, DF$Y, DF$Z), list(VYZ, VYZ))
  
  # And it works with the tidyverse functions
  DF_expected <- data.frame(V = I(list()), Y = I(list()), Z = I(list()), matprods = I(list()), VYZ = I(list()))
  DF_expected[[1, "V"]] <- V
  DF_expected[[2, "V"]] <- V
  DF_expected[[1, "Y"]] <- Y
  DF_expected[[2, "Y"]] <- Y
  DF_expected[[1, "Z"]] <- Z
  DF_expected[[2, "Z"]] <- Z
  DF_expected[[1, "matprods"]] <- VY
  DF_expected[[2, "matprods"]] <- VY
  DF_expected[[1, "VYZ"]] <- VYZ
  DF_expected[[2, "VYZ"]] <- VYZ
  # Because DF_expected$matprods is created with I(list()), its class is "AsIs".
  # Because DF$matprods is created from an actual calculation, its class is NULL.
  # Need to set the class of DF_expected$matprods to NULL to get a match.
  attr(DF_expected$matprods, which = "class") <- NULL
  attr(DF_expected$VYZ, which = "class") <- NULL
  expect_equal(DF %>% 
                 dplyr::mutate(
                   matprods = matrixproduct_byname(V, Y),
                   VYZ = matrixproduct_byname(V, Y, Z)
                 ), 
               DF_expected)
  
  # Test whether this works with a column of matrices multiplied by a single matrix.
  # In other words, we want a single matrix to multiply several matrices.
  # M is a single matrix. 
  # Should obtain same results as above.
  M <- Y
  expect_equal(DF %>% 
                 dplyr::mutate(
                   matprods = matrixproduct_byname(V, M),
                   VYZ = matrixproduct_byname(V, M, Z)), 
               DF_expected)
})

test_that("matrix product with NA is correct", {
  Z <- 42 %>% setrowtype("Product") %>% setcoltype("Industry")
  D <- 42 %>% setrowtype("Industry") %>% setcoltype("Product")
  expect_equal(matrixproduct_byname(NA_real_, D), 
               matrix(NA_real_, nrow = 1, ncol = 1) %>% setcoltype("Product"))
  expect_equal(matrixproduct_byname(Z, NA_real_), 
               matrix(NA_real_, nrow = 1, ncol = 1) %>% setrowtype("Product"))
  
  # Try when a is NA and b is a matrix
  Z2 <- matrix(42, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
    setrowtype("Product") %>% setcoltype("Industry")
  D2 <- matrix(42, nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
    setrowtype("Industry") %>% setcoltype("Product")
  expect_equal(matrixproduct_byname(NA, D2),
               matrix(NA_real_, nrow = 2, ncol = 2, dimnames = dimnames(D2)) %>% setcoltype(coltype(D2)))
  expect_equal(matrixproduct_byname(Z2, NA), 
               matrix(NA_real_, nrow = 2, ncol = 2, dimnames = dimnames(Z2)) %>% setrowtype(rowtype(Z2)))
})

test_that("hadamardproduct_byname works as expected", {
  expect_equal(hadamardproduct_byname(2, 2), 4)
  expect_equal(hadamardproduct_byname(2, 2, 2), 8)
  expect_equal(hadamardproduct_byname(matrix(c(10, 10), nrow = 2, ncol = 1), 1000), 
               matrix(c(10000, 10000), nrow = 2, ncol = 1))
  expect_equal(hadamardproduct_byname(matrix(c(10, 10), nrow = 2, ncol = 1), 1000, 10), 
               matrix(c(100000, 100000), nrow = 2, ncol = 1))
  
  productnames <- c("p1", "p2")
  industrynames <- c("i1", "i2")
  U <- matrix(1:4, ncol = 2, dimnames = list(productnames, industrynames)) %>%
    setrowtype("Products") %>% setcoltype("Industries")
  Y <- matrix(1:4, ncol = 2, dimnames = list(rev(productnames), rev(industrynames))) %>%
    setrowtype("Products") %>% setcoltype("Industries")
  # Not what is desired, because names aren't aligned
  expect_equal(U * Y, 
               matrix(c(1,4,9,16), nrow = 2, dimnames = dimnames(U)) %>% 
                 setrowtype("Products") %>% setcoltype("Industries"))
  UY_expected <- matrix(c(4,6,6,4), nrow = 2, dimnames = dimnames(U)) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  expect_equal(hadamardproduct_byname(U, Y), UY_expected)
  expect_equal(hadamardproduct_byname(U, 0), matrix(c(0,0,0,0), nrow = 2, dimnames = dimnames(U)) %>% 
                 setrowtype("Products") %>% setcoltype("Industries"))
  # See if a product of 4 vectors works as expected
  UUYY_expected <- matrix(c(16, 36, 36, 16), nrow = 2, dimnames = dimnames(U)) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  expect_equal(hadamardproduct_byname(U, U, Y, Y), UUYY_expected)
  
  # Use dimnames(U), because after performing hadamardproduct_byname, 
  # the rows and columns will be sorted alphabetically by name. 
  # U has rows and columns that are sorted alphabetically by name.
  expect_equal(hadamardproduct_byname(0, Y), matrix(c(0,0,0,0), nrow = 2, dimnames = dimnames(U)) %>% 
                 setrowtype("Products") %>% setcoltype("Industries"))
  # This also works with lists
  expect_equal(hadamardproduct_byname(list(U, U), list(Y, Y)), list(UY_expected, UY_expected))
  # And it works with data frames 
  DF <- data.frame(U = I(list()), Y = I(list()))
  DF[[1,"U"]] <- U
  DF[[2,"U"]] <- U
  DF[[1,"Y"]] <- Y
  DF[[2,"Y"]] <- Y
  expect_equal(hadamardproduct_byname(DF$U, DF$Y), list(UY_expected, UY_expected))
  DF_expected <- data.frame(U = I(list()), Y = I(list()), elementprods = I(list()), UUYY = I(list()))
  DF_expected[[1, "U"]] <- U
  DF_expected[[2, "U"]] <- U
  DF_expected[[1, "Y"]] <- Y
  DF_expected[[2, "Y"]] <- Y
  DF_expected[[1, "elementprods"]] <- UY_expected
  DF_expected[[2, "elementprods"]] <- UY_expected
  DF_expected[[1, "UUYY"]] <- UUYY_expected
  DF_expected[[2, "UUYY"]] <- UUYY_expected
  # Because DF_expected$elementprods and DF_expected$UUYY are created with I(list()), 
  # their classes are "AsIs".
  # Because DF$elementprods and DF$UUYY are created from an actual calculation, their classes are NULL.
  # Need to set the class of DF_expected$elementprods 
  # and DF_expected$UUYY to NULL to get a match.
  attr(DF_expected$elementprods, which = "class") <- NULL
  attr(DF_expected$UUYY, which = "class") <- NULL
  expect_equal(DF %>% dplyr::mutate(
    elementprods = hadamardproduct_byname(U, Y), 
    UUYY = hadamardproduct_byname(U, Y, U, Y)
  ), 
  DF_expected)
  # Test with a constant multipliying a column of the DF
  DF_2 <- DF %>% 
    dplyr::mutate(
      c = 10,
      A = hadamardproduct_byname(c, U)
    )
  for (i in c(1:2)) {
    expect_equal(DF_2$A[[i]], DF$U[[i]]*10)
  }
  constant <- 20
  DF_3 <- DF %>% 
    dplyr::mutate(
      B = hadamardproduct_byname(constant, U)
    )
  for (i in c(1:2)) {
    expect_equal(DF_3$B[[i]], DF$U[[i]]*20)
  }
  # Try with two constants multiplying a column of the DF.
  DF_3 <- DF_2 %>% 
    dplyr::mutate(
      d = 0.5,
      B = hadamardproduct_byname(c, d, U)
    )
  for (i in c(1:2)) {
    expect_equal(DF_3$B[[i]], DF$U[[i]]*10*0.5)
  }
  
  # Try with a list of matrices and a single value.
  Ux2_expected <- matrix(c(2, 4, 6, 8), nrow = 2, ncol = 2, dimnames = dimnames(DF$U[[1]])) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  expect_equal(hadamardproduct_byname(DF$U, 2), list(Ux2_expected, Ux2_expected))
  # Try with a list of matrices and a single matrix
  expect_equal(hadamardproduct_byname(DF$U, 
                                     matrix(c(2,2,
                                              2,2), 
                                            nrow = 2, ncol = 2, 
                                            dimnames = dimnames(Ux2_expected)) %>% 
                                       setrowtype("Products") %>% setcoltype("Industries")), 
               list(Ux2_expected, Ux2_expected))
})


###########################################################
context("Quotients")
###########################################################

test_that("quotient_byname works as expected", {
  expect_equal(quotient_byname(100, 50), 2)
  productnames <- c("p1", "p2")
  industrynames <- c("i1", "i2")
  U <- matrix(1:4, ncol = 2, dimnames = list(productnames, industrynames)) %>%
    setrowtype("Products") %>% setcoltype("Industries")
  Y <- matrix(rev(1:4), ncol = 2, dimnames = list(rev(productnames), rev(industrynames))) %>%
    setrowtype("Products") %>% setcoltype("Industries")
  # Non-sensical.  Names aren't aligned
  expect_equal(U/Y, 
               matrix(c(0.25, 2/3, 1.5, 4), nrow = 2, dimnames = dimnames(U)) %>% 
                 setrowtype("Products") %>% setcoltype("Industries"))
  UoverY_expected <- matrix(c(1,1,1,1), nrow = 2, dimnames = dimnames(U)) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  expect_equal(quotient_byname(U, Y), UoverY_expected)
  expect_equal(quotient_byname(U, 10), 
               matrix(c(0.1, 0.2, 0.3, 0.4), nrow = 2, dimnames = dimnames(U)) %>% 
                 setrowtype("Products") %>% setcoltype("Industries"))
  tenoverY_expected <- matrix(c(10, 5, 10/3, 2.5), nrow = 2, dimnames = dimnames(U)) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  expect_equal(quotient_byname(10, Y), tenoverY_expected)
  # This also works with lists
  expect_equal(quotient_byname(10, list(Y,Y)), list(tenoverY_expected, tenoverY_expected))
  # Try more-complicated lists
  expect_equal(quotient_byname(list(10, 10, 10), list(Y, Y, Y)), 
               list(tenoverY_expected, tenoverY_expected, tenoverY_expected))
  mat12 <- matrix(c(1, 2), nrow = 2, ncol = 1, dimnames = list(c("r1", "r2"), "c1"))
  mat34 <- matrix(c(3, 4), nrow = 2, ncol = 1, dimnames = list(c("r1", "r2"), "c1"))
  expect_equal(quotient_byname(list(mat12, mat34), list(2, 4)), 
               list(mat12 / 2, mat34 / 4))
  
  # Use dimnames(U), because after performing quotient_byname, 
  # the rows and columns will be sorted alphabetically by name. 
  # U has rows and columns that are sorted alphabetically by name.
  Yover10_expected <- matrix(c(0.1, 0.2, 0.3, 0.4), nrow = 2, dimnames = dimnames(U)) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  expect_equal(quotient_byname(list(Y,Y), 10), list(Yover10_expected, Yover10_expected))
  expect_equal(quotient_byname(list(U, U), list(Y, Y)), list(UoverY_expected, UoverY_expected))
  # Also works with data frames.
  DF <- data.frame(U = I(list()), Y = I(list()))
  DF[[1,"U"]] <- U
  DF[[2,"U"]] <- U
  DF[[1,"Y"]] <- Y
  DF[[2,"Y"]] <- Y
  expect_equal(quotient_byname(DF$U, DF$Y), list(UoverY_expected, UoverY_expected))
  DF_expected <- data.frame(U = I(list()), Y = I(list()), elementquotients = I(list()))
  DF_expected[[1, "U"]] <- U
  DF_expected[[2, "U"]] <- U
  DF_expected[[1, "Y"]] <- Y
  DF_expected[[2, "Y"]] <- Y
  DF_expected[[1, "elementquotients"]] <- UoverY_expected
  DF_expected[[2, "elementquotients"]] <- UoverY_expected
  # Because DF_expected$elementquotients is created with I(list()), its class is "AsIs".
  # Because DF$elementquotients is created from an actual calculation, its class is NULL.
  # Need to set the class of DF_expected$elementquotients to NULL to get a match.
  attr(DF_expected$elementquotients, which = "class") <- NULL
  expect_equal(DF %>% dplyr::mutate(elementquotients = quotient_byname(U, Y)), DF_expected)
})

test_that("detailed example of quotient_byname works as expected", {
  Lv <- list(
    matrix(c(36.40956907, 
             86.56170245), nrow = 2, ncol = 1), 
    matrix(c(61.97848865, 
             145.7748236), nrow = 2, ncol = 1),
    matrix(c(56.71228867,
             226.8281467), nrow = 2, ncol = 1)) %>% 
    setrownames_byname(c("subcat 1", "subcat 2")) %>% setcolnames_byname("factor") %>% 
    setrowtype("subcat") %>% setcoltype("factor")
  LV <- list(123.3151731, 208.1079558, 285.6464036)
  expected <- list(matrix(c(0.295256197,
                            0.701955001), nrow = 2, ncol = 1), 
                   matrix(c(0.29781893, 
                            0.700476938), nrow = 2, ncol = 1),
                   matrix(c(0.198540181, 
                            0.794087179), nrow = 2, ncol = 1)) %>% 
    setrownames_byname(c("subcat 1", "subcat 2")) %>% setcolnames_byname("factor") %>% 
    setrowtype("subcat") %>% setcoltype("factor")
  expect_equal(quotient_byname(Lv, LV), expected)
  
  # This is the failure mode.
  # Somehow, LV is not maintained as a list. 
  # It comes in as a numeric vector.
  # Then, organize_args turns it into a funky list.
  LVnumeric <- c(123.3151731, 208.1079558, 285.6464036)
  expect_equal(quotient_byname(Lv, LVnumeric), expected)

  # Now try these in a data frame
  DF <- data.frame(Lv = I(list()), LV = I(list()))
  DF[[1,"Lv"]] <- Lv[[1]]
  DF[[2,"Lv"]] <- Lv[[2]]
  DF[[3,"Lv"]] <- Lv[[3]]
  
  DF[[1,"LV"]] <- LV[[1]]
  DF[[2,"LV"]] <- LV[[2]]
  DF[[3,"LV"]] <- LV[[3]]
  DF2 <- DF %>% 
    dplyr::mutate(
      wv = quotient_byname(Lv, LV)
    )
  expect_equal(DF2$wv, expected)
})


###########################################################
context("Element power")
###########################################################

test_that("pow_byname works as expected", {
  # Try with single numbers
  expect_equal(pow_byname(2, 2), 4)
  expect_equal(pow_byname(2, 3), 8)
  expect_equal(pow_byname(-1, 3), -1)
  expect_equal(pow_byname(-1, 4), 1)
  expect_equal(pow_byname(-1000, 0), 1)
  expect_equal(pow_byname(0, 500), 0)
  expect_equal(pow_byname(2, -1), 0.5)
  
  # Try with single matrices
  m <- matrix(2, nrow = 2, ncol = 3)
  sqrtm <- matrix(sqrt(2), nrow = 2, ncol = 3)
  expect_equal(pow_byname(m, 0.5), sqrtm)
  
  # Try with a list of matrices
  expect_equal(pow_byname(list(m, m), 0.5), list(sqrtm, sqrtm))
  
  # Try in a data frame
  DF <- data.frame(m = I(list()), pow = I(list()))
  DF[[1, "m"]] <- m
  DF[[2, "m"]] <- m
  DF[[1, "pow"]] <- 0.5
  DF[[2, "pow"]] <- -1
  res <- DF %>% dplyr::mutate(
    sqrtm = pow_byname(m, 0.5),
    mtopow = pow_byname(m, pow)
  )
  expect_equal(res$sqrtm, list(sqrtm, sqrtm))
  expect_equal(res$mtopow, list(m^0.5, m^-1))
})


###########################################################
context("Means")
###########################################################

test_that("mean_byname works as expected", {
  expect_equal(mean_byname(100, 50), 75)
  expect_equal(mean_byname(0, 0), 0)
  expect_equal(mean_byname(-2, -4), -3)
  expect_equal(mean_byname(-10, 10), 0)
  expect_equal(mean_byname(1,2,3), 2)
  commoditynames <- c("c1", "c2")
  industrynames <- c("i1", "i2")
  U <- matrix(1:4, ncol = 2, dimnames = list(commoditynames, industrynames)) %>%
    setrowtype("Commodities") %>% setcoltype("Industries")
  G <- matrix(rev(1:4), ncol = 2, dimnames = list(rev(commoditynames), rev(industrynames))) %>%
    setrowtype("Commodities") %>% setcoltype("Industries")
  UGavg <- matrix(1:4, nrow = 2, dimnames = list(commoditynames, industrynames)) %>%
    setrowtype("Commodities") %>% setcoltype("Industries")
  # Non-sensical. Row and column names not respected.
  expect_equal((U + G) / 2, 
               matrix(2.5, nrow = 2, ncol = 2, dimnames = list(commoditynames, industrynames)) %>%
                 setrowtype("Commodities") %>% setcoltype("Industries"))
  # Row and column names respected! Should be 1, 2, 3, and 4.
  expect_equal(mean_byname(U, G), UGavg)
  expect_equal(mean_byname(100, U), 
               matrix((100 + 1:4)/2, nrow = 2, dimnames = list(commoditynames, industrynames)) %>%
                 setrowtype("Commodities") %>% setcoltype("Industries"))
  expect_equal(mean_byname(10, G), 
               matrix((10 + 1:4)/2, nrow = 2, dimnames = list(commoditynames, industrynames)) %>%
                 setrowtype("Commodities") %>% setcoltype("Industries"))
  A <- matrix(1:4, nrow = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
    setrowtype("rows") %>% setcoltype("cols")
  B <- 2*A
  C <- 2*B
  ABCavg_expected <- matrix(c((1 + 2 + 4), (3 + 6 + 12), 
                              (2 + 4 + 8), (4 + 8 + 16)) / 3, 
                            byrow = TRUE, nrow = 2, dimnames = dimnames(A)) %>% 
    setrowtype("rows") %>% setcoltype("cols")
  expect_equal(mean_byname(A, B, C), ABCavg_expected)
  
  # This also works with lists
  expect_equal(mean_byname(list(100, 100), list(50, 50)), list(75, 75))
  expect_equal(mean_byname(list(U,U), list(G,G)), list(UGavg, UGavg))
  expect_equal(mean_byname(list(A,A), list(B,B), list(C,C)), list(ABCavg_expected, ABCavg_expected))
  DF <- data.frame(U = I(list()), G = I(list()))
  DF[[1,"U"]] <- U
  DF[[2,"U"]] <- U
  DF[[1,"G"]] <- G
  DF[[2,"G"]] <- G
  expect_equal(mean_byname(DF$U, DF$G), list(UGavg, UGavg))
  DF_expected <- data.frame(U = I(list()), G = I(list()), means = I(list()))
  DF_expected[[1, "U"]] <- U
  DF_expected[[2, "U"]] <- U
  DF_expected[[1, "G"]] <- G
  DF_expected[[2, "G"]] <- G
  DF_expected[[1, "means"]] <- UGavg
  DF_expected[[2, "means"]] <- UGavg
  # Because DF_expected$means is created with I(list()), its class is "AsIs".
  # Because DF$means is created from an actual calculation, its class is NULL.
  # Need to set the class of DF_expected$means to NULL to get a match.
  attr(DF_expected$means, which = "class") <- NULL
  expect_equal(DF %>% dplyr::mutate(means = mean_byname(U, G)), DF_expected)
})

test_that("geometricmean_byname works as expected", {
  expect_equal(geometricmean_byname(0, 0), 0)
  expect_equal(geometricmean_byname(10, 20), sqrt(10*20))
  expect_equal(geometricmean_byname(10, 20, 30), (10*20*30)^(1/3))
  expect_true(is.nan(geometricmean_byname(-10, 10)))
  expect_equal(geometricmean_byname(10, 1000), 100)
  expect_equal(geometricmean_byname(a = matrix(c(10, 10), nrow = 2, ncol = 1), b = 1000), 
               matrix(c(100, 100), nrow = 2, ncol = 1))
  expect_equal(geometricmean_byname(a = 1000, b = matrix(c(10, 10), nrow = 2, ncol = 1)), 
               matrix(c(100, 100), nrow = 2, ncol = 1))
  
  commoditynames <- c("c1", "c2")
  industrynames <- "i1"
  U <- matrix(c(10, 1000), ncol = 1, nrow = 2, dimnames = list(commoditynames, industrynames)) %>%
    setrowtype("Commodities") %>% setcoltype("Industries")
  G <- matrix(c(1e3, 1e5), ncol = 1, nrow = 2, dimnames = list(rev(commoditynames), rev(industrynames))) %>%
    setrowtype("Commodities") %>% setcoltype("Industries")
  UGgeomean <- matrix(c(1000, 1000), nrow = 2, ncol = 1, dimnames = list(commoditynames, industrynames)) %>%
    setrowtype("Commodities") %>% setcoltype("Industries")
  UGGgeomean <- matrix(c(10*1e5*1e5, 1000*1e3*1e3), nrow = 2, ncol = 1,
                       dimnames = list(commoditynames, industrynames))^(1/3) %>% 
    setrowtype("Commodities") %>% setcoltype("Industries")
  # Non-sensical. Row and column names not respected.
  expect_equal(sqrt(U*G), 
               matrix(c(100, 10000), nrow = 2, ncol = 1, dimnames = list(commoditynames, industrynames)) %>%
                 setrowtype("Commodities") %>% setcoltype("Industries"))
  # Row and column names respected!
  expect_equal(geometricmean_byname(U, G), UGgeomean)
  expect_equal(geometricmean_byname(U, G, G), UGGgeomean)
  expect_equal(geometricmean_byname(1000, U), 
               matrix(c(100, 1000), nrow = 2, ncol = 1, dimnames = list(commoditynames, industrynames)) %>%
                 setrowtype("Commodities") %>% setcoltype("Industries"))
  expect_equal(geometricmean_byname(10, G), 
               matrix(c(1000, 100), nrow = 2, ncol = 1, dimnames = list(commoditynames, industrynames)) %>%
                 setrowtype("Commodities") %>% setcoltype("Industries"))
  # This also works with lists
  expect_equal(geometricmean_byname(list(10, 1000), list(1000, 10)), list(100, 100))
  expect_equal(geometricmean_byname(list(U,U), list(G,G)), list(UGgeomean, UGgeomean))
  DF <- data.frame(U = I(list()), G = I(list()))
  DF[[1,"U"]] <- U
  DF[[2,"U"]] <- U
  DF[[1,"G"]] <- G
  DF[[2,"G"]] <- G
  expect_equal(geometricmean_byname(DF$U, DF$G), list(UGgeomean, UGgeomean))
  DF_expected <- data.frame(U = I(list()), G = I(list()), geomeans = I(list()), UGGgeomean = I(list()))
  DF_expected[[1, "U"]] <- U
  DF_expected[[2, "U"]] <- U
  DF_expected[[1, "G"]] <- G
  DF_expected[[2, "G"]] <- G
  DF_expected[[1, "geomeans"]] <- UGgeomean
  DF_expected[[2, "geomeans"]] <- UGgeomean
  DF_expected[[1, "UGGgeomean"]] <- UGGgeomean
  DF_expected[[2, "UGGgeomean"]] <- UGGgeomean
  # Because DF_expected$geomeans is created with I(list()), its class is "AsIs".
  # Because DF$geomeans is created from an actual calculation, its class is NULL.
  # Need to set the class of DF_expected$geomeans to NULL to get a match.
  attr(DF_expected$geomeans, which = "class") <- NULL
  attr(DF_expected$UGGgeomean, which = "class") <- NULL
  expect_equal(DF %>% 
                 dplyr::mutate(
                   geomeans = geometricmean_byname(U, G), 
                   UGGgeomean = geometricmean_byname(U, G, G)
                 ), 
               DF_expected
  )
})

test_that("logmean works as expected", {
  # The logmean function is an internal helper function that should also be tested.
  expect_equal(logmean(0, 0), 0)
  expect_equal(logmean(0, 1), 0)
  expect_equal(logmean(1, 0), 0)
  expect_equal(logmean(1, 1), 1)
  expect_equal(logmean(2, 1), 1.442695041)
  # commutative!
  expect_equal(logmean(1, 2), 1.442695041)
  # base = exp(1), the default
  expect_equal(logmean(1, 10), 3.908650337)
  expect_equal(logmean(1, 10, base = 10), 9)
  # Try negative numbers. 
  # These work, because the denominator is implemented as a ratio.
  expect_equal(logmean(-1, -2), -1.442695041)
  expect_equal(logmean(-2, -1), -1.442695041)
  # These fail, because the denominator will be negative.
  expect_warning(val1 <- logmean(-1, 2), "NaNs produced")
  expect_true(is.nan(val1))
  expect_warning(val2 <- logmean(1, -2), "NaNs produced")
  expect_true(is.nan(val2))
})

test_that("logarithmicmean_byname works as expected", {
  # Should work with single numbers.
  expect_equal(logarithmicmean_byname(0, 0), 0)
  expect_equal(logarithmicmean_byname(0, 1), 0)
  expect_equal(logarithmicmean_byname(1, 0), 0)
  expect_equal(logarithmicmean_byname(1, 1), 1)
  expect_equal(logarithmicmean_byname(2, 1), 1.442695041)
  # commutative!
  expect_equal(logarithmicmean_byname(1, 2), 1.442695041)
  # base = exp(1), the default
  expect_equal(logarithmicmean_byname(1, 10), 3.908650337)
  expect_equal(logarithmicmean_byname(1, 10, base = 10), 9)
  # Try with a matrix and a constant.
  m1 <- matrix(c(1:6), nrow = 3, ncol = 2) %>% 
    setrownames_byname(c("r1", "r2", "r3")) %>% setcolnames_byname(c("c1", "c2")) %>% 
    setrowtype("row") %>% setcoltype("col")
  expected_lmm12 <- matrix(c(1.442695041, 2.885390082, 
                             2, 3.274070004, 
                             2.466303462, 3.640956907), byrow = TRUE,
                           nrow = 3, ncol = 2, dimnames = dimnames(m1)) %>% 
    setrowtype(rowtype(m1)) %>% setcoltype(coltype(m1))
  expect_equal(logarithmicmean_byname(m1, 2), expected_lmm12)
  expect_equal(logarithmicmean_byname(2, m1), expected_lmm12) 
  # Try with a matrix and a constant in lists
  expect_equal(logarithmicmean_byname(list(m1, m1), list(2, 2)), list(expected_lmm12, expected_lmm12))
  expect_equal(logarithmicmean_byname(list(2, 2), list(m1, m1)), list(expected_lmm12, expected_lmm12))
  expect_equal(logarithmicmean_byname(list(m1, m1), 2), list(expected_lmm12, expected_lmm12))
  expect_equal(logarithmicmean_byname(2, list(m1, m1)), list(expected_lmm12, expected_lmm12))
  
  # Try with two matrices
  m2 <- matrix(c(7:12), nrow = 3, ncol = 2) %>% 
    setrownames_byname(c("r2", "r3", "r4")) %>% setcolnames_byname(c("c2", "c3")) %>% 
    setrowtype("row") %>% setcoltype("col")
  logmean <- logarithmicmean_byname(m1, m2)
  expectedlm <- matrix(c(0, 0, 0, 
                         0, 5.944026824, 0,
                         0, 6.952118994, 0,
                         0, 0, 0), nrow = 4, ncol = 3, byrow = TRUE) %>% 
    setrownames_byname(c("r1", "r2", "r3", "r4")) %>% setcolnames_byname(c("c1", "c2", "c3")) %>% 
    setrowtype("row") %>% setcoltype("col")
  expect_equal(logmean, expectedlm)
  # This also works with lists
  expect_equal(logarithmicmean_byname(list(m1, m1), list(m2, m2)), list(expectedlm, expectedlm))
  DF <- data.frame(m1 = I(list()), m2 = I(list()))
  DF[[1,"m1"]] <- m1
  DF[[2,"m1"]] <- m1
  DF[[1,"m2"]] <- m2
  DF[[2,"m2"]] <- m2
  expect_equal(logarithmicmean_byname(DF$m1, DF$m2), list(expectedlm, expectedlm))
  DF_expected <- data.frame(m1 = I(list()), m2 = I(list()), logmeans = I(list()))
  DF_expected[[1, "m1"]] <- m1
  DF_expected[[2, "m1"]] <- m1
  DF_expected[[1, "m2"]] <- m2
  DF_expected[[2, "m2"]] <- m2
  DF_expected[[1, "logmeans"]] <- logmean
  DF_expected[[2, "logmeans"]] <- logmean
  # Because DF_expected$geomeans is created with I(list()), its class is "AsIs".
  # Because DF$geomeans is created from an actual calculation, its class is NULL.
  # Need to set the class of DF_expected$geomeans to NULL to get a match.
  attr(DF_expected$logmeans, which = "class") <- NULL
  expect_equal(DF %>% dplyr::mutate(logmeans = logarithmicmean_byname(m1, m2)), DF_expected)
})



###########################################################
context("Equal and identical")
###########################################################

test_that("equal_byname works as expected", {
  
  # Try with single numbers
  expect_true(equal_byname(2, 2))
  expect_true(equal_byname(2, 2, 2))
  expect_false(equal_byname(2, 3, 5))
  expect_false(equal_byname(2, 2, 5))

  # Try without row and column names
  a <- matrix(1:4, nrow = 2)
  expect_true(equal_byname(a, a))
  expect_true(equal_byname(a, a, a))
  b <- matrix(4:1, nrow = 2)
  expect_true(equal_byname(b, b, b))
  expect_false(equal_byname(a, b))
  expect_false(equal_byname(a, a, b))
  expect_false(equal_byname(b, a, a))
  b <- matrix(1:4, nrow = 2)
  expect_true(equal_byname(a, b))
  expect_true(equal_byname(a, a, b))
  expect_true(equal_byname(b, a, a, b))
  
  a <- a %>% setrowtype("Industries") %>% setcoltype("Products")
  # FALSE because a has row and column types, but b does not.
  expect_false(equal_byname(a, b))
  
  b <- b %>% setrowtype("Industries") %>% setcoltype("Products")
  # TRUE because b now has same row and column types as a.
  expect_true(equal_byname(a, b))
  
  dimnames(a) <- list(c("i1", "i2"), c("p1", "p2"))
  dimnames(b) <- list(c("p1", "p2"), c("i1", "i2"))
  # FALSE, because row and column names are not equal
  expect_false(equal_byname(a, b)) 
  # Put back the way it was, and it should work.
  dimnames(b) <- dimnames(a)
  expect_true(equal_byname(a, b))
  
  # Try with lists.
  expect_equal(equal_byname(list(a, a), list(b, b)), list(TRUE, TRUE))
  
  # Try with two unsorted matrices. They should be equal (byname), 
  # because they will be sorted prior to comparison.
  matc <- matrix(c(1, 2), nrow = 2, dimnames = list(c("r1", "r2"), c("c1")))
  matd <- matrix(c(2, 1), nrow = 2, dimnames = list(c("r2", "r1"), c("c1")))
  # This is not what we want. Comparison is not done "byname", as we wish.
  expect_equal(matc == matd, matrix(c(FALSE, FALSE), nrow = 2, dimnames = list(c("r1", "r2"), c("c1"))))
  # This works as desired. The comparison is handled by the function, not the analyst.
  expect_true(equal_byname(matc, matd))
  expect_true(equal_byname(matc, matc, matd))
  expect_equal(equal_byname(list(matc, matc), list(matd, matd), list(matc, matc)), list(TRUE, TRUE))
  
  # Try within data frames
  DF <- data.frame(matc = I(list()), matd = I(list()))
  DF[[1,"matc"]] <- matc
  DF[[2,"matc"]] <- matc
  DF[[1,"matd"]] <- matd
  DF[[2,"matd"]] <- matd
  DF_2 <- DF %>% 
    dplyr::mutate(
      equal = equal_byname(matc, matd)
    )
  expect_equal(DF_2$equal, list(TRUE, TRUE))
  


  # When two objects have different order for attributes, equal_byname should still return true.
  a <- 2 %>% setrowtype("row") %>% setcoltype("col")
  b <- 2 %>% setcoltype("col") %>% setrowtype("row")
  expect_true(equal_byname(a, b))
  # But if the objects have different attributes, the comparison should fail.
  c <- a %>% setcoltype("cols")
  expect_false(equal_byname(c, b))
  
  # Try with some numerical fuzz.
  e <- matrix(1:4, nrow = 2)
  f <- matrix(1:4, nrow = 2)
  # equal_byname works
  expect_true(equal_byname(e, f))
  equal_byname(e, f + 1e-100)
  # But identical_byname should fail
  expect_false(identical_byname(e, f + 1e-100))
})

test_that("identical_byname works as expected", {
  expect_true(identical_byname(100, 100))
  # With a little bit of numerical fuzz, identical_byname fails
  expect_false(identical_byname(100, 100 + 1e-10))
  # With a little bit of numerical fuzz, equal_byname passes
  expect_true(equal_byname(100, 100 + 1e-10))
  # Now try with matrices
  a <- matrix(1:4, nrow = 2)
  b <- matrix(1:4, nrow = 2)
  expect_true(identical_byname(a, b))
  expect_false(identical_byname(a, b + 1e-100))
  a <- a %>% setrowtype("Industries") %>% setcoltype("Commodities")
  # FALSE because a has row and column types, but b does not.
  expect_false(identical_byname(a, b)) 
  b <- b %>% setrowtype("Industries") %>% setcoltype("Commodities")
  expect_true(identical_byname(a, b))
  dimnames(a) <- list(c("i1", "i2"), c("c1", "c2"))
  dimnames(b) <- list(c("c1", "c2"), c("i1", "i2"))
  # FALSE, because row and column names are not equal
  expect_false(identical_byname(a, b)) 
  dimnames(b) <- dimnames(a)
  expect_true(identical_byname(a, b))
})

  

###########################################################
context("Utilities")
###########################################################

test_that("samestructure_byname works as expected", {
  expect_true(samestructure_byname(2, 2))
  expect_false(samestructure_byname(2, 2 %>% setrowtype("row")))
  expect_false(samestructure_byname(2 %>% setrowtype("row"), 2))
  productnames <- c("p1", "p2")
  industrynames <- c("i1", "i2")
  U <- matrix(1:4, ncol = 2, dimnames = list(productnames, industrynames)) %>%
    setrowtype("Products") %>% setcoltype("Industries")
  V <- matrix(5:8, ncol = 2, dimnames = list(productnames, industrynames)) %>%
    setrowtype("Products") %>% setcoltype("Industries")
  expect_true(samestructure_byname(U, U))
  expect_true(samestructure_byname(U, V))
  expect_true(samestructure_byname(V, U))
  expect_false(samestructure_byname(U, U %>% setrowtype("row")))
  expect_false(samestructure_byname(U %>% setcoltype("col"), U))
  expect_false(samestructure_byname(U, U %>% setrownames_byname(c("a", "b"))))
  expect_false(samestructure_byname(U, U %>% setcolnames_byname(c("a", "b"))))
  expect_true(samestructure_byname(U, U))
  # Also works for lists
  expect_true(all(samestructure_byname(list(U, U), list(U, U)) %>% as.logical()))
  expect_true(all(samestructure_byname(list(U, U), list(V, V)) %>% as.logical()))
  expect_true(all(samestructure_byname(list(V, V), list(U, U)) %>% as.logical()))
  # Check when one or both of rowtype or coltype is NULL
  expect_false(samestructure_byname(U, U %>% setrowtype(NULL)))
  expect_false(samestructure_byname(U, U %>% setcoltype(NULL)))
})

test_that("make_pattern works as expected", {
  expect_equal(make_pattern(row_col_names = c("a", "b"), pattern_type = "exact"), "^a$|^b$")
  expect_equal(make_pattern(row_col_names = c("a", "b"), pattern_type = "leading"), "^a|^b")
  expect_equal(make_pattern(row_col_names = c("a", "b"), pattern_type = "trailing"), "a$|b$")
  expect_equal(make_pattern(row_col_names = c("a", "b"), pattern_type = "anywhere"), "a|b")
  expect_equal(make_pattern(row_col_names = "Non-specified (industry)", pattern_type = "exact"), "^Non-specified \\(industry\\)$")
  # Check with a list and parentheses
  expect_equal(make_pattern(row_col_names = c("a(1)", "a(2)"), pattern_type = "exact"), 
               "^a\\(1\\)$|^a\\(2\\)$")
})
  
test_that("list_of_rows_or_cols works as expected", {
  m <- matrix(data = c(1:6), nrow = 2, ncol = 3, dimnames = list(c("p1", "p2"), c("i1", "i2", "i3"))) %>% 
    setrowtype(rowtype = "Products") %>% setcoltype(coltype = "Industries")
  expected_margin_1 <- list(p1 = matrix(seq(1, 5, by = 2), nrow = 3, ncol = 1, dimnames = list(c("i1", "i2", "i3"), "p1")) %>% 
                              setrowtype("Industries") %>% setcoltype("Products"), 
                            p2 = matrix(seq(2, 6, by = 2), nrow = 3, ncol = 1, dimnames = list(c("i1", "i2", "i3"), "p2")) %>% 
                              setrowtype("Industries") %>% setcoltype("Products"))
  expected_margin_2 <- list(i1 = matrix(1:2, nrow = 2, ncol = 1, dimnames = list(c("p1", "p2"), "i1")) %>% 
                              setrowtype("Products") %>% setcoltype("Industries"),
                            i2 = matrix(3:4, nrow = 2, ncol = 1, dimnames = list(c("p1", "p2"), "i2")) %>% 
                              setrowtype("Products") %>% setcoltype("Industries"),
                            i3 = matrix(5:6, nrow = 2, ncol = 1, dimnames = list(c("p1", "p2"), "i3")) %>% 
                              setrowtype("Products") %>% setcoltype("Industries"))
  expect_equal(list_of_rows_or_cols(m, margin = 1), expected = expected_margin_1)
  expect_equal(list_of_rows_or_cols(m, margin = 2), expected = expected_margin_2)
  
  # Using data frames
  DF <- data.frame(m = I(list()))
  DF[[1,"m"]] <- m
  DF[[2,"m"]] <- m
  DF <- DF %>% dplyr::mutate(
    extracted_rows = list_of_rows_or_cols(m, margin = 1), 
    extracted_cols = list_of_rows_or_cols(m, margin = 2)
  )
  expect_equal(DF$extracted_rows, list(expected_margin_1, expected_margin_1))
  expect_equal(DF$extracted_cols, list(expected_margin_2, expected_margin_2))
})

test_that("organize_args works as expected", {
  # If only one argument is a list, make the other argument also a list of equal length.
  expect_equal(matsbyname:::organize_args(a = list(1,2), b = 3), list(a = list(1,2), b = list(3,3)))
  expect_equal(matsbyname:::organize_args(a = 3, b = list(1,2)), list(a = list(3,3), b = list(1,2)))
  
  # If both arguments are lists, ensure that they are same length.
  expect_equal(matsbyname:::organize_args(a = list(1,2,3), b = list(4,5,6)), list(a = list(1,2,3), b = list(4,5,6)))
  expect_error(matsbyname:::organize_args(a = list(1,2,3), b = list(4,5,6,7)), "length\\(a\\) == length\\(b\\) is not TRUE") 
  
  # If one argument is a matrix and the other is a constant, make the constant into a matrix.
  m <- matrix(c(1,2,3,4), nrow = 2, dimnames = list(c("p1", "p2"), c("i1", "i2"))) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  expect_equal(matsbyname:::organize_args(a = m, b = 2), 
               list(a = m, b = matrix(2, nrow = 2, ncol = 2, dimnames = list(c("p1", "p2"), c("i1", "i2"))) %>% 
                      setrowtype("Products") %>% setcoltype("Industries")))
  
  # Ensures that row and column types match
  # Completes and sorts the matrices
  n <- matrix(c(1:6), nrow = 3, ncol = 2, dimnames = list(c("p1", "p2", "p3"), c("i1", "i2"))) %>% 
    setrowtype("Products") %>% setcoltype("Industries")
  # Neither row nor column types match, but error will say column types are mismatched.
  expect_error(matsbyname:::organize_args(a = m %>% setrowtype("rows"), b = n), 
               "rowtype\\(a\\) \\(rows\\) != rowtype\\(b\\) \\(Products\\).")
  # By setting the rowtype to match, the error should shift to mismatched column types
  expect_error(matsbyname:::organize_args(a = m, b = n %>% setcoltype("cols")), 
               "coltype\\(a\\) \\(Industries\\) != coltype\\(b\\) \\(cols\\).")
  # This should work, because the rowtype and coltype are now same for both
  expect_equal(matsbyname:::organize_args(a = m, b = n), 
               list(a = matrix(c(1,3,
                                 2,4,
                                 0,0),
                               nrow = 3, ncol = 2, byrow = TRUE,
                               dimnames = list(c("p1", "p2", "p3"), c("i1", "i2"))) %>% 
                      setrowtype("Products") %>% setcoltype("Industries"), 
                    b = matrix(c(1,4,
                                 2,5,
                                 3,6),
                               nrow = 3, ncol = 2, byrow = TRUE,
                               dimnames = list(c("p1", "p2", "p3"), c("i1", "i2"))) %>% 
                      setrowtype("Products") %>% setcoltype("Industries")))
  
  # If one argument is a list and the other argument is a matrix, duplicate the matrix to match the length of the list
  expect_equal(matsbyname:::organize_args(a = list(1, 2), b = m), list(a = list(1, 2), b = list(m, m)))
  expect_equal(matsbyname:::organize_args(a = n, b = list(m, m)), list(a = list(n, n), b = list(m, m)))
  
  # Test the match_type argument
  p <- transpose_byname(n)
  # If we don't specify match_type = "matmult", 
  # organize_args will try to ensure that rows of m and rows of p are same type. 
  # organize_args will also try to ensure that cols of m and cols of p are same type.
  # These aren't true, so this will error.
  expect_error(matsbyname:::organize_args(a = m, b = p), 
               "rowtype\\(a\\) \\(Products\\) != rowtype\\(b\\) \\(Industries\\).")
  # When we say match_type = "matmult", we indicate that the columns of a and the rows of b must match.
  expect_equal(matsbyname:::organize_args(a = m, b = p, match_type = "matmult"), list(a = m, b = p))
  
  # Test that values are filled appropriately.
  expect_equal(matsbyname:::organize_args(a = NULL, b = 5, fill = 42), list(a = 42, b = 5))
  expect_equal(matsbyname:::organize_args(b = 5, fill = 42), list(a = 42, b = 5))
  expect_equal(matsbyname:::organize_args(a = 3, b = NULL, fill = 42), list(a = 3, b = 42))
  expect_equal(matsbyname:::organize_args(a = 3, fill = 42), list(a = 3, b = 42))
})


###########################################################
context("Testing in a data frame")
###########################################################

test_that("matrix multiplied by a constant in a data frame works", {
  matA <- matrix(c(1:4), nrow = 2, ncol = 2, dimnames = list(c("p1", "p2"), c("i1", "i2"))) %>% 
    setrowtype("Industries") %>% setcoltype("Products")
  temp <- data.frame(matrix = I(list()), vals = I(list()))
  temp[[1, "matrix"]] <- "A"
  temp[[1, "vals"]] <- matA
  mats <- temp %>% 
    dplyr::rename(
      matrix.name = matrix,
      matrix = vals
    ) %>% 
    tidyr::spread(key = matrix.name, value = matrix) %>% 
    # Duplicate the row to demonstrate byname operating simultaneously 
    # on all rows of the data frame.
    rbind(., .) %>% 
    dplyr::mutate(
      constant = make_list(x = 1:2, n = 2, lenx = 2),
      # Multiplies matrices in the sum column by corresponding constants in the c column.
      product = hadamardproduct_byname(constant, A)
    )
  expect_equal(mats$product[[1]], matrix(c(1, 3,
                                           2, 4),
                                         nrow = 2, byrow = TRUE) %>% 
                 setrownames_byname(c("p1", "p2")) %>% setcolnames_byname(c("i1", "i2")) %>% 
                 setrowtype("Industries") %>% setcoltype("Products"))
  expect_equal(mats$product[[2]], matrix(c(2, 6,
                                           4, 8),
                                         nrow = 2, byrow = TRUE) %>% 
                 setrownames_byname(c("p1", "p2")) %>% setcolnames_byname(c("i1", "i2")) %>% 
                 setrowtype("Industries") %>% setcoltype("Products"))
})


###########################################################
context("And")
###########################################################

test_that("and_byname works as expected", {
  # Test with non-logicals. 0 is interpreted as FALSE, any other number is interpreted as TRUE.
  expect_true(and_byname(2, 2))
  expect_false(and_byname(0, -1000))
  # Test with single values.
  expect_true(and_byname(TRUE))
  expect_false(and_byname(FALSE))
  expect_true(and_byname(TRUE, TRUE))
  expect_true(and_byname(TRUE, TRUE, TRUE))
  expect_false(and_byname(TRUE, TRUE, FALSE, TRUE))
  
  # Test with lists
  expect_equal(and_byname(list(TRUE)), list(TRUE))
  expect_equal(and_byname(list(FALSE)), list(FALSE))
  expect_equal(and_byname(list(TRUE, TRUE)), list(TRUE, TRUE))
  expect_equal(and_byname(list(TRUE, TRUE, TRUE)), list(TRUE, TRUE, TRUE))
  expect_equal(and_byname(list(FALSE, TRUE, TRUE, TRUE)), list(FALSE, TRUE, TRUE, TRUE))
  expect_equal(and_byname(list(TRUE, FALSE), list(TRUE, TRUE)), list(TRUE, FALSE))
  expect_equal(and_byname(list(TRUE, FALSE), list(TRUE, TRUE), list(TRUE, TRUE), list(TRUE, TRUE)), list(TRUE, FALSE))
  
  # Test with matrices
  m1 <- matrix(c(TRUE, TRUE, TRUE, FALSE), nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2")))
  m2 <- matrix(c(TRUE, FALSE, TRUE, TRUE), nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2")))
  expect_equal(and_byname(m1, m1), m1)
  expect_equal(and_byname(m1, m2), m1 & m2)
  # Test with lists of matrices
  expect_equal(and_byname(list(m1, m1), list(m2, m2)), list(m1 & m2, m1 & m2))
  expect_equal(and_byname(list(m1, m1), list(m1, m1), list(m2, m2)), list(m1 & m2, m1 & m2))
})

