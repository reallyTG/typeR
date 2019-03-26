context("select()")

# Consider this data frame
d <- data.frame(a = 1:5, b = rnorm(5), c = letters[1:5], d = factor(6:10),
                row.names = LETTERS[1:5], stringsAsFactors = FALSE)

test_that("In select(), we get identical behavior when selecting more than one column", {

  d1 <- d[, c("d", "c")]
  d1c <- select(d, c("d", "c"))
  expect_equal(d1, d1c)

})

test_that("In select(), selecting a single row from a data frame produces results identical to default R behavior", {

  d2 <- d[2,]
  d2c <- select(d, "B", cols = FALSE)
  expect_equal(d2, d2c)

})

# Now consider a matrix
m <- matrix(rnorm(20), nrow = 4, dimnames = list(LETTERS[1:4], letters[1:5]))

test_that("In select(), column selection with two or more or more columns is equivalent to default R behavior", {
  
  m1 <- m[,c(4, 3)]
  m1c <- select(m, c("d", "c"))
  expect_equal(m1, m1c)

})

test_that("In select(), selecting a single row returns a matrix of 1 row instead of a vector", {
    
  m2 <- m["C",]
  m2c <- select(m, "C", cols = FALSE)
  expect_true(!is.matrix(m2))
  expect_true(is.matrix(m2c))

})

test_that("In select(), selecting a dataframe using indexes and names achieves the same result", {

  # Name selections
  a1 <- select(d, "a")
  a2 <- select(d, c("a","d"))
  a3 <- select(d, c("c","b","d"))
  a4 <- select(d, c("a","d"))
  a5 <- select(d, c("c"))
  a6 <- select(d, c("d"))

  # Index selections
  a1c <- select(d, 1)
  a2c <- select(d, c(1, 4))
  a3c <- select(d, c(3, 2, 4))
  a4c <- select(d, c(1, 4))
  a5c <- select(d, 3)
  a6c <- select(d, 4)

  # Check results
  expect_equal(a1, a1c)
  expect_equal(a2, a2c)
  expect_equal(a3, a3c)
  expect_equal(a4, a4c)
  expect_equal(a5, a5c)
  expect_equal(a6, a6c)

  # Now try rows
  b1 <- select(d, c(4, 1), cols = FALSE)
  b2 <- select(d, 2, cols = FALSE)
  b3 <- select(d, 4, cols = FALSE)

  b1c <- select(d, c("D", "A"), cols = FALSE)
  b2c <- select(d, "B", cols = FALSE)
  b3c <- select(d, "D", cols = FALSE)

  # Check results
  expect_equal(a1, a1c)
  expect_equal(a2, a2c)
  expect_equal(a3, a3c)

 })

test_that("In select(), selecting a matrix using indexes and names achieves the same result", {

  # Checks for the matrix stuff
  m3 <- select(m, c("d", "c"))
  m3c <- select(m, c(4, 3))
  m4 <- select(m, "b")
  m4c <- select(m, 2)
  m5 <- select(m, c("D", "C"), cols = FALSE)
  m5c <- select(m, c(4, 3), cols = FALSE)
  m6 <- select(m, "B", cols = FALSE)
  m6c <- select(m, 2, cols = FALSE)

  # Check results
  expect_equal(m3, m3c)
  expect_equal(m4, m4c)
  expect_equal(m5, m5c)
  expect_equal(m6, m6c)

})

test_that("In select(), check 0 rows and 0 column results", {
    
  dn <- data.frame(a = 1:10, b = 11:20, c = 21:30)
  rownames(dn) <- letters[1:10]
  mn <- as.matrix(dn)
  
  # Check results
  expect_equal(select(dn, 0), dn[,0])
  expect_equal(select(dn, character(0)), dn[,0])
  expect_equal(select(dn, numeric(0)), dn[,0])
  expect_equal(select(mn, 0), mn[,0])
  expect_equal(select(mn, character(0)), mn[,0])
  expect_equal(select(mn, numeric(0)), mn[,0])
  expect_equal(select(dn, 0, cols = FALSE), dn[0,])
  expect_equal(select(dn, character(0), cols = FALSE), dn[0,])
  expect_equal(select(dn, numeric(0), cols = FALSE), dn[0,])
  expect_equal(select(mn, 0, cols = FALSE), mn[0,])
  expect_equal(select(mn, character(0), cols = FALSE), mn[0,])
  expect_equal(select(mn, numeric(0), cols = FALSE), mn[0,])

})


