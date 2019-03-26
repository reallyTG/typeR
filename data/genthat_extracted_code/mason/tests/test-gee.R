context("GEE output")

## TODO: Tests to maintain class after doing something else to it outside of mason (?)
## TODO: Use multiple datasets (state, dietox + respiratory + sitka89 (geepack))

# construct ---------------------------------------------------------------

ds <- design(testdata, 'gee')
ds <- add_settings(ds, cluster.id = 'state.region')
test_that("(for gee) construct needs yvar or xvar", {
    ds_wrong <- add_variables(ds, 'xvars', c('Population', 'Murder'))
    expect_error(contruct_analysis(ds_wrong))

    ds_wrong <- add_variables(ds, 'yvars', c('Population', 'Murder'))
    expect_error(contruct_analysis(ds_wrong))
})

test_that("(for gee) construct same var in both yvar and xvar", {
    ds_wrong <- add_variables(ds, 'yvars', c('Income', 'Area'))
    ds_wrong <- add_variables(ds_wrong, 'xvars', c('Income', 'Population'))
    expect_error(construct(ds_wrong))
})

ds <- add_variables(ds, 'yvars', c('Income', 'Life.Exp'))
ds <- add_variables(ds, 'xvars', c('Population', 'Murder'))
test_that("(for gee) construct interaction is a covar", {
    ds_wrong <- add_variables(ds, 'covariates', c('Frost'))
    ds_wrong <- add_variables(ds_wrong, 'interaction', c('Area'))
    expect_error(construct(ds_wrong))
})

test_that("(for gee) construct there is only one interaction", {
    ds_wrong <- add_variables(ds, 'covariates', c('Frost', 'Area'))
    ds_wrong <- add_variables(ds_wrong, 'interaction', c('Frost', 'Area'))
    expect_error(construct(ds_wrong))
})

# Need to develop this test for when there are too many variables to loop through.
# test_that("(for gee) construct is not more than 100 y and x vars to run on", {
# })

# comparing to real results -----------------------------------------------

gee_function <- function(formula, data = testdata) {
    gee_data <- geepack::geeglm(
        formula,
        family = gaussian('identity'),
        data = data,
        corstr = 'ar1',
        id = state.region
    )
    nsize <- summary(gee_data)$clusz
    tidy_data <-
        broom::tidy(gee_data, conf.int = TRUE, conf.level = 0.95)
    data.frame(
        tidy_data,
        sample.total = sum(nsize),
        sample.max = max(nsize),
        sample.min = min(nsize)
    )
}
ds <- add_settings(ds, cluster.id = 'state.region', corstr = 'ar1')

test_that("(for gee) construct creates the right results (no covars)", {
    ds_lone <- scrub(construct(ds))[-1:-3]
    real_results <- rbind(
        gee_function(Income ~ Murder),
        gee_function(Income ~ Population),
        gee_function(Life.Exp ~ Murder),
        gee_function(Life.Exp ~ Population)
    )[-1] %>%
        dplyr::tbl_df()

    expect_equivalent(ds_lone, real_results)
})

ds <- add_variables(ds, 'covariates', c('Frost', 'Area'))
test_that("(for gee) construct creates the right results (with covars)", {
    ds_lone <- scrub(construct(ds))[-1:-3]
    real_results <- rbind(
        gee_function(Income ~ Murder + Frost + Area),
        gee_function(Income ~ Population + Frost + Area),
        gee_function(Life.Exp ~ Murder + Frost + Area),
        gee_function(Life.Exp ~ Population + Frost + Area)
    )[-1] %>%
        dplyr::tbl_df()

    expect_equivalent(ds_lone, real_results)
})

test_that("(for gee) construct creates the right results (with covars + int)", {
    ds <- add_variables(ds, 'interaction', c('Frost'))
    ds_lone <- scrub(construct(ds))[-1:-3]
    real_results <- rbind(
        gee_function(Income ~ Murder + Frost + Area + Murder:Frost),
        gee_function(Income ~ Population + Frost + Area + Population:Frost),
        gee_function(Life.Exp ~ Murder + Frost + Area + Murder:Frost),
        gee_function(Life.Exp ~ Population + Frost + Area + Population:Frost)
    )[-1] %>%
        dplyr::tbl_df()

    expect_equivalent(ds_lone, real_results)
})

# scrub and polish --------------------------------------------------------

ds <- construct(ds)
test_that("(for gee) scrub converts to tbl_df and removes specs", {
    expect_is(scrub(ds), 'tbl_df')
    expect_null(attr(scrub(ds), 'specs'))
})
