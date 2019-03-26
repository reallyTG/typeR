library(lg)
context("Bandwidth selection")

set.seed(1)
n <- 20
x <- rt(n, df = 10)

result <- bw_select_cv_univariate(x)

test_that("Univariate bw selection works", {
    expect_true(is.numeric(result$bw))
    expect_equal(result$convergence, 0)
})

n <- 20
x_uni <- rnorm(n)
x_tri <- cbind(rnorm(n), rnorm(n), rnorm(n))

test_that("Plugin bw selection works", {
    expect_equal(bw_select_plugin_univariate(x = x_uni), 1.75*n^(-1/5))
    expect_equal(bw_select_plugin_multivariate(x = x_tri), 1.75*n^(-1/6))
    expect_equal(bw_select_plugin_univariate(n = n), 1.75*n^(-1/5))
    expect_equal(bw_select_plugin_multivariate(n = n), 1.75*n^(-1/6))
    expect_equal(bw_select_plugin_univariate(n = n, c = 1, a = -.5), n^(-.5))
})

