#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `catch_condition.R`')
#line 28 "R/catch_condition.R"
test_that('catch_condition', {#@testing
    val <- catch_condition(pkg_message("testing"))
    expect_is(val, 'condition')
    expect_is(val, 'message')
})
#line 52 "R/catch_condition.R"
test_that('catch_all_conditions', {#@testing
    my_fun <- function(){
        message("a message")
        warning("a warning")
        pkg_message("a package message", scope="test")
        pkg_warning("a package warning", scope="test")
        pkg_error("a package error", scope='test')
    }
    conditions <- catch_all_conditions(my_fun())

    expect_length(conditions, 3)
    expect_is(conditions$error, 'test-error')
    expect_length(conditions$warnings, 2)
    expect_is(conditions$warnings[[1]], 'simpleWarning')
    expect_is(conditions$warnings[[2]], 'test-warning')
    expect_length(conditions$messages, 2)
    expect_is(conditions$messages[[1]], 'simpleMessage')
    expect_is(conditions$messages[[2]], 'test-message')
})
