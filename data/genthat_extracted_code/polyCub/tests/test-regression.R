context("Regression tests")

hexagon <- list(
    list(x = c(7.33, 7.33, 3, -1.33, -1.33, 3),
         y = c(-0.5, 4.5, 7, 4.5, -0.5, -3))
)
f <- function (s) (rowSums(s^2)+1)^-2
##plotpolyf(hexagon, f)

test_that("isotropic cubature can handle control list for integrate()", {
    ## previosly, passing control arguments did not work
    int1 <- polyCub.iso(hexagon, f, center=c(0,0), control=list(rel.tol=1e-3))
    int2 <- polyCub.iso(hexagon, f, center=c(0,0), control=list(rel.tol=1e-8))
    ## results are almost but not identical
    expect_equal(int1, int2, tolerance = 1e-3)
    expect_false(identical(int1, int2))
})
