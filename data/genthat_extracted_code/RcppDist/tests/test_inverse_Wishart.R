context("Inverse Wishart Distribution")

test_that('The density function provides correct answers', {
    S = matrix(c(1/2, 1/3, 1/3, 1/4), nrow = 2)
    expect_equal(test_diwish(S, 2, S),
                 list(
                    "Log" = 2.883974931554,
                    "NoLog" = 17.885224616332
                    )
                )
    X = diag(2)
    expect_equal(test_diwish(X, 2, S),
                 list(
                    "Log" = -7.182690365985,
                    "NoLog" = 0.000759621431
                    )
                )
})
