#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `assert_that.R`')
#line 33 "R/assert_that.R"
test_that('.test_assert_that', {#@testing
    expect_true(assert_that(1==1))

    error <-
    tryCatch(.test_assert_that(1==2)
            , condition = function(e)e )
    expect_is(error, 'condition')
    expect_is(error, 'pkgcond-condition')
    expect_is(error, 'error')
    expect_is(error, 'pkgcond-error')
    expect_is(error, 'error-assertion failure')
    expect_is(error, 'pkgcond-error-assertion failure')
    expect_is(error, 'pkgcond::.test_assert_that-error-assertion failure')
    expect_is(error, 'pkgcond::.test_assert_that-error')
    expect_is(error, 'pkgcond::.test_assert_that-condition')
})
