context("MSU estimation value")

A0 <- factor(c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1))
A1 <- factor(c(0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1))
B0 <- factor(c(0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1))
B1 <- factor(c(0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1))
I  <- factor(c(0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1))
R  <- factor(c(0,0,0,0,1,0,0,1,1,0,1,0,0,0,0,1,1,0,0,0,0,0,1,1,0,1,1,1,1,1,1,0))
Y  <- factor(c(0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1))

test_that("msu is equal to symmetrical_uncertainty for two variables", {
    expect_equal(msu(list(A0), Y), SU(A0, Y))
    expect_equal(msu(list(A1), Y), SU(A1, Y))
    expect_equal(msu(list(B0), Y), SU(B0, Y))
})

test_that("msu is correct for XOR variables", {
    x1 <- factor(c(0,0,1,1))
    x2 <- factor(c(0,1,0,1))
    y  <- factor(c(0,1,1,0))
    expect_equal(msu(list(x1, x2), y), 0.5)
})
