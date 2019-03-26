#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `conditions.R`')
#line 72 "R/conditions.R"
test_that('condition', {#@testing
    expect_silent( condition('testing', 'none', scope='base'))
    expect_null( condition('testing', 'none', scope='base'))

    expect_message( condition('testing', 'message', scope='base'), 'testing')
    expect_message( condition('testing', 'message', scope='base', type='testing')
                  , class = "message-testing"
                  )
    expect_message( condition('testing', 'message', scope='test', type='testing')
                  , class = "test-message-testing"
                  )

    expect_warning( condition('testing', 'warning', scope='base'), 'testing')
    expect_warning( condition('testing', 'warning', scope='base', type='testing')
                  , class = "warning-testing"
                  )
    expect_warning( condition('testing', 'warning', scope='test', type='testing')
                  , class = "test-warning-testing"
                  )

    expect_error( condition('testing', 'error', scope='base'), 'testing')
    expect_error( condition('testing', 'error', scope='base', type='testing')
                , class = "error-testing"
                )
    expect_error( condition('testing', 'error', scope='test', type='testing')
                , class = "test-error-testing"
                )

    tryCatch( condition('testing', 'error', type='testing'
                       , scope = c('test', 'my_class', 'my_method')
                       )
            , condition = function(obj){
                expect_is(obj, 'test-error-testing')
                expect_is(obj, 'test::my_class-error-testing')
                expect_is(obj, 'test::my_class::my_method-error-testing')
                expect_is(obj, 'test-error')
                expect_is(obj, 'test::my_class-error')
                expect_is(obj, 'test::my_class::my_method-error')
                expect_is(obj, 'error-testing')
                expect_is(obj, 'error')
                expect_is(obj, 'condition')
            })
})
#line 125 "R/conditions.R"
test_that('pkg_error', {#@testing pkg_error
    expect_error(.test_pkg_error("A package error."), "A package error.")
    x <- tryCatch( .test_pkg_error("A package error.")
                 , condition= function(e)e
                 )
    expect_is(x, 'pkgcond-error')
    expect_is(x, 'pkgcond-condition')
    expect_is(x, 'error')
    expect_is(x, 'condition')
})
#line 145 "R/conditions.R"
test_that('pkg_warning', {#@testing pkg_warning
    expect_warning(.test_pkg_warning("A package warning."), "A package warning.")
    x <- tryCatch( .test_pkg_warning("A package warning.")
                 , condition= function(e)e
                 )
    expect_is(x, 'pkgcond-warning')
    expect_is(x, 'pkgcond-condition')
    expect_is(x, 'warning')
    expect_is(x, 'condition')
})
#line 165 "R/conditions.R"
test_that('pkg_message', {#@testing pkg_message
    expect_message(.test_pkg_message("A package message"), "A package message")
    x <- tryCatch( .test_pkg_message("A package message")
                 , condition= function(e)e
                 )
    expect_is(x, 'pkgcond-message')
    expect_is(x, 'pkgcond-condition')
    expect_is(x, 'message')
    expect_is(x, 'condition')
})
