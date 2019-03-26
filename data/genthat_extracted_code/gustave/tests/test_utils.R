

context("utils")


# coerce_to_TsparseMatrix
test_that("coerce_to_TsparseMatrix works as expected", {
  y <- setNames(1:10, letters[1:10])
  M <- Matrix::sparseMatrix(
    x = y, i = seq_along(y), j = rep(1, length(y)), 
    giveCsparse = FALSE, dimnames = list(names(y), NULL)
  )
  expect_identical(coerce_to_TsparseMatrix(y), M)
  m <- matrix(1:10, ncol = 2, dimnames = list(letters[1:5]))
  M <- as(m, "TsparseMatrix")
  dimnames(M) <- dimnames(m)
  expect_identical(coerce_to_TsparseMatrix(m), M)
  expect_identical(coerce_to_TsparseMatrix(M), M)
})



# make_block()
test_that("make_block works as expected", {
  pik <- setNames(1 / ict_sample$w_sample, ict_sample$firm_id)
  strata <- ict_sample$division
  expect_error(make_block(pik, strata), regexp = NA)
  expect_equal(rownames(make_block(pik, strata)), names(pik))
  expect_identical(
    make_block(pik, strata), 
    make_block(matrix(pik, ncol = 1, dimnames = list(names(pik), NULL)), strata)
  )
  pik <- matrix(pik, ncol = 1)
  colnames(pik) <- "pik"
  expect_error(validObject(make_block(pik, strata)), regexp = NA)
})


# is_block_matrix
test_that("detect_block works as expected", {
  pik <- 1 / ict_sample$w_sample
  by <- ict_sample$division
  expect_null(detect_block(pik, by))
  expect_null(detect_block(matrix(pik, ncol = 1), by))
  y <- make_block(pik, by)
  expect_identical(detect_block(y, by), y)
  o <- sample.int(NROW(y))
  y <- y[o, c(NCOL(y):1, 1)]
  by <- by[o]
  attr(y, "rowby") <- by
  attr(y, "colby") <- c("63", "62", "61", "60", "59", "58", "58")
  expect_identical(detect_block(y, by), y)
})


# sum_by()

set.seed(1)
n <- 10
v <- as.numeric(1:n)
v[6] <- NA
V <- sparseVector(v, seq_along(v), n)
m <- matrix(c(v, v), ncol = 2)
colnames(m) <- c("variable1", "variable2")
M <- Matrix(m)
df <- as.data.frame(m)
by <- sample(letters[1:3], 10, replace = TRUE)
w <- rep(2, n)
by_NA <- by
by_NA[c(2, 8)] <- NA

test_that("sum_by() works", {
  
  # Standard behaviour
  r <- sapply(split(v, by), sum, na.rm = TRUE)
  expect_equal(sum_by(v, by), r)
  expect_equal(sum_by(V, by), r)
  expect_equal(sum_by(m, by), matrix(c(r, r), ncol = 2, dimnames = list(names(r), colnames(m))))
  expect_equal(sum_by(M, by), matrix(c(r, r), ncol = 2, dimnames = list(names(r), colnames(m))))
  expect_equal(sum_by(M, by, keep_sparse = TRUE), Matrix(c(r, r), ncol = 2, dimnames = list(names(r), colnames(m))))
  expect_equal(sum_by(df, by), data.frame(variable1 = r, variable2 = r, row.names = names(r)))
  expect_equal(sum_by(v, by, w), r * 2)
  
  # Standard behaviour without removing the NA values
  r <- sapply(split(v, by), sum)
  expect_equal(sum_by(v, by, na_rm = FALSE), r)
  expect_equal(sum_by(V, by, na_rm = FALSE), r)
  expect_equal(sum_by(m, by, na_rm = FALSE), matrix(c(r, r), ncol = 2, dimnames = list(names(r), colnames(m))))
  expect_equal(sum_by(M, by, na_rm = FALSE), matrix(c(r, r), ncol = 2, dimnames = list(names(r), colnames(m))))
  expect_equal(sum_by(M, by, na_rm = FALSE, keep_sparse = TRUE), Matrix(c(r, r), ncol = 2, dimnames = list(names(r), colnames(m))))
  expect_equal(sum_by(df, by, na_rm = FALSE), data.frame(variable1 = r, variable2 = r, row.names = names(r)))
  expect_equal(sum_by(v, by, w, na_rm = FALSE), r * 2)
  
  # Standard behaviour with NA value in the by variable
  r <- sapply(split(v, by_NA), sum, na.rm = TRUE)
  expect_equal(sum_by(v, by_NA), r)
  expect_equal(sum_by(V, by_NA), r)
  expect_equal(sum_by(m, by_NA), matrix(c(r, r), ncol = 2, dimnames = list(names(r), colnames(m))))
  expect_equal(sum_by(M, by_NA), matrix(c(r, r), ncol = 2, dimnames = list(names(r), colnames(m))))
  expect_equal(sum_by(M, by_NA, keep_sparse = TRUE), Matrix(c(r, r), ncol = 2, dimnames = list(names(r), colnames(m))))
  expect_equal(sum_by(df, by_NA), data.frame(variable1 = r, variable2 = r, row.names = names(r)))
  expect_equal(sum_by(v, by_NA, w), r * 2)
  
  # Error messages
  expect_error(sum_by(letters[seq_along(by)], by), regexp = "y is not")

})


# add_zero()

set.seed(1)
n <- 10
p <- 2
m <- matrix(1:(n*p), ncol = p, dimnames = list(sample(letters, n)))
m[c(3, 8, 12)] <- NA
M <- as(m, "TsparseMatrix")
rownames(M) <- rownames(m)
df <- as.data.frame(m)

test_that("add_zero() works", {
  
  # Standard behaviour
  expect_error(add_zero(m, letters), regexp = NA)
  expect_error(add_zero(M, letters), regexp = NA)
  expect_error(add_zero(df, letters), regexp = NA)
  expect_error(add_zero(m, as.factor(letters)), regexp = NA)
  
  # Error and warning messages
  expect_error(add_zero(m[, 1], letters), regexp = "y must be")
  expect_error(add_zero(unname(m), letters), regexp = "y must have")
  expect_error(add_zero(matrix(letters[m], ncol = 2, dimnames = list(rownames(m))), letters), regexp = "y is not numeric")
  tmp <- m
  rownames(tmp)[1:3] <- toupper(rownames(tmp)[1:3])
  expect_warning(add_zero(tmp, letters), regexp = "The name of some rows")

})


# assign_all()

a <- 1
fun <- function(){}
clos <- (function(){
  b <- 2
  function(){}
})()
e <- new.env(parent = globalenv())
assign_all(c("a", "fun", "clos"), to = e)

test_that("assign_all() works", {
  expect_true(
    all(sapply(e, function(x) if(is.function(x)) identical(parent.env(environment(x)), e) else TRUE))
  )
  expect_equal(ls(environment(e$clos)), "b")
})

# discretize_qualitative_var

test_that("discretize_qualitative_var yield same results as stats::model.matrix()", {
  expect_identical(
    unname(as.matrix(discretize_qualitative_var(ict_sample$division))),
    {
      tmp <-  stats::model.matrix(~ ict_sample$division - 1)
      attributes(tmp) <- attributes(tmp)["dim"]
      tmp
    }
  )
})
test_that("NA values are handled correctly", {
  # NA in var => NA for all dummy variables
  ict_sample$division[1] <- NA
  expect_equal(
    as.vector(discretize_qualitative_var(setNames(ict_sample$division, ict_sample$firm_id))[1, ]),
    as.numeric(rep(NA, 6))
  )
  rm(ict_sample)
})


