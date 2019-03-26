
df1 <- data.frame(x = c(2., 3., 4., 5.),
                  y = c(1., 2., 3., 4.))
df2 <- data.frame(x = c(2., 3., 4., 5.),
                  y = c(3., 2., 4., 2.))



m1 <- matrix(c(2., 3., 4., 5.,
               1., 2., 3., 4.), ncol = 2)
m2 <- matrix(c(2., 3., 4., 5.,
               3., 2., 4., 2.), ncol = 2)


context("distance matrices")

test_that("output dimensions", {
    expect_equal(nrow(coRanking:::euclidean(df1, use = "C")),
                 nrow(df1))
    expect_equal(nrow(coRanking:::euclidean(df1, use = "R")),
                 nrow(df1))
    expect_equal(nrow(coRanking:::euclidean(df2, use = "C")),
                 nrow(df2))
    expect_equal(nrow(coRanking:::euclidean(df2, use = "R")),
                 nrow(df2))
})

test_that("data.frame and matrix", {
    expect_equal(coRanking:::euclidean(df1, use = "C"),
                 coRanking:::euclidean(m1,  use = "C"))
    expect_equal(coRanking:::euclidean(df2, use = "C"),
                 coRanking:::euclidean(m2,  use = "C"))
    expect_equal(coRanking:::euclidean(df1, use = "R"),
                 coRanking:::euclidean(m1,  use = "R"))
    expect_equal(coRanking:::euclidean(df2, use = "R"),
                 coRanking:::euclidean(m2,  use = "R"))
})

test_that("C and R backend equal", {
    expect_equal(coRanking:::euclidean(df1, use = "C"),
                 coRanking:::euclidean(df1, use = "R"))
    expect_equal(coRanking:::euclidean(df2, use = "C"),
                 coRanking:::euclidean(df2, use = "R"))
    expect_equal(coRanking:::euclidean(m1, use = "C"),
                 coRanking:::euclidean(m1, use = "R"))
    expect_equal(coRanking:::euclidean(m2, use = "C"),
                 coRanking:::euclidean(m2, use = "R"))
})

df3 <- matrix(letters[1:8], ncol = 2)
test_that("errors", {
    expect_error(coRanking:::euclidean(df3, use = "C"),
                 "double")
    expect_error(coRanking:::euclidean(df3, use = "R"),
                 "double")
})
