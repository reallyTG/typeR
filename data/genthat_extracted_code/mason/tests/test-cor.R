context("Correlation output")

# construct ---------------------------------------------------------------

ds <- design(testdata, 'cor')
ds <- add_settings(ds)
test_that("(cor) needs at least xvar", {
    ds_wrong <- add_variables(ds, 'yvars', 'Income')
    expect_error(construct(ds_wrong))
})

# comparing to real results -----------------------------------------------

ds <- design(testdata, 'cor')
ds <- add_settings(ds)
vars <- c('Income', 'Population', 'Frost', 'Area')
ds <- add_variables(ds, 'xvars', vars)

test_that("(cor) results compare to real results", {
    cor_function <- function(x, y = NULL) {
        cor_data <- stats::cor(x, y,
                        use = 'complete.obs',
                        method = 'pearson')
        if (is.null(y))
            cor_data[upper.tri(cor_data)] <- NA
        dplyr::tbl_df(as.data.frame(cor_data))
    }

    test_results <- attr(construct(ds), 'specs')$results
    real_results <- cor_function(testdata[vars])
    expect_equal(test_results[-1], real_results)

    yvars <- c('Murder', 'HS.Grad', 'Illiteracy')
    ds <- add_variables(ds, 'yvars', yvars)
    test_results <- attr(construct(ds), 'specs')$results
    real_results <- cor_function(testdata[vars], testdata[yvars])
    expect_equal(test_results[-1], real_results)
})

# scrub and polish --------------------------------------------------------

ds <- construct(ds)
test_that("(for cor) scrub converts to tbl_df and removes specs", {
    expect_is(scrub(ds), 'tbl_df')
    expect_null(attr(scrub(ds), 'specs'))
})