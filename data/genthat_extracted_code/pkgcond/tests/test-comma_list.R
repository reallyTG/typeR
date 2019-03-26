#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `comma_list.R`')
#line 34 "R/comma_list.R"
test_that('comma_list', {#! @testing
    expect_is(comma_list(1), 'character')
    expect_equal(comma_list(1), '1')

    expect_equal(comma_list(1:2), '1 and 2')

    expect_equal(comma_list(1:3), '1, 2, and 3')
})
