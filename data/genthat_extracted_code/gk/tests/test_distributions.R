library(gk)
context("Test distribution functions")

test_that("Standard normal is a special case of quantile function", {
    expect_equal(qnorm(seq(0.1,0.9,0.2)),
                 qgk(seq(0.1,0.9,0.2),0,1,0,0))
    expect_equal(qnorm(seq(0.1,0.9,0.2)),
                 qgh(seq(0.1,0.9,0.2),0,1,0,0))    
})

test_that("CDF is inverse of quantile function", {
    expect_equal(1:5, qgk(pgk(1:5,2,1,5,-0.1), 2,1,5,-0.1),
                 tolerance=1E-5)
    expect_equal(1:5, qgh(pgh(1:5,2,1,5,0.1), 2,1,5,0.1),
                 tolerance=1E-5)
})

test_that("zscale works as expected", {
    expect_equal(pnorm(pgk(-2:2, -3, 0.1, 0.1, 2, zscale=TRUE)),
                 pgk(-2:2, -3, 0.1, 0.1, 2),
                 tolerance=1E-5)
    expect_equal(pnorm(pgh(-2:2, -3, 0.1, 0.1, 2, zscale=TRUE)),
                 pgh(-2:2, -3, 0.1, 0.1, 2),
                 tolerance=1E-5)
})

test_that("Integral of PDF is CDF", {
    expect_equal(integrate(dgk, 0, 1, A=0, B=1, g=1, k=1)$value,
                 pgk(1,0,1,1,1)-pgk(0,0,1,1,1),
                 tolerance=1E-5)
    expect_equal(integrate(dgh, 0, 1, A=0, B=1, g=1, h=1)$value,
                 pgh(1,0,1,1,1)-pgh(0,0,1,1,1),
                 tolerance=1E-5)
})

test_that("Integral of Q function derivatives is correct", {
    expect_equal(integrate(gk:::Qgk_deriv, 0, 1, A=0, B=1, g=-1, k=2)$value,
                 gk:::z2gk(1,0,1,-1,2)-gk:::z2gk(0,0,1,-1,2),
                 tolerance=1E-5)
    expect_equal(integrate(gk:::Qgh_deriv, 0, 1, A=0, B=1, g=-1, h=4)$value,
                 gk:::z2gh(1,0,1,-1,4)-gk:::z2gh(0,0,1,-1,4),
                 tolerance=1E-5)
})
