context("Triangular Distribution")

test_that('The density functions provide correct answers', {
    x <- seq(from = -3, to = 3)
    a <- -2.5; b <- 2.5; c <- 0;
    expect_equal(test_dtri(x, a, b, c),
                 list(
                    "VectorLog" = c(-Inf, -2.525728644308, -1.427116355640,
                                    -0.916290731874, -1.427116355640,
                                    -2.525728644308, -Inf),
                    "VectorNoLog" = c(0, 0.08, 0.24, 0.4, 0.24, 0.08, 0),
                    "DoubleLog" = -Inf,
                    "DoubleNoLog" = 0
                    )
                )
    x <- x[-1]
    expect_equal(test_dtri(x, a, b, c),
                 list(
                    "VectorLog" = c(-2.525728644308, -1.427116355640,
                                    -0.916290731874, -1.427116355640,
                                    -2.525728644308, -Inf),
                    "VectorNoLog" = c(0.08, 0.24, 0.4, 0.24, 0.08, 0),
                    "DoubleLog" = -2.525728644308,
                    "DoubleNoLog" = 0.08
                    )
                )
})


test_that('The distribution functions provide correct answers', {
    x <- seq(from = -3, to = 3)
    a <- -2.5; b <- 2.5; c <- 0;
    expect_equal(test_ptri(x, a, b, c),
                 list(
                    "VectorLog" = c(-Inf, -3.912023005428, -1.714798428092,
                                    -0.693147180560, -0.198450938724,
                                    -0.020202707318, 0),
                    "VectorNoLog" = c(0, 0.02, 0.18, 0.5, 0.82, 0.98, 1),
                    "DoubleLog" = -Inf,
                    "DoubleNoLog" = 0,
                    "VectorLogNoLower" = c(0, -0.020202707318, -0.198450938724,
                                           -0.693147180560, -1.714798428092,
                                           -3.912023005428, -Inf),
                    "VectorNoLogNoLower" = c(1, 0.98, 0.82, 0.5, 0.18, 0.02, 0),
                    "DoubleLogNoLower" = 0,
                    "DoubleNoLogNoLower" = 1
                    )
                )
    x <- x[-1]
    expect_equal(test_ptri(x, a, b, c),
                 list(
                    "VectorLog" = c(-3.912023005428, -1.714798428092,
                                    -0.693147180560, -0.198450938724,
                                    -0.020202707318, 0),
                    "VectorNoLog" = c(0.02, 0.18, 0.5, 0.82, 0.98, 1),
                    "DoubleLog" = -3.912023005428,
                    "DoubleNoLog" = 0.02,
                    "VectorLogNoLower" = c(-0.020202707318, -0.198450938724,
                                           -0.693147180560, -1.714798428092,
                                           -3.912023005428, -Inf),
                    "VectorNoLogNoLower" = c(0.98, 0.82, 0.5, 0.18, 0.02, 0),
                    "DoubleLogNoLower" = -0.020202707318,
                    "DoubleNoLogNoLower" = 0.98
                    )
                )
})


test_that('The quantile functions provide correct answers', {
    x <- c(0, 0.5, 1)
    a <- -2.5; b <- 2.5; c <- 0;
    expect_equal(test_qtri_nolog(x, a, b, c),
                 list(
                    "VectorNoLog" = c(-2.5, 0, 2.5),
                    "DoubleNoLog" = -2.5,
                    "VectorNoLogNoLower" = c(2.5, 0, -2.5),
                    "DoubleNoLogNoLower" = 2.5
                    )
                )
    x <- c(0, -1, -2, -10)
    expect_equal(test_qtri_log(x, a, b, c),
                 list(
                    "VectorLog" = c(2.5, -0.355590287598, -1.199349762443,
                                    -2.476177759928),
                    "DoubleLog" = 2.5,
                    "VectorLogNoLower" = c(-2.500000000000, 0.355590287598,
                                           1.199349762443, 2.476177759928),
                    "DoubleLogNoLower" = -2.5
                    )
                )
})

