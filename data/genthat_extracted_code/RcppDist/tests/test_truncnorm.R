context("Truncated Normal Distribution")

test_that('The density functions provide correct answers', {
    x <- seq(from = -3, to = 3)
    mu <- 1; sigma <- 2; a <- -2.5; b <- 2.5
    expect_equal(test_dtruncnorm(x, mu, sigma, a, b),
                 list(
                    "VectorLog" = c(-Inf, -2.426903727039, -1.801903727039,
                                    -1.426903727039, -1.301903727039,
                                    -1.426903727039, -Inf),
                    "VectorNoLog" = c(0, 0.088309841083, 0.164984503605,
                                      0.240051036290, 0.272013460429,
                                      0.240051036290, 0),
                    "DoubleLog" = -Inf,
                    "DoubleNoLog" = 0
                    )
                )
    x <- x[-1]
    expect_equal(test_dtruncnorm(x, mu, sigma, a, b),
                 list(
                    "VectorLog" = c(-2.426903727039, -1.801903727039,
                                    -1.426903727039, -1.301903727039,
                                    -1.426903727039, -Inf),
                    "VectorNoLog" = c(0.088309841083, 0.164984503605,
                                      0.240051036290, 0.272013460429,
                                      0.240051036290, 0),
                    "DoubleLog" = -2.426903727039,
                    "DoubleNoLog" = 0.088309841083
                    )
                )
})


test_that('The distribution functions provide correct answers', {
    x <- seq(from = -3, to = 3)
    mu <- 1; sigma <- 2; a <- -2.5; b <- 2.5
    expect_equal(test_ptruncnorm(x, mu, sigma, a, b),
                 list(
                    "VectorLog" = c(-Inf, -3.311111927941, -1.821849714602,
                                    -1.004802896029, -0.466475412921,
                                    -0.118444326645, 0),
                    "VectorNoLog" = c(0, 0.036475592965, 0.161726326547,
                                      0.366116790766, 0.627209029879,
                                      0.888301268992, 1),
                    "DoubleLog" = -Inf,
                    "DoubleNoLog" = 0,
                    "VectorLogNoLower" = c(0, -0.037157459809, -0.176410652516,
                                           -0.455890554079, -0.986737418242,
                                           -2.191949933685, -Inf),
                    "VectorNoLogNoLower" = c(1, 0.963524407035, 0.838273673453,
                                             0.633883209234, 0.372790970121,
                                             0.111698731008, 0),
                    "DoubleLogNoLower" = 0,
                    "DoubleNoLogNoLower" = 1
                    )
                )
    x <- x[-1]
    expect_equal(test_ptruncnorm(x, mu, sigma, a, b),
                 list(
                    "VectorLog" = c(-3.311111927941, -1.821849714602,
                                    -1.004802896029, -0.466475412921,
                                    -0.118444326645, 0),
                    "VectorNoLog" = c(0.036475592965, 0.161726326547,
                                      0.366116790766, 0.627209029879,
                                      0.888301268992, 1),
                    "DoubleLog" = -3.311111927941,
                    "DoubleNoLog" = 0.036475592965,
                    "VectorLogNoLower" = c(-0.037157459809, -0.176410652516,
                                           -0.455890554079, -0.986737418242,
                                           -2.191949933685, -Inf),
                    "VectorNoLogNoLower" = c(0.963524407035, 0.838273673453,
                                             0.633883209234, 0.372790970121,
                                             0.111698731008, 0),
                    "DoubleLogNoLower" = -0.037157459809,
                    "DoubleNoLogNoLower" = 0.963524407035
                    )
                )
    x <- x[length(x)]
    expect_equal(test_ptruncnorm(x, mu, sigma, a, b),
                 list(
                    "VectorLog" = 0,
                    "VectorNoLog" = 1,
                    "DoubleLog" = 0,
                    "DoubleNoLog" = 1,
                    "VectorLogNoLower" = -Inf,
                    "VectorNoLogNoLower" = 0,
                    "DoubleLogNoLower" = -Inf,
                    "DoubleNoLogNoLower" = 0
                    )
                )
})


test_that('The quantile functions provide correct answers', {
    x <- c(0, 0.5, 1)
    mu <- 1; sigma <- 2; a <- -2.5; b <- 2.5
    expect_equal(test_qtruncnorm_nolog(x, mu, sigma, a, b),
                 list(
                    "VectorNoLog" = c(-2.5, 0.527997768764, 2.5),
                    "DoubleNoLog" = -2.5,
                    "VectorNoLogNoLower" = c(2.5, 0.527997768764, -2.5),
                    "DoubleNoLogNoLower" = 2.5
                    )
                )
    x <- c(-1, -2, -10)
    expect_equal(test_qtruncnorm_log(x, mu, sigma, a, b),
                 list(
                    "VectorLog" = c(0.007336100294, -1.166918217198,
                                    -2.499228507645),
                    "DoubleLog" = 0.007336100294,
                    "VectorLogNoLower" = c(1.018056443472, 1.902689539480,
                                           2.499778898288),
                    "DoubleLogNoLower" = 1.018056443472
                    )
                )
})

