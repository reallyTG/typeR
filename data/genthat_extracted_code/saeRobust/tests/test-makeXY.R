context("makeXY")
test_that("makeXY", {
    xy <- makeXY(y ~ x, data.frame(y = 1:10, x = 1:10, z = 1))
    expect_is(xy, "list")
    expect_is(xy$x, "Matrix")
    expect_equal(colnames(xy$x), c("(Intercept)", "x"))
})
