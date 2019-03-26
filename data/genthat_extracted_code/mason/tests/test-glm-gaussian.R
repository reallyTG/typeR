context("GLM output for gaussian family")

# construct ---------------------------------------------------------------

ds <- design(testdata, 'glm')
ds <- add_settings(ds)
test_that("(for glm) construct needs yvar or xvar", {
    ds_wrong <- add_variables(ds, 'xvars', c('Population', 'Murder'))
    expect_error(construct(ds_wrong))

    ds_wrong <- add_variables(ds, 'yvars', c('Population', 'Murder'))
    expect_error(construct(ds_wrong))
})

test_that("(for glm) construct variables the same in yvar and xvar", {
    ds_wrong <- add_variables(ds, 'yvars', c('Income', 'Area'))
    ds_wrong <- add_variables(ds_wrong, 'xvars', c('Income', 'Population'))
    expect_error(construct(ds_wrong))
})

ds <- add_variables(ds, 'yvars', c('Income', 'Life.Exp'))
ds <- add_variables(ds, 'xvars', c('Population', 'Murder'))
test_that("(for glm) construct interaction is a covar", {
    ds <- add_variables(ds, 'covariates', c('Frost'))
    ds_wrong <- add_variables(ds, 'interaction', c('Area'))
    expect_error(construct(ds_wrong))
})

test_that("(for glm) construct there is only one interaction", {
    ds_wrong <- add_variables(ds, 'covariates', c('Frost', 'Area'))
    ds_wrong <- add_variables(ds_wrong, 'interaction', c('Frost', 'Area'))
    expect_error(construct(ds_wrong))
})

# comparing to real results -----------------------------------------------

glm_function <- function(formula) {
    fit <- glm(formula, data = testdata)
    sample.size <- nrow(fit$model)
    tidy_data <- broom::tidy(fit, conf.int = TRUE, conf.level = 0.95)
    cbind(tidy_data, sample.size)
}

ds <- design(testdata, 'glm')
ds <- add_settings(ds)
ds <- add_variables(ds, 'yvars', c('Income', 'Population'))
ds <- add_variables(ds, 'xvars', c('Frost', 'Area'))

test_that("(for glm) results are equal to real results (no covar)", {
    test_results <- scrub(construct(ds))
    real_results <- rbind(
        glm_function(Income ~ Area),
        glm_function(Income ~ Frost),
        glm_function(Population ~ Area),
        glm_function(Population ~ Frost)
    ) %>%
        dplyr::tbl_df()

    expect_equivalent(test_results[-1:-3], real_results[-1])
})

test_that("(for glm) results are equal to real results (with covar)", {
    ds <- add_variables(ds, 'covariates', 'Murder')
    test_results <- scrub(construct(ds))
    real_results <- rbind(
        glm_function(Income ~ Area + Murder),
        glm_function(Income ~ Frost + Murder),
        glm_function(Population ~ Area + Murder),
        glm_function(Population ~ Frost + Murder)
    ) %>%
        dplyr::tbl_df()

    expect_equivalent(test_results[-1:-3], real_results[-1])
})

test_that("(for glm) results are equal to real results (with covar + int)", {
    ds <- add_variables(ds, 'covariates', 'Murder')
    ds <- add_variables(ds, 'interaction', 'Murder')
    test_results <- scrub(construct(ds))
    real_results <- rbind(
        glm_function(Income ~ Area + Murder + Area:Murder),
        glm_function(Income ~ Frost + Murder + Frost:Murder),
        glm_function(Population ~ Area + Murder + Area:Murder),
        glm_function(Population ~ Frost + Murder + Frost:Murder)
    ) %>%
        dplyr::tbl_df()

    expect_equivalent(test_results[-1:-3], real_results[-1])
})

# scrub and polish --------------------------------------------------------

ds <- construct(ds)
test_that("(for glm) scrub converts to tbl_df and removes specs", {
    expect_is(scrub(ds), 'tbl_df')
    expect_null(attr(scrub(ds), 'specs'))
})