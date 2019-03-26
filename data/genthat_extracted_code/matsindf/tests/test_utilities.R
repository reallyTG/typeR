# Contains tests for the matsindf package.

# Need to put dplyr before testthat.
# If not, the "matches" function in dplyr overrides the "matches" function in testthat,
# and tests containing the string "(" don't work as expected.

library(dplyr)
library(magrittr)
library(matsbyname)
library(tibble)
library(tidyr)
library(testthat)

###########################################################
context("Utilities")
###########################################################

test_that("index_column works as expected", {
  DF1 <- data.frame(Country = c("US", "US", "US"), Year = c(1980, 1981, 1982), var = c(10, 20, 40))
  expected1 <- DF1 %>%
    mutate(
      var_indexed = c(1, 2, 4)
    )
  # Group on the indexing variable to obtain an error.
  expect_error(index_column(DF1 %>% group_by(var), var_to_index = "var"),
               "Indexing variable 'var' in groups of .DF in index_column.")
  # Group on the time variable to obtain an error.
  expect_error(index_column(DF1 %>% group_by(Year), var_to_index = "var"),
               "Time variable 'Year' in groups of .DF in index_column.")
  # Group on the correct variable to achieve success.
  expect_equal(index_column(DF1 %>% group_by(Country), var_to_index = "var"), expected1)

  # Test with 2 groups.
  DF2 <- DF1 %>%
    ungroup() %>%
    mutate(
      Country = as.character(Country)
    ) %>%
    dplyr::bind_rows(data.frame(Country = c("GH", "GH", "GH"), Year = c(2011, 2012, 2013), var = c(1, 2, 4), stringsAsFactors = FALSE))
  expected2 <- DF2 %>%
    mutate(
      var_indexed = c(1, 2, 4, 1, 2, 4)
    )
  # Index on the (default) first year in each group.
  expect_equal(index_column(DF2 %>% group_by(Country), var_to_index = "var"), expected2)
  # Index on a specified year
  DF2half <- DF2 %>%
    mutate(
      Year = c(2011, 2012, 2013, 2011, 2012, 2013)
    )
  expected2half <- DF2half %>%
    mutate(
      var_indexed = c(0.5, 1, 2, 0.5, 1, 2)
    )
  expect_equal(index_column(DF2half %>% group_by(Country), var_to_index = "var", index_time = 2012),
               expected2half)

  # Test when the variable to be indexed is a column of a data frame containing matrices.
  # In this case, we expect an element-by-element division of the matrices to occur
  DF3 <- data.frame(
    Country  = rep("US", times = 12),
    Year     = rep(c(1980, 1981, 1982), each = 4),
    matname  = rep("m", times = 12),
    rowname  = rep(c("r1", "r2"), times = 6),
    colname  = rep(c("c1", "c2"), each = 2),
    matvals  = rep(c(10, 20, 40), each = 4),
    rowtypes = "row",
    coltypes = "col"
  ) %>%
    group_by(Country, Year, matname) %>%
    collapse_to_matrices(matnames = "matname",  matvals = "matvals",
                         rownames = "rowname",  colnames = "colname",
                         rowtypes = "rowtypes", coltypes = "coltypes")
  expected3 <- data.frame(
    Country = rep("US", times = 12),
    Year    = rep(c(1980, 1981, 1982), each = 4),
    matname = rep("m", times = 12),
    rowname = rep(c("r1", "r2"), times = 6),
    colname = rep(c("c1", "c2"), each = 2),
    matvals_indexed = rep(c(1, 2, 4), each = 4),
    rowtypes = "row",
    coltypes = "col"
  ) %>%
    group_by(Country, Year, matname) %>%
    collapse_to_matrices(matnames = "matname",  matvals = "matvals_indexed",
                         rownames = "rowname",  colnames = "colname",
                         rowtypes = "rowtypes", coltypes = "coltypes") %>%
    # Add the matvals column
    mutate(
      matvals = DF3$matvals
    ) %>%
    # Put in the expected order
    select(Country, Year, matname, matvals, matvals_indexed)

  expect_equal(index_column(DF3 %>% group_by(Country, matname), var_to_index = "matvals") %>% as.data.frame(), expected3)
})

