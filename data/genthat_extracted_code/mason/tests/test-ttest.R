context("t-test output")

# construct_table ---------------------------------------------------------

ds <- design(testdata, 't.test')
ds <- add_settings(ds)
ds <- add_variables(ds, 'yvars', 'Income')
test_that("(for t.test) construct needs yvar or xvar", {
    ds_wrong <- add_variables(ds, 'xvars', c('Population', 'Murder'))
    expect_error(contruct(ds_wrong))

    ds_wrong <- add_variables(ds, 'yvars', c('Population', 'Murder'))
    expect_error(construct(ds_wrong))
})

test_that("(for t.test) construct variables the same in yvar and xvar", {
    ds_wrong <- add_variables(ds, 'yvars', c('Income', 'Area'))
    ds_wrong <- add_variables(ds_wrong, 'xvars', c('Income', 'Population'))
    expect_error(construct(ds_wrong))
})

# comparing to real results -----------------------------------------------

ds <- design(testdata, 't.test')
ds <- add_settings(ds)
vars <- c('Income', 'Population', 'Frost', 'Area')
ds <- add_variables(ds, 'yvars', vars[1:2])
ds <- add_variables(ds, 'xvars', vars[3:4])

test_that("(t.test) results compare to real results", {
    test_results <- scrub(construct(ds))[-1:-2]
    real_results <- rbind(
        broom::tidy(t.test(testdata$Income, testdata$Area)),
        broom::tidy(t.test(testdata$Income, testdata$Frost)),
        broom::tidy(t.test(testdata$Population, testdata$Area)),
        broom::tidy(t.test(testdata$Population, testdata$Frost))
    ) %>%
        dplyr::tbl_df()
    expect_equal(test_results, real_results)
})

# scrub and polish --------------------------------------------------------

ds <- construct(ds)
test_that("(for t.test) scrub converts to tbl_df and removes specs", {
    expect_is(scrub(ds), 'tbl_df')
    expect_null(attr(scrub(ds), 'specs'))
})