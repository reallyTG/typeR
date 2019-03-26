#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `if-otherwise.R`')
#line 46 "R/if-otherwise.R"
test_that('if-otherwise logic', {#@testing if-otherwise logic
    if (exists('x', inherits=FALSE)) rm(list='x')
    val <- (x <- 'it still evaluated') %if% FALSE
    expect_null(val)
    expect_false(exists('x', inherits=FALSE))

    if (exists('x', inherits=FALSE)) rm(list='x')
    val <- (x <- 'it still evaluated') %if% FALSE %otherwise% "should get this"
    expect_equal(val, "should get this")
    expect_false(exists('x', inherits=FALSE))

    if (exists('x', inherits=FALSE)) rm(list='x')
    val <- (x <- 'it is supposed to be evaluated') %if% TRUE %otherwise% "should not get this"
    expect_equal(val, 'it is supposed to be evaluated')
    expect_true(exists('x', inherits=FALSE))
    expect_equal(x, 'it is supposed to be evaluated')

    if (exists('x', inherits=FALSE)) rm(list='x')
    expect_error( 'this' %unless% 'wont' %otherwise% 'work'
                , "Infix opperator '%otherwise%' can only be used following an '%if%' infix."
                )
})
