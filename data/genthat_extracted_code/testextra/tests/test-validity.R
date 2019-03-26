#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `validity.R`')
#line 56 "/rdtf/testextra/R/validity.R"
test_that('expect_valid', {#@testing
    gen <- setClass('invalid', list(valid='logical'))
    setValidity('invalid', function(object) 'This class is always invalid')
    obj <- gen()

    expect_false(is_valid(obj))
    expect_identical( assertthat::validate_that(is_valid(obj))
                    , "This class is always invalid")

    expect_error( expect_valid(obj)
                , "`obj` is not valid;" %<<% dQuote("This class is always invalid")
                )

    cls <- setClass('test_class', contains='list')
    setValidity('test_class', function(object)TRUE)
    obj2 <- cls()

    expect_true(is_valid(obj2))
    expect_silent(expect_valid(obj2))

    lst <- list(obj, obj2)
    expect_identical( are_valid(lst)
                    , structure( c(FALSE, TRUE)
                               , messages = list("This class is always invalid", NULL)
                               )
                    )
    expect_identical( validate_that(all(are_valid(lst)))
                    , "Elements 1 of are_valid(lst) are not true"
                    )
    expect_identical(are_valid(list(obj2, obj2)), c(TRUE, TRUE))
})
