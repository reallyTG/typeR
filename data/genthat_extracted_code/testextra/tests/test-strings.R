#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `strings.R`')
#line 34 "R/strings.R"
test_that('is_nonempty_string', {#@testing
    expect_true(is_nonempty_string("hello world"))
    expect_false(is_nonempty_string(c("hello", "world")))
    expect_false(is_nonempty_string(character(0)))
    expect_false(is_nonempty_string(NA_character_))
    expect_false(is_nonempty_string(''))

    expect_identical( validate_that(is_nonempty_string(character(0)))
                    , sQuote("character(0)") %<<% .nonempty.string.msg)

    bad <- NA
    expect_identical( validate_that(is_nonempty_string(bad))
                    , sQuote("bad") %<<%.nonempty.string.msg)
})
#line 62 "R/strings.R"
test_that('is_optional_string', {#@testing
    expect_true(is_optional_string("hello"))
    expect_true(is_optional_string(character(0)))
    expect_false(is_optional_string(NA_character_))
    expect_false(is_optional_string(''))
    expect_false(is_optional_string(letters))

    bad <- NA_character_
    expect_identical(validate_that(is_optional_string(bad))
                    , sQuote('bad') %<<% .optional.string.msg)
})
