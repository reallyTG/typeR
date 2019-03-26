context("Wishart Distribution")

test_that('The density function provides correct answers', {
    S = matrix(c(1/2, 1/3, 1/3, 1/4), nrow = 2)
    expect_equal(test_dwish(S, 2, S),
                 list(
                    "Log" = 2.88397493155479,
                    "NoLog" = 17.885224616332
                    )
                )
    X = diag(2)
    expect_equal(test_dwish(X, 2, S),
                 list(
                    "Log" = -25.25435812795322477,
                    "NoLog" = 0.00000000001076891
                    )
                )
})
