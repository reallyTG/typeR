
context("GP_fit creates GP model")

test_that("check GP_fit", {
    set.seed(6436345)
    nn <- nrow(mtcars)
    x1 <- scale_norm(seq_len(nn))
    y1 <- mtcars$mpg
    gp1 <- GP_fit(
        X = x1,
        Y = y1)
    expect_equal(
        object = gp1$X, 
        expected = matrix(x1))
    expect_equal(
        object = gp1$Y, 
        expected = matrix(y1))
    expect_equal(
        object = gp1$sig2,
        expected = 35.188974609375)
    expect_equal(
        object = gp1$beta,
        expected = 10)
    expect_equal(
        object = gp1$delta,
        expected = 0)
    expect_equal(
        object = gp1$nugget_threshold_parameter,
        expected = 20)
    expect_equal(
        object = gp1$correlation_param,
        expected = list(
            type = "exponential", 
            power = 1.95))
    m2 <- cbind(
        x1,
        mtcars$am, 
        scale_norm(mtcars$disp))
    gp2 <- GP_fit(
        X = m2,
        Y = y1)
    expect_equal(
        object = gp2$X, 
        expected = m2)
    expect_equal(
        object = gp2$Y, 
        expected = matrix(y1))
    # Windows 64-bit
    sig2 <- 64428210.0805298
    expect_equal(
        object = gp2$sig2,
        expected = sig2, 
        # soften for cross-platform
        tol = 1e-4)
    beta3 <- -4.45455963230017
    expect_equal(
        object = gp2$beta,
        expected = c(-10, -10, beta3),
        tol = 1e-5)
    expect_equal(
        object = gp2$delta,
        expected = 6.59564703952257e-08)
    expect_equal(
        object = gp2$nugget_threshold_parameter,
        expected = 20)
    expect_equal(
        object = gp2$correlation_param,
        expected = list(
            type = "exponential", 
            power = 1.95))
    # m3 <- cbind(
    #     x1,
    #     apply(mtcars[-1], 2, scale_norm))
    # dd <- ncol(m3)
    # set.seed(2643761)
    # gp3 <- GP_fit(
    #     X = m3[-1L, ],
    #     Y = y1[-1L],
    #     control = c(4 * dd, 3 * dd, 2 * dd))
    # #  user  system elapsed 
    # # 85.04    0.04   86.37 
    # expect_equal(
    #     object = round(predict(
    #         object = gp3, 
    #         xnew = matrix(c(0, 0.5, 0.22, 0.2, 0.53, 0.28, 0.23, 0, 1, 0.5, 0.43), 
    #             nrow = 1, ncol = 11))$Y_hat, digits = 1), 
    #     expected = round(20.0295651682648, digits = 1))
})
