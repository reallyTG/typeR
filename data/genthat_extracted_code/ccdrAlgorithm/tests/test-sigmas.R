context("sigmas")

dat <- generate_fixed_data_frame()
sbdata <- suppressMessages(sparsebnData(dat, type = "c"))
pp <- ncol(dat)

test_that("Output is the same when sigmas is specified manually", {
    dags.null <- ccdr.run(sbdata, lambdas.length = 20)
    dags.null <- lapply(dags.null, function(x) x$edges)

    dags.sigmas <- ccdr.run(sbdata, lambdas.length = 20, sigmas = rep(-1, ncol(dat)))
    dags.sigmas <- lapply(dags.sigmas, function(x) x$edges)

    expect_equal(dags.null, dags.sigmas)
})

test_that("Setting sigmas works without error", {
    ### LS loss
    expect_error(ccdr.run(sbdata, lambdas.length = 20, sigmas = rep(1, ncol(dat))),
                 NA)

    ### Arbitrary positive values
    expect_error(ccdr.run(sbdata, lambdas.length = 20, sigmas = runif(pp)),
                 NA)
})
