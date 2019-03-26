context("pls output")

testdata <- dplyr::mutate(testdata, Rich = as.factor(Rich))

skip("Not completely implemented yet.")

# add_settings ------------------------------------------------------------

ds <- design(testdata, 'pls')
test_that("cv specs work in settings", {
    ds_right <- add_settings(ds, cv.data = TRUE)
    expect_match(class(attr(ds_right, 'specs')$cv.index), 'integer')

    ds_empty <- add_settings(ds, cv.data = FALSE)
    expect_equal(attr(ds_empty, 'specs')$cv.index, NULL)
})

# construct ---------------------------------------------------------------

ds <- design(testdata, 'pls')
ds <- add_variables(ds, 'xvars', c('Population', 'Income', 'Murder'))
ds <- add_variables(ds, 'yvars', c('Frost'))

test_that("test data is return dependent on cv.data", {
    ds_null <- add_settings(ds, cv.data = FALSE)
    expect_null(attr(construct(ds_null), 'specs')$results$test_data)

    ds_testdata <- add_settings(ds, cv.data = TRUE)
    expect_is(attr(construct(ds_testdata), 'specs')$results$test_data, 'data.frame')
})

ds <- add_settings(ds)
test_that("only numeric variables", {
    expect_error(add_variables(ds, 'xvars', c('Population', 'Income', 'Rich')))
})

# Scrub -------------------------------------------------------------------

test_that("scrubbing returns a list", {
    ds <- construct(ds)
    expect_type(scrub(ds), 'list')
})