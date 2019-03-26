context("splitt,  splitn")

test_that("Splitt Densities",
{
    expect_equal(dsplitt(-3, mu = 0, df = 10, phi = 1, lmd = 1, logarithm = FALSE),
                 dsplitt(3, mu = 0, df = 10, phi = 1, lmd = 1, logarithm = FALSE))

    expect_equal(psplitt(0, mu = 0, df = 10, phi = 1, lmd = 1), 0.5)


})


test_that("Splitn Densities",
{
    expect_equal(dsplitn(-3, mu = 0, sigma = 1, lmd = 1, logarithm = FALSE),
                 dsplitn(3, mu = 0, sigma = 1, lmd = 1, logarithm = FALSE))

    x = rnorm(1)
    expect_equal(psplitn(x, mu = x, sigma = 1, lmd = 1), 0.5)


})
