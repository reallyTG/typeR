context("Location-Scale t Distribution")

test_that('The density functions provide correct answers', {
    x <- c(-3, 2, 0, 4, -1)
    df <- 1; mu <- 1; sigma <- 2;
    expect_equal(test_dlst(x, df, mu, sigma),
                 list(
                    "VectorLog" = c(-3.447314978843, -2.061020617724,
                                    -2.061020617724, -3.016532062751,
                                    -2.531024246969),
                    "VectorNoLog" = c(0.031830988618, 0.127323954474,
                                      0.127323954474, 0.048970751721,
                                      0.079577471546),
                    "DoubleLog" = -3.447314978843,
                    "DoubleNoLog" = 0.031830988618
                    )
                )
    x <- x[-1]
    expect_equal(test_dlst(x, df, mu, sigma),
                 list(
                    "VectorLog" = c(-2.061020617724, -2.061020617724,
                                    -3.016532062751, -2.531024246969),
                    "VectorNoLog" = c(0.127323954474, 0.127323954474,
                                      0.048970751721, 0.079577471546),
                    "DoubleLog" = -2.061020617724,
                    "DoubleNoLog" = 0.127323954474
                    )
                )
})


test_that('The distribution functions provide correct answers', {
    x <- c(-3, 2, 0, 4, -1)
    df <- 1; mu <- 1; sigma <- 2;
    expect_equal(test_plst(x, df, mu, sigma),
                 list(
                    "VectorLog" = c(-1.913360364504, -0.434507354518,
                                    -1.042941898062, -0.207229654027,
                                    -1.386294361120),
                    "VectorNoLog" = c(0.147583617650, 0.647583617650,
                                      0.352416382350, 0.812832958189, 0.25),
                    "DoubleLog" = -1.913360364504,
                    "DoubleNoLog" = 0.147583617650,
                    "VectorLogNoLower" = c(-0.159680159856, -1.042941898062,
                                           -0.434507354518, -1.675753789141,
                                           -0.287682072452),
                    "VectorNoLogNoLower" = c(0.852416382350, 0.352416382350,
                                             0.647583617650, 0.187167041811,
                                             0.75),
                    "DoubleLogNoLower" = -0.159680159856,
                    "DoubleNoLogNoLower" = 0.852416382350
                    )
                )
    x <- x[-1]
    expect_equal(test_plst(x, df, mu, sigma),
                 list(
                    "VectorLog" = c(-0.434507354518, -1.042941898062,
                                    -0.207229654027, -1.386294361120),
                    "VectorNoLog" = c(0.647583617650, 0.352416382350,
                                      0.812832958189, 0.25),
                    "DoubleLog" = -0.434507354518,
                    "DoubleNoLog" = 0.647583617650,
                    "VectorLogNoLower" = c(-1.042941898062, -0.434507354518,
                                           -1.675753789141, -0.287682072452),
                    "VectorNoLogNoLower" = c(0.352416382350, 0.647583617650,
                                             0.187167041811, 0.75),
                    "DoubleLogNoLower" = -1.042941898062,
                    "DoubleNoLogNoLower" = 0.352416382350
                    )
                )
})


test_that('The quantile functions provide correct answers', {
    x <- c(0, 0.5, 1)
    df <- 1; mu <- 1; sigma <- 2;
    expect_equal(test_qlst_nolog(x, df, mu, sigma),
                 list(
                    "VectorNoLog" = c(-Inf, 1, Inf),
                    "DoubleNoLog" = -Inf,
                    "VectorNoLogNoLower" = c(Inf, 1, -Inf),
                    "DoubleNoLogNoLower" = Inf
                    )
                )
    x <- c(-1, -2, -10)
    expect_equal(test_qlst_log(x, df, mu, sigma),
                 list(
                    "VectorLog" = c(0.118657817008, -3.417097905848,
                                    -14021.483545266779),
                    "DoubleLog" = 0.118657817008,
                    "VectorLogNoLower" = c(1.881342182992, 5.417097905848,
                                           14023.483545266779),
                    "DoubleLogNoLower" = 1.881342182992
                    )
                )
})

