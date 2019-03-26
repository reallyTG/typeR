context("Four Parameter Beta Distribution")

test_that('The density functions provide correct answers', {
    x <- c(-3, 2, 0, 4, -1)
    s1 <- 2.0; s2 <- 2.0; a <- -2.5; b <- 2.5;
    expect_equal(test_d4beta(x, s1, s2, a, b),
                 list(
                    "VectorLog" = c(-Inf, -2.225624051858, -1.203972804326,
                                    -Inf, -1.378326191471),
                    "VectorNoLog" = c(0, 0.108, 0.3, 0, 0.252),
                    "DoubleLog" = -Inf,
                    "DoubleNoLog" = 0
                    )
                )
    x <- x[-1]
    expect_equal(test_d4beta(x, s1, s2, a, b),
                 list(
                    "VectorLog" = c(-2.225624051858, -1.203972804326,
                                    -Inf, -1.378326191471),
                    "VectorNoLog" = c(0.108, 0.3, 0, 0.252),
                    "DoubleLog" = -2.225624051858,
                    "DoubleNoLog" = 0.108
                    )
                )
})


test_that('The distribution functions provide correct answers', {
    x <- c(-3, 2, 0, 4, -1)
    s1 <- 2.0; s2 <- 2.0; a <- -2.5; b <- 2.5;
    expect_equal(test_p4beta(x, s1, s2, a, b),
                 list(
                    "VectorLog" = c(-Inf, -0.028399474522, -0.693147180560, 0,
                                    -1.532476871298),
                    "VectorNoLog" = c(0, 0.972, 0.5, 1, 0.216),
                    "DoubleLog" = -Inf,
                    "DoubleNoLog" = 0,
                    "VectorLogNoLower" = c(0, -3.575550768807, -0.693147180560,
                                           -Inf, -0.243346258632),
                    "VectorNoLogNoLower" = c(1, 0.028, 0.5, 0, 0.784),
                    "DoubleLogNoLower" = 0,
                    "DoubleNoLogNoLower" = 1
                    )
                )
    x <- x[-1]
    expect_equal(test_p4beta(x, s1, s2, a, b),
                 list(
                    "VectorLog" = c(-0.028399474522, -0.693147180560, 0,
                                    -1.532476871298),
                    "VectorNoLog" = c(0.972, 0.5, 1, 0.216),
                    "DoubleLog" = -0.028399474522,
                    "DoubleNoLog" = 0.972,
                    "VectorLogNoLower" = c(-3.575550768807, -0.693147180560,
                                           -Inf, -0.243346258632),
                    "VectorNoLogNoLower" = c(0.028, 0.5, 0, 0.784),
                    "DoubleLogNoLower" = -3.575550768807,
                    "DoubleNoLogNoLower" = 0.028
                    )
                )
})


test_that('The quantile functions provide correct answers', {
    x <- c(0, 0.5, 1)
    s1 <- 2.0; s2 <- 2.0; a <- -2.5; b <- 2.5;
    expect_equal(test_q4beta_nolog(x, s1, s2, a, b),
                 list(
                    "VectorNoLog" = c(-2.5, 0, 2.5),
                    "DoubleNoLog" = -2.5,
                    "VectorNoLogNoLower" = c(2.5, 0, -2.5),
                    "DoubleNoLogNoLower" = 2.5
                    )
                )
    x <- c(-1, -2, -10)
    expect_equal(test_q4beta_log(x, s1, s2, a, b),
                 list(
                    "VectorLog" = c(-0.445104983167, -1.345445414451,
                                    -2.480523918142),
                    "DoubleLog" = -0.445104983167,
                    "VectorLogNoLower" = c(0.445104983167, 1.345445414451,
                                           2.480523918142),
                    "DoubleLogNoLower" = 0.445104983167
                    )
                )
})

