context("blueprint phase (design, settings, variables)")

# design ---------------------------------------------------------

testdata <- dplyr::mutate(testdata, Rich = as.factor(Rich))

test_that("design is of correct class and has specs attribute", {
    ds <- design(testdata, 'gee')
    expect_is(ds, 'gee_bp')
    expect_output(str(attr(ds, 'specs')), 'List of 1')

    ds <- design(testdata, 'cor')
    expect_is(ds, 'cor_bp')
    expect_output(str(attr(ds, 'specs')), 'List of 1')

    ds <- design(testdata, 'glm')
    expect_is(ds, 'glm_bp')
    expect_output(str(attr(ds, 'specs')), 'List of 1')

    ds <- design(testdata, 't.test')
    expect_is(ds, 't.test_bp')
    expect_output(str(attr(ds, 'specs')), 'List of 1')
})

# add_settings ------------------------------------------------------------

test_that("add_setting is of correct class and has specs attribute", {
    ds <- design(testdata, 'gee')
    ds <- add_settings(ds, cluster.id = 'state.region')
    expect_is(ds, 'gee_bp')
    expect_output(str(attr(ds, 'specs')), 'List of')

    ds <- design(testdata, 'cor')
    ds <- add_settings(ds)
    expect_is(ds, 'cor_bp')
    expect_output(str(attr(ds, 'specs')), 'List of')

    ds <- design(testdata, 'glm')
    ds <- add_settings(ds)
    expect_is(ds, 'glm_bp')
    expect_output(str(attr(ds, 'specs')), 'List of')
})

test_that("add_setting asserting works", {
    ds <- design(testdata, 'gee')
    expect_error(add_settings(ds))
    expect_error(add_settings(ds, 'doesnt_exist'))
    expect_error(add_settings(ds, 'state.region', family = 'gaussian'))

    ds <- design(testdata, 'cor')
    expect_message(add_settings(ds, hclust.order = TRUE))

    ds <- design(testdata, 'glm')
    expect_error(add_settings(ds, family = 'gaussian'))
})

# add_variables -----------------------------------------------------------

test_that("add_variables is correct class and has correct number of specs", {
    ds <- design(testdata, 'gee')
    ds <- add_variables(ds, 'yvars', c('Income', 'Frost'))
    ds <- add_variables(ds, 'xvars', c('Population', 'Murder'))
    ds <- add_variables(ds, 'covariates', c('Life.Exp'))
    expect_is(ds, 'gee_bp')
    expect_output(str(attr(ds, 'specs')$vars), 'List of 3')

    ds <- design(testdata, 'cor')
    ds <- add_variables(ds, 'yvars', c('Income', 'Frost'))
    ds <- add_variables(ds, 'xvars', c('Population', 'Murder'))
    expect_is(ds, 'cor_bp')
    expect_output(str(attr(ds, 'specs')$vars), 'List of 2')
})

test_that("add_variables asserting works", {
    ds <- design(testdata, 'cor')
    ds <- add_variables(ds, 'yvars', c('Income', 'Frost'))
    expect_message(add_variables(ds, 'yvars', 'Income'))
    expect_error(add_variables(iris))
    expect_error(add_variables(ds, 'none_existant', 'Population'))
    expect_error(add_variables(ds, 'xvars', 'none_existant'))
    expect_error(add_variables(ds, 'xvars', c('Population', 'Rich')))
    ds <- add_variables(ds, 'xvars', c('Area'))
    expect_message(add_variables(ds, 'xvars', 'Population'))
})

test_that("blueprint list is updated when another add_* is used", {
    ds <- design(testdata, 'gee')
    ds <- add_settings(ds, cluster.id = 'state.region')
    expect_is(ds, 'gee_bp')
    expect_output(str(attr(ds, 'specs')), 'List of 6')
    ds <- add_settings(ds, cluster.id = 'state.region', corstr = 'ar1')
    expect_output(str(attr(ds, 'specs')), 'List of 6')
    expect_equal(attr(ds, 'specs')$corstr, 'ar1')

    ds <- add_variables(ds, 'yvars', c('Income', 'Area'))
    expect_is(ds, 'gee_bp')
    expect_output(str(attr(ds, 'specs')), 'List of 7')
    expect_output(str(attr(ds, 'specs'))$vars, 'List of 1')
    ds <- add_variables(ds, 'xvars', c('Population', 'Frost'))
    expect_output(str(attr(ds, 'specs')), 'List of 7')
    expect_output(str(attr(ds, 'specs'))$vars, 'List of 2')
})