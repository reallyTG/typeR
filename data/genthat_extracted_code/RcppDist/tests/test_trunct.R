context("Truncated t Distribution")

test_that('The density functions provide correct answers', {
    x <- seq(from = -3, to = 3)
    df <- 1; a <- -2.5; b <- 2.5
    expect_equal(test_dtrunct(x, df, a, b),
                 list(
                    "VectorLog" = c(-Inf, -2.476782025634, -1.560491293760,
                                    -0.867344113200, -1.560491293760,
                                    -2.476782025634, -Inf),
                    "VectorNoLog" = c(0, 0.084013143207, 0.210032858016,
                                      0.420065716033, 0.210032858016,
                                      0.084013143207, 0),
                    "DoubleLog" = -Inf,
                    "DoubleNoLog" = 0
                    )
                )
    x <- x[-1]
    expect_equal(test_dtrunct(x, df, a, b),
                 list(
                    "VectorLog" = c(-2.476782025634, -1.560491293760,
                                    -0.867344113200, -1.560491293760,
                                    -2.476782025634, -Inf),
                    "VectorNoLog" = c(0.084013143207, 0.210032858016,
                                      0.420065716033, 0.210032858016,
                                      0.084013143207, 0),
                    "DoubleLog" = -2.476782025634,
                    "DoubleNoLog" = 0.084013143207
                    )
                )
})


test_that('The distribution functions provide correct answers', {
    x <- seq(from = -3, to = 3)
    df <- 1; a <- -2.5; b <- 2.5
    expect_equal(test_ptrunct(x, df, a, b),
                 list(
                    "VectorLog" = c(-Inf, -3.354558641430, -1.771479555136,
                                    -0.693147180560, -0.186427363842,
                                    -0.035549233639, 0),
                    "VectorNoLog" = c(0, 0.034924781105, 0.170081158122,
                                      0.5, 0.829918841878, 0.965075218895, 1),
                    "DoubleLog" = -Inf,
                    "DoubleNoLog" = 0,
                    "VectorLogNoLower" = c(0, -0.035549233639, -0.186427363842,
                                           -0.693147180560, -1.771479555136,
                                           -3.354558641430, -Inf),
                    "VectorNoLogNoLower" = c(1, 0.965075218895, 0.829918841878,
                                             0.5, 0.170081158122,
                                             0.034924781105, 0),
                    "DoubleLogNoLower" = 0,
                    "DoubleNoLogNoLower" = 1
                    )
                )
    x <- x[-1]
    expect_equal(test_ptrunct(x, df, a, b),
                 list(
                    "VectorLog" = c(-3.354558641430, -1.771479555136,
                                    -0.693147180560, -0.186427363842,
                                    -0.035549233639, 0),
                    "VectorNoLog" = c(0.034924781105, 0.170081158122,
                                      0.5, 0.829918841878, 0.965075218895, 1),
                    "DoubleLog" = -3.354558641430,
                    "DoubleNoLog" = 0.034924781105,
                    "VectorLogNoLower" = c(-0.035549233639, -0.186427363842,
                                           -0.693147180560, -1.771479555136,
                                           -3.354558641430, -Inf),
                    "VectorNoLogNoLower" = c(0.965075218895, 0.829918841878,
                                             0.5, 0.170081158122,
                                             0.034924781105, 0),
                    "DoubleLogNoLower" = -0.035549233639,
                    "DoubleNoLogNoLower" = 0.965075218895
                    )
                )
    x <- x[length(x)]
    expect_equal(test_ptrunct(x, df, a, b),
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
    df <- 1; a <- -2.5; b <- 2.5
    expect_equal(test_qtrunct_nolog(x, df, a, b),
                 list(
                    "VectorNoLog" = c(-2.5, 0, 2.5),
                    "DoubleNoLog" = -2.5,
                    "VectorNoLogNoLower" = c(2.5, 0, -2.5),
                    "DoubleNoLogNoLower" = 2.5
                    )
                )
    x <- c(-1, -2, -10)
    expect_equal(test_qtrunct_log(x, df, a, b),
                 list(
                    "VectorLog" = c(-0.325322483405, -1.180797941894,
                                    -2.499216644994),
                    "DoubleLog" = -0.325322483405,
                    "VectorLogNoLower" = c(0.325322483405, 1.180797941894,
                                           2.499216644994),
                    "DoubleLogNoLower" = 0.325322483405
                    )
                )
})