test_that("select() returns errors as expected", {
    
  dn <- data.frame(a = 1:10, b = 11:20, c = 21:30)
  rownames(dn) <- letters[1:10]
  
  # Check errors
  expect_error(select("nogood", "a"), "'data' should be")
  expect_error(select(dn, TRUE), "'selection' should be")
  expect_error(select(dn, -1), "'selection' should be")
  expect_error(select(dn, 4.2), "'selection' should be")
  expect_error(select(dn, 5), "is not present")
  expect_error(select(dn, "e"), "is not present")
  expect_error(select(dn, c("e", "f")), "are not present")  
  expect_error(select(dn, "a", "this"), "should be TRUE")

})


test_that("select() selects correctly from n x m for 1 row or 1 column", {

  c1 <- matrix(1:9, nrow = 3, dimnames = list(c("a", "b", "c"), c("v1", "v2", "v3")))
  c2 <- data.frame(v1 = 1:3, v2 = as.character(4:6), v3 = factor(7:9),
                   row.names = letters[1:3], stringsAsFactors = FALSE)

  c1c <- select(c1, 2)
  c1r <- select(c1, 2, cols = FALSE)

  c2c <- select(c2, 2)
  c2r <- select(c2, 2, cols = FALSE)

  expect_true(is.matrix(c1c))
  expect_true(is.matrix(c1r))
  expect_true(all(dim(c1c) == c(3, 1)))
  expect_true(all(dim(c1r) == c(1, 3)))

  expect_true(is.data.frame(c2c))
  expect_true(is.data.frame(c2r))
  expect_true(all(dim(c2c) == c(3, 1)))
  expect_true(all(dim(c2r) == c(1, 3)))

  expect_true(is.numeric(select(c2, 1)[,1]))
  expect_true(is.character(select(c2, 2)[,1]))
  expect_true(is.factor(select(c2, 3)[,1]))
  
})


test_that("select() selects correctly from n x 1", {

  # Data frames
  c3 <- data.frame(v1 = 1:4, row.names = letters[1:4])
  c3.1 <- data.frame(v1 = as.factor(1:4), row.names = letters[1:4])
  c3.2 <- data.frame(v1 = as.character(1:4), row.names = letters[1:4], stringsAsFactors = FALSE)

  c31 <- select(c3, 2, cols = FALSE)

  expect_true(is.data.frame(c31))
  expect_true(all(dim(c31) == c(1, 1)))
  expect_true(is.numeric(c31[1, 1]))
  
  c32 <- select(c3, c(2, 4), cols = FALSE)

  expect_true(is.data.frame(c32))
  expect_true(all(dim(c32) == c(2, 1)))
  expect_true(is.numeric(c31[,1]))
  
  expect_true(is.factor(select(c3.1, 2, cols = FALSE)[1,1]))
  expect_true(is.character(select(c3.2, 2, cols = FALSE)[1,1]))

  # Matrices
  c4 <- matrix(1:4, ncol = 1, dimnames = list(letters[1:4], "v1"))

  c41 <- select(c4, 2, cols = FALSE)
  
  expect_true(is.matrix(c41))
  expect_true(all(dim(c41) == c(1, 1)))
  
  expect_true(all(dim(select(c4, c(2, 4), cols = FALSE)) == c(2, 1)))
  
  expect_true(all(dim(select(c4, 1)) == c(4, 1)))
    
})



