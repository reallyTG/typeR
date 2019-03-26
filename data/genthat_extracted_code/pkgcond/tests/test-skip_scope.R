#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `skip_scope.R`')
#line 34 "R/skip_scope.R"
test_that('skip_scope', {#@testing
    fun <- function()find_scope()
    environment(fun) <- globalenv()
    skip <- skip_scope(fun)
    val <- skip()
    cat(val)
    expect_identical(val, character())
})
