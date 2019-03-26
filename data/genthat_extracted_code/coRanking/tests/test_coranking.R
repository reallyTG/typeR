
df1 <- data.frame(x = c(2., 3., 4., 5.),
                  y = c(1., 2., 3., 4.))
df2 <- data.frame(x = c(2., 3., 4., 5.),
                  y = c(3., 2., 4., 2.))

m1 <- matrix(c(2., 3., 4., 5.,
               1., 2., 3., 4.), ncol = 2)
m2 <- matrix(c(2., 3., 4., 5.,
               3., 2., 4., 2.), ncol = 2)


context("coranking matrices")

test_that("output dimensions", {
    expect_equal(nrow(coranking(df1, df2, use = "C")),
                 nrow(df1) - 1)
    expect_equal(nrow(coranking(df1, df2, use = "R")),
                 nrow(df1) - 1)
    expect_equal(nrow(coranking(m1, m2, use = "C")),
                 nrow(df2) - 1)
    expect_equal(nrow(coranking(m1, m2, use = "R")),
                 nrow(df2) - 1)
    expect_equal(nrow(coranking(df1, m2, use = "R")),
                 nrow(df2) - 1)
})

test_that("data.frame and matrix", {
    expect_equal(coranking(df1, df2, use = "C"),
                 coranking(m1, m2,   use = "C"))
    expect_equal(coranking(df1, df2, use = "R"),
                 coranking(m1, m2,   use = "R"))
})

test_that("equal data results in eye*nrow", {
    expect_equal(as.integer(coranking(df2, df2, use = "C")),
                 as.integer(diag(nrow(df2) - 1)) * nrow(df2))
    expect_equal(as.integer(coranking(df2, df2,  use = "R")),
                 as.integer(diag(nrow(df2) - 1)) * nrow(df2))
    expect_equal(as.integer(coranking(df1, df1, use = "C")),
                 as.integer(diag(nrow(df1) - 1)) * nrow(df1))
    expect_equal(as.integer(coranking(df1, df1,  use = "R")),
                 as.integer(diag(nrow(df1) - 1)) * nrow(df1))
    expect_equal(as.integer(coranking(m2, m2, use = "C")),
                 as.integer(diag(nrow(m2) - 1)) * nrow(m2))
    expect_equal(as.integer(coranking(m2, m2,  use = "R")),
                 as.integer(diag(nrow(m2) - 1)) * nrow(m2))
    expect_equal(as.integer(coranking(m1, m1, use = "C")),
                 as.integer(diag(nrow(m1) - 1)) * nrow(m1))
    expect_equal(as.integer(coranking(m1, m1,  use = "R")),
                 as.integer(diag(nrow(m1) - 1)) * nrow(m1))
})

test_that("changing arguments transposes results", {
    ## t() transposes dimnames argument too, therefore whe only
    ## compare content of the matrix
    expect_equal(as.integer(  coranking(df1, df2, use = "C")),
                 as.integer(t(coranking(df2, df1, use = "C"))))
    expect_equal(as.integer(  coranking(m2, m1, use = "R")),
                 as.integer(t(coranking(m1, m2, use = "R"))))
})


test_that("C and R backend equal", {
    expect_equal(coranking(df1, df2, use = "C"),
                 coranking(df1, df2, use = "R"))
    expect_equal(coranking(df2, m1, use = "C"),
                 coranking(df2, m1, use = "R"))
    expect_equal(coranking(m1, m2, use = "C"),
                 coranking(m1, m2, use = "R"))
    expect_equal(coranking(m2, m1, use = "C"),
                 coranking(m2, m1, use = "R"))
})

df3 <- matrix(letters[1:8], ncol = 2)
test_that("errors", {
    expect_error(coranking(df1, df3, use = "C"),
                 "double")
    expect_error(coranking(df1, df3, use = "R"),
                 "double")
    expect_error(coranking(df1, df3, use = "C"),
                 "double")
})


m3 <- matrix(runif(1000), ncol = 10)
m4 <- matrix(runif(1000), ncol = 10)

test_that("larger data", {
    expect_equal(coranking(m3, m4, use = "C"),
                 coranking(m3, m4, use = "R"))
})
