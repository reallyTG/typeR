context("Truncated Location-Scale t Distribution")

test_that('The density functions provide correct answers', {
    x <- seq(from = -3, to = 3)
    df <- 1; mu <- 1; sigma <- 2; a <- -2.5; b <- 2.5
    expect_equal(test_dtrunclst(x, df, mu, sigma, a, b),
                 list(
                    "VectorLog" = c(-Inf, -2.399574188877, -1.914066373095,
                                    -1.444062743849, -1.220919192535,
                                    -1.444062743849, -Inf),
                    "VectorNoLog" = c(0, 0.090756590228, 0.147479459121,
                                      0.235967134593, 0.294958918242,
                                      0.235967134593, 0),
                    "DoubleLog" = -Inf,
                    "DoubleNoLog" = 0
                    )
                )
    x <- x[-1]
    expect_equal(test_dtrunclst(x, df, mu, sigma, a, b),
                 list(
                    "VectorLog" = c(-2.399574188877, -1.914066373095,
                                    -1.444062743849, -1.220919192535,
                                    -1.444062743849, -Inf),
                    "VectorNoLog" = c(0.090756590228, 0.147479459121,
                                      0.235967134593, 0.294958918242,
                                      0.235967134593, 0),
                    "DoubleLog" = -2.399574188877,
                    "DoubleNoLog" = 0.090756590228
                    )
                )
})


test_that('The distribution functions provide correct answers', {
    x <- seq(from = -3, to = 3)
    df <- 1; mu <- 1; sigma <- 2; a <- -2.5; b <- 2.5
    expect_equal(test_ptrunclst(x, df, mu, sigma, a, b),
                 list(
                    "VectorLog" = c(-Inf, -3.203502817486, -1.851083877622,
                                    -1.058795915267, -0.477411450527,
                                    -0.112160010453, 0),
                    "VectorNoLog" = c(0, 0.040619671196, 0.157066832795,
                                      0.346873223732, 0.620387218125,
                                      0.893901212518, 1),
                    "DoubleLog" = -Inf,
                    "DoubleNoLog" = 0,
                    "VectorLogNoLower" = c(0, -0.041467693769, -0.170867603832,
                                           -0.425984024188, -0.968603540856,
                                           -2.243384661497, -Inf),
                    "VectorNoLogNoLower" = c(1, 0.959380328804, 0.842933167205,
                                             0.653126776268, 0.379612781875,
                                             0.106098787482, 0),
                    "DoubleLogNoLower" = 0,
                    "DoubleNoLogNoLower" = 1
                    )
                )
    x <- x[-1]
    expect_equal(test_ptrunclst(x, df, mu, sigma, a, b),
                 list(
                    "VectorLog" = c(-3.203502817486, -1.851083877622,
                                    -1.058795915267, -0.477411450527,
                                    -0.112160010453, 0),
                    "VectorNoLog" = c(0.040619671196, 0.157066832795,
                                      0.346873223732, 0.620387218125,
                                      0.893901212518, 1),
                    "DoubleLog" = -3.203502817486,
                    "DoubleNoLog" = 0.040619671196,
                    "VectorLogNoLower" = c(-0.041467693769, -0.170867603832,
                                           -0.425984024188, -0.968603540856,
                                           -2.243384661497, -Inf),
                    "VectorNoLogNoLower" = c(0.959380328804, 0.842933167205,
                                             0.653126776268, 0.379612781875,
                                             0.106098787482, 0),
                    "DoubleLogNoLower" = -0.041467693769,
                    "DoubleNoLogNoLower" = 0.959380328804
                    )
                )
    x <- x[length(x)]
    expect_equal(test_ptrunclst(x, df, mu, sigma, a, b),
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
    df <- 1; mu <- 1; sigma <- 2; a <- -2.5; b <- 2.5
    expect_equal(test_qtrunclst_nolog(x, df, mu, sigma, a, b),
                 list(
                    "VectorNoLog" = c(-2.5, 0.586088907313, 2.5),
                    "DoubleNoLog" = -2.5,
                    "VectorNoLogNoLower" = c(2.5, 0.586088907313, -2.5),
                    "DoubleNoLogNoLower" = 2.5
                    )
                )
    x <- c(-1, -2, -10)
    expect_equal(test_qtrunclst_log(x, df, mu, sigma, a, b),
                 list(
                    "VectorLog" = c(0.087500882304, -1.153060797725,
                                    -2.499374786226),
                    "DoubleLog" = 0.087500882304,
                    "VectorLogNoLower" = c(1.039784822473, 1.878998635049,
                                           2.499759514659),
                    "DoubleLogNoLower" = 1.039784822473
                    )
                )
})

