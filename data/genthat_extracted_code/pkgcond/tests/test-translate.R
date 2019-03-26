#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `translate.R`')
#line 24 "R/translate.R"
test_that('._', {#@testing
    expect_identical(._('I am testing the function `._`')
                    , 'I am testing the function `._`')
    expect_identical(._('I am testing the function `%s`', '._')
                    , 'I am testing the function `._`')
})
