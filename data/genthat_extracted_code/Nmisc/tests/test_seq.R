context("Testing sequence functions")

df1 <- data.frame(col1 = c(1:4), col2  = c(5, 9))
df2 <- data.frame(col1 = c(1:4))
df3 <- data.frame(col1 = c(NA), col2 = c(1))
df4 <- data.frame(col1 = numeric(), col2 = numeric())

test_that("seq_nrow works on df", {
    expect_equal(seq_nrow(df1), 1:4)
    expect_equal(seq_nrow(df2), 1:4)
    expect_equal(seq_nrow(df3), 1)
    expect_equal(seq_nrow(df4), integer(0))
})

test_that("seq_ncol works on df", {
    expect_equal(seq_ncol(df1), 1:2)
    expect_equal(seq_ncol(df2), 1)
    expect_equal(seq_ncol(df3), 1:2)
    expect_equal(seq_ncol(df4), 1:2)
})


m1 <- as.matrix(df1)
m2 <- as.matrix(df2)
m3 <- as.matrix(df3)
m4 <- as.matrix(df4)

test_that("seq_nrow works on matrix", {
    expect_equal(seq_nrow(m1), 1:4)
    expect_equal(seq_nrow(m2), 1:4)
    expect_equal(seq_nrow(m3), 1)
    expect_equal(seq_nrow(m4), integer(0))
})

test_that("seq_ncol works on matrix", {
    expect_equal(seq_ncol(m1), 1:2)
    expect_equal(seq_ncol(m2), 1)
    expect_equal(seq_ncol(m3), 1:2)
    expect_equal(seq_ncol(m4), 1:2)
})