test_that("select() selects correctly from 1 x n", {

  # Data frames
  c5 <- data.frame(a = 1, b = "2", c = factor("a"), stringsAsFactors = FALSE, row.names = "a")

  c51 <- select(c5, 1, cols = FALSE)

  expect_true(is.data.frame(c51))
  expect_true(all(dim(c51) == c(1, 3)))
  expect_equal(c5, c51)
  
  expect_true(all(sapply(select(c5, c("a", "c")), class) == c("numeric", "factor")))
  expect_true(all(sapply(select(c5, c("a", "b")), class) == c("numeric", "character")))
  expect_true(all(sapply(select(c5, c("b", "c")), class) == c("character", "factor")))
  
  c52 <- select(c5, "a")
  expect_true(is.data.frame(c52))
  expect_true(all(dim(c52) == c(1, 1)))
  expect_true(is.numeric(c52[1,1]))

  expect_true(is.character(select(c5, "b")[1,1]))
  expect_true(is.factor(select(c5, "c")[1,1]))

  expect_equal(select(c5, letters[1:3]), c5)

  # Matrices
  c6 <- matrix(1:3, nrow = 1, dimnames = list("A", letters[1:3]))
          
  c61 <- select(c6, 1, cols = FALSE)

  expect_true(is.matrix(c61))
  expect_true(all(dim(c61) == c(1, 3)))
  expect_equal(c6, c61)

  expect_true(all(dim(select(c6, c("a", "b"))) == c(1, 2)))
          
  expect_equal(select(c6, letters[1:3]), c6)
          
})



## Example cases used to develop tests

## # Case 1: n x m, select > 1 col or > 1 row
## c1 <- matrix(1:9, nrow = 3, dimnames = list(c("a", "b", "c"), c("v1", "v2", "v3")))
## select(c1, 1:2)
## select(c1, 1:2, cols = FALSE)
## c2 <- data.frame(v1 = 1:3, v2 = as.character(4:6), v3 = factor(7:9),
##                  row.names = letters[1:3], stringsAsFactors = FALSE)
## select(c2, 1:2)
## select(c2, 1:2, cols = FALSE)

## # Case 2:  n x m, select 1 row or 1 column
## select(c1, 2)
## select(c1, 2, cols = FALSE)

## select(c2, 2)
## select(c2, 2, cols = FALSE)

## # Case 3: n x 1, select 1 row, select multiple rows, select 1 col
## c3 <- data.frame(v1 = 1:4, row.names = letters[1:4])
## c3.1 <- data.frame(v1 = as.factor(1:4), row.names = letters[1:4])
## c3.2 <- data.frame(v1 = as.character(1:4), row.names = letters[1:4], stringsAsFactors = FALSE)
## select(c3, 2, cols = FALSE)
## select(c3, c(2,4), cols = FALSE)
## select(c3, 1)
## str(select(c3.1, 2, cols = FALSE))
## str(select(c3.2, 2, cols = FALSE))
## select(c3, c("this","that"))


## c4 <- matrix(1:4, ncol = 1, dimnames = list(letters[1:4], "v1"))
## select(c4, 2, cols = FALSE)
## select(c4, c(2,4), cols = FALSE)
## select(c4, 1)


## # Case 4:  1 x n, select 1 row, select 1 or multiple cols
## c5 <- data.frame(a = 1, b = "2", c = factor("a"), stringsAsFactors = FALSE, row.names = "a")

## select(c5, 1, cols = FALSE)
## select(c5, 2, cols = FALSE)
## str(select(c5, c("a", "c")))
## str(select(c5, c("a", "b")))
## str(select(c5, c("b", "c")))
## str(select(c5, "a"))
## str(select(c5, "b"))
## str(select(c5, "c"))
## str(select(c5, letters[1:3]))
## str(select(c5, letters[1:5]))

## c6 <- matrix(1:3, nrow = 1, dimnames = list("A", letters[1:3]))
## select(c6, 1, cols = FALSE)
## select(c6, 2, cols = FALSE)
## select(c6, c("a", "b"))
## is.matrix(select(c6, c("a", "b")))
## select(c6, letters[1:3])
## select(c6, "c")
## is.matrix(select(c6, "c"))

## # No selection cases
## select(c1, 0)
## select(c1, 0, cols = F)
## str(select(c2, integer(0)))
## str(select(c2, 0, cols = F))
## select(c3, 0)
## select(c3, 0, cols = F)
## select(c4, 0)
## select(c4, 0, cols = F)
## select(c5, 0)
## select(c5, 0, cols = F)

## select(c6, 0)
## select(c6, 0, cols = F)

## # Case 5:
## is.matrix(select(matrix(1, nrow = 1), 1))
## select(data.frame(a=1), "a")
## select(data.frame(a=1), 1, cols = F)
