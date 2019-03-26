context("Multivariate Normal Distribution")

test_that('The density function provides correct answers', {
    x <- matrix(c(0.5, -0.5), nrow = 1)
    mu <- c(1, -1)
    S <- matrix(c(1/2, 1/3, 1/3, 1/4), nrow = 2)
    expect_equal(test_dmvnorm(x, mu, S),
                 list(
                    "Log" = matrix(-12.4495440069013, ncol = 1),
                    "NoLog" = matrix(0.0000039195096, ncol = 1)
                    )
                )
    x <- matrix(c(0.5, -0.5, 0.5), nrow = 1)
    mu <- c(1, -1, 0)
    S <- matrix(c(1/2, 1/3, 1/4, 1/3, 1/4, 1/5, 1/4, 1/5, 1/6), ncol = 3)
    expect_equal(test_dmvnorm(x, mu, S),
                 list(
                    "Log" = matrix(-28.92001771250195, ncol = 1),
                    "NoLog" = matrix(0.00000000000027, ncol = 1)
                    )
                )
})