test_that("rowcolval_to_mat (collapse) works as expected", {
  # Establish some matrices that we expect to see.
  expected_mat <- matrix(c(11, 12,
                           0,  22),
                         nrow = 2, ncol = 2, byrow = TRUE,
                         dimnames = list(c("p1", "p2"), c("i1", "i2")))
  expected_mat_with_types <- expected_mat %>%
    setrowtype("Products") %>% setcoltype("Industries")

  # Create a data frame that can be converted to a matrix.
  rowcolval <- data.frame(Country  = c("GH", "GH", "GH"),
                          rows = c( "p1",  "p1", "p2"),
                          cols = c( "i1",  "i2", "i2"),
                          vals = c(  11  ,  12,   22 ))
  A <- rowcolval_to_mat(rowcolval, rownames = "rows", colnames = "cols", matvals = "vals", rowtypes = NULL, coltypes = NULL)
  expect_equal(class(A), "matrix")
  expect_equal(A, expected_mat)
  expect_null(rowtype(A)) # rowtype has not been set
  expect_null(coltype(A)) # coltype has not been set

  # Provide single row and column types to be applied to all entries.
  B <- rowcolval_to_mat(rowcolval, rownames = "rows", colnames = "cols", matvals = "vals",
                        rowtypes  = "Products", coltypes  = "Industries")
  expect_equal(B, expected_mat_with_types)

  # Provide row and column types in the data frame and specify columns in the call to rowcolval_to_mat.
  C <- rowcolval %>% bind_cols(data.frame(rt = c("Products", "Products", "Products"),
                                          ct = c("Industries", "Industries", "Industries"))) %>%
    rowcolval_to_mat(rownames = "rows", colnames = "cols", matvals = "vals",
                     rowtypes = "rt", coltypes = "ct")
  expect_equal(C, expected_mat_with_types)

  # Also works for single values if both the rownames and colnames columns contain NA
  rowcolval2 <- data.frame(Country = c("GH"), rows = c(NA), cols = c(NA),
                           rowtypes = c(NA), coltypes = c(NA), vals = c(2))
  D <- rowcolval2 %>% rowcolval_to_mat(rownames = "rows", colnames = "cols", matvals = "vals",
                                       rowtypes = "rowtype", coltypes = "coltype")
  expect_equal(D, 2)

  # Try without rowtype or coltype columns in the data frame.
  rowcolval3 <- data.frame(Country = c("GH"), rows = c(NA), cols = c(NA), vals = c(2))
  E <- rowcolval3 %>% rowcolval_to_mat(rownames = "rows", colnames = "cols", matvals = "vals")
  expect_equal(E, 2)

  # Fails when rowtype or coltype not all same. In rowcolval4, column rt is not all same.
  rowcolval4 <- rowcolval %>% bind_cols(data.frame(rt = c("Products", "Industries", "Products"),
                                              ct = c("Industries", "Industries", "Industries")))
  expect_error(rowcolval_to_mat(rowcolval4,
                                rownames = "rows", colnames = "cols",
                                matvals = "vals",
                                rowtypes = "rt", coltypes = "ct"), "Not all values in rt \\(rowtype\\) were same as first entry: Products")
  rowcolval5 <- rowcolval %>% bind_cols(data.frame(rt = c("Products", "Products", "Products"),
                                              ct = c("Industries", "Products", "Industries")))
  expect_error(rowcolval_to_mat(rowcolval5,
                                rownames = "rows", colnames = "cols",
                                matvals = "vals",
                                rowtypes = "rt", coltypes = "ct"), "Not all values in ct \\(coltype\\) were same as first entry: Industries")
})


