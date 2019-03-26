context("load-packages")

# when done unload packages
testthat::teardown({
    detach("package:coefplot", unload=TRUE)
    detach("package:ggplot2", unload=TRUE)
})


test_that("Packages load as expected", {
    testthat::skip_on_cran()
    testthat::skip_on_travis()
    expect_message(load_packages('ggplot2'), 'ggplot2')
    expect_message(load_packages(c('ggplot2', 'coefplot')), 'ggplot2, coefplot')
})

test_that('Errors are captured', {
    testthat::skip_on_cran()
    testthat::skip_on_travis()
    expect_error(load_packages(5), 'packages is not a character vector')
    expect_error(load_packages(c('ggplot2', 'fake1')), 'fake1')
})
