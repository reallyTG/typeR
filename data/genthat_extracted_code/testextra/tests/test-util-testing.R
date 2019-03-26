#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `util-testing.R`')
#line 14 "R/util-testing.R"
test_that('is_valid_regex', {#@testing
    expect_true(is_valid_regex("^hello world$"))
    expect_false(is_valid_regex("^hello (world$"))
    expect_identical( validate_that(is_valid_regex("^hello (world$"))
                    , "invalid regular expression " %<<<%
                      "'^hello (world$', reason 'Missing ')''"
                    )
})