test_that("mat_to_rowcolval (expand) works as expected", {
  # This is the matrix we expect to obtain.
  expected_mat <- matrix(c(11, 12,
                           0,  22),
                         nrow = 2, ncol = 2, byrow = TRUE,
                         dimnames = list(c("p1", "p2"), c("i1", "i2"))) %>%
    setrowtype("Products") %>% setcoltype("Industries")

  # This is the data frame that we'll use the construct the matrix
  data <- data.frame(rows = c( "p1",  "p1", "p2"),
                     cols = c( "i1",  "i2", "i2"),
                     vals = c(  11  ,  12,   22 ),
                     rt = c("Products", "Products", "Products"),
                     ct = c("Industries", "Industries", "Industries")) %>%
    mutate(
      rows = as.character(rows),
      cols = as.character(cols),
      rt = as.character(rt),
      ct = as.character(ct)
    ) %>%
    set_rownames(NULL)

  # Construct the matrix that we'll convert later to a data frame.
  A <- data %>%
    rowcolval_to_mat(rownames = "rows", colnames = "cols",
                     rowtypes = "rt",   coltypes = "ct", matvals = "vals")
  expect_equal(A, expected_mat)

  # Verify that if we feed garbage into the function, we obtain an error
  expect_error(mat_to_rowcolval("A",
                   rownames = "rows", colnames = "cols",
                   rowtypes = "rt", coltypes = "ct",
                   matvals = "vals",
                   drop = 0) %>% set_rownames(NULL),
               "Unknown type of .matrix in mat_to_rowcolval A of class character and length 1")

  # Veryfy that we can convert the matrix to a data frame.
  expect_equal(mat_to_rowcolval(A,
                                rownames = "rows", colnames = "cols",
                                rowtypes = "rt", coltypes = "ct",
                                matvals = "vals",
                                drop = 0) %>%
                 set_rownames(NULL),
               data)

  # Try when rowtype and coltype are not specified.
  A_trimmed <- A %>% setrowtype(NULL) %>% setcoltype(NULL)
  expect_equal(mat_to_rowcolval(A_trimmed,
                                rownames = "rows", colnames = "cols",
                                matvals = "vals",
                                drop = 0) %>%
                 set_rownames(1:nrow(.)),
               data %>% mutate(rt = NULL, ct = NULL))


  # Verify that drop works correctly.
  expect_equal(
    mat_to_rowcolval(A,
                     rownames = "rows", colnames = "cols",
                     rowtypes = "rt", coltypes = "ct",
                     matvals = "vals",
                     drop = 0) %>%
      rownames() %>% as.numeric(),
    # Rownames are 1, 3, 4, because row 2 (p2, i1) has an entry of 0.
    c(1, 3, 4))

  # This also works for single values
  expect_equal(mat_to_rowcolval(2, rownames = "rows", colnames = "cols", rowtypes = "rt", coltypes = "ct", matvals = "vals"),
               data.frame(rows = NA, cols = NA, vals = 2, rt = NA, ct = NA)
  )
  # For a 0 value when we drop 0's, we get a zero-length data frame
  B <- mat_to_rowcolval(0,
                        rownames = "rows", colnames = "cols",
                        rowtypes = "rt", coltypes = "ct",
                        matvals = "vals",
                        drop = 0)
  expect_equal(B %>% nrow(), 0)
  expect_equal(names(B), c("rows", "cols", "vals", "rt", "ct"))

})


test_that("add_UKEnergy2000_matnames works as expected", {
  UKEnergy2000_withUVY <- UKEnergy2000 %>% matsindf:::add_UKEnergy2000_matnames(.)
  # We have saved a previous result for the add_UKEnergy2000_matnames function
  # with the following code:
  # UKEnergy2000_with_UVY <- UKEnergy2000 %>% add_matnames()
  # saveRDS(UKEnergy2000_with_UVY, file = "tests/UKEnergy2000_with_UVY.rds")
  # Load it for comparison.
  expected_with_UVY <- readRDS("UKEnergy2000_with_UVY.rds")
  expect_equal(UKEnergy2000_withUVY, expected_with_UVY)
})


test_that("add_UKEnergy2000_row_col_meta works as expected", {
  UKEnergy2000_with_metadata <- UKEnergy2000 %>%
    matsindf:::add_UKEnergy2000_matnames(.) %>%
    matsindf:::add_UKEnergy2000_row_col_meta(.)
  # We have saved a previous result for the add_row_col_meta function with the following code:
  # UKEnergy2000_with_metadata <- UKEnergy2000_with_UVY %>% add_row_col_meta()
  # saveRDS(UKEnergy2000_with_metadata, file = "tests/UKEnergy2000_with_metadata.rds")
  # Load it for comparison.
  expected_with_metadata <- readRDS("UKEnergy2000_with_metadata.rds")
  expect_equal(UKEnergy2000_with_metadata, expected_with_metadata)
})


test_that("verify_cols_missing errors as expected", {
  DF <- data.frame(A = 1:4, B = 11:14)
  # Try with a non-vector for newcols (a data frame is not a vector)
  expect_null(verify_cols_missing(DF, newcols = DF))
  expect_error(verify_cols_missing(DF, "A"),
               "column\\(s\\) 'A' is \\(are\\) already column names in data frame 'DF'")
})


