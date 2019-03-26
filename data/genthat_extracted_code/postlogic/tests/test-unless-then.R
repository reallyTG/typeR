#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `unless-then.R`')
#line 46 "R/unless-then.R"
test_that('unless-then logic', {#@testing unless-then logic
    if (exists('x', inherits=FALSE)) rm(list='x')
    val <- (x <- 'it is supposed to be evaluated') %unless% FALSE
    expect_equal(val, 'it is supposed to be evaluated')
    expect_identical(val, x)

    if (exists('x', inherits=FALSE)) rm(list='x')
    val <- (x <- 'it still evaluated') %unless% TRUE
    expect_null(val)
    expect_false(exists('x', inherits=FALSE))

    if (exists('x', inherits=FALSE)) rm(list='x')
    val <- (x <- 'it still evaluated') %unless% TRUE %then% "should get this"
    expect_equal(val, "should get this")
    expect_false(exists('x', inherits=FALSE))

    if (exists('x', inherits=FALSE)) rm(list='x')
    val <- (x <- 'it is supposed to be evaluated') %unless% FALSE %then% "should not get this"
    expect_equal(val, 'it is supposed to be evaluated')
    expect_true(exists('x', inherits=FALSE))
    expect_equal(x, 'it is supposed to be evaluated')

    if (exists('x', inherits=FALSE)) rm(list='x')
    expect_error( 'this' %if% 'wont' %then% 'work'
                , "Infix opperator '%then%' can only be used following an '%unless%' infix."
                )
})
