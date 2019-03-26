library(lg)
context("Main function")

data_bad <- list()
est_method_bad <- "4par"
data_trivar <- mvtnorm::rmvnorm(50, sigma = diag(3))

test_that("The function produces the correct errors", {
    expect_error(lg_main(data_bad), "The data must be a matrix or a data frame")
    expect_error(lg_main(data_trivar, est_method = est_method_bad))
    expect_error(lg_main(data_trivar, est_method = "5par"),
                 "Data must be bivariate if estimation method is '5par'")
    expect_warning(lg_main(data_trivar,
                      est_method = "1par",
                      transform_to_marginal_normality = FALSE),
                   "Estimation method '1par' assumes marginal standard normality.")


})
