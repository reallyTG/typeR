context("Multivariate t Distribution")

test_that('The density function provides correct answers', {
    x <- matrix(c(-1:3, -2:2), ncol = 2)
    mu <- c(1, -1)
    S <- matrix(c(1/2, 1/3, 1/3, 1/4), ncol = 2)
    df <- 1
    expect_equal(test_dmvt(x, mu, S, df),
                 list(
                     "Log" = matrix(c(-3.5469680431, -4.1162024757,
                                      -5.1159208759, -6.0065829360,
                                      -6.7365658302), ncol = 1),
                     "NoLog" = matrix(c(0.0288118637, 0.0163063207,
                                        0.0060004496, 0.0024624883,
                                        0.0011867155), ncol = 1)
                 )
    )
    S <- matrix(c(1/2, 1/3, 1/4, 1/3, 1/4, 1/5, 1/4, 1/5, 1/6), ncol = 3)
    expect_equal(test_dmvt(matrix(rep(1, 3), nrow = 1), rep(0, 3), S, df),
                 list(
                     "Log" = matrix(-2.082560599505, ncol = 1),
                     "NoLog" = matrix(0.124610725172, ncol = 1)
                 )
    )
})
