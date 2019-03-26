context("inference")

dat_cts <- generate_continuous_sparsebnData()
dat_disc <- generate_discrete_sparsebnData()
sbp_empty <- generate_empty_sparsebnPath()
sbp <- generate_fixed_sparsebnPath()

test_that("Parameter estimation works on non-empty graphs", {
    ### Continuous data
    expect_error(estimate.parameters(sbp, dat_cts), NA)
    expect_error(estimate.parameters(sbp[[1]], dat_cts), NA) # test on single graph

    ### Discrete data
    expect_error(estimate.parameters(sbp, dat_disc), NA)
    expect_error(estimate.parameters(sbp[[1]], dat_disc), NA) # test on single graph
})

test_that("Parameter estimation works on empty graphs", {
    ### Modify data so that it only has one column
    dat_cts$data <- dat_cts$data[, 1, drop = FALSE]
    dat_disc$data <- dat_disc$data[, 1, drop = FALSE]

    ### Continuous data
    expect_error(estimate.parameters(sbp_empty, dat_cts), NA)
    expect_error(estimate.parameters(sbp_empty[[1]], dat_cts), NA) # test on single graph

    ### Discrete data
    expect_error(estimate.parameters(sbp_empty, dat_disc), NA)
    expect_error(estimate.parameters(sbp_empty[[1]], dat_disc), NA) # test on single graph
})
