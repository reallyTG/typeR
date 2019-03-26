#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `suppress.R`')
#line 50 "R/suppress.R"
test_that('suppress_conditions', {#@testing suppress_conditions
    do_conditions <- function(){
        message('ignore me.')
        warning('ignore me.')
        message('but not me.')
        warning('but not me.')
        pkg_message('if the class matches', scope = 'test_ignore')
        pkg_warning('if the class matches', scope = 'test_ignore')
    }
    expect_silent(suppress_conditions(do_conditions()))

    capture_conditions <- function(code){
        warnings <- capture_warnings(
            messages <- capture_messages(code))
        list(warnings=warnings, messages=messages)
    }

    bare <- capture_conditions(do_conditions())

    expect_identical( capture_conditions(suppress_warnings(do_conditions()))
                    , list(warnings=character(0), messages=bare$messages)
                    )
    expect_identical( capture_conditions(suppress_messages(do_conditions()))
                    , list(warnings=bare$warnings, messages=character(0))
                    )

    expect_identical( capture_conditions(suppress_conditions(do_conditions(), 'ignore'))
                    , list( warnings=bare$warnings[-1]
                          , messages=bare$messages[-1]
                          ))
    expect_identical( capture_conditions(suppress_conditions(do_conditions(), class='test_ignore-condition'))
                    , list( warnings=bare$warnings[-3]
                          , messages=bare$messages[-3]
                          ))
})
#line 91 "R/suppress.R"
test_that('suppress_warnings', {#@testing suppress_warnings
    do_warnings <- function(){
        warning('ignore me.')
        warning('but not me.')
        pkg_warning('if the class matches', scope = 'test_ignore')
    }
    expect_warning(do_warnings(), 'ignore me')
    expect_warning(do_warnings(), 'but not me')
    expect_warning(do_warnings(), 'if the class matches')


    expect_silent(suppress_warnings(do_warnings()))

    expect_identical( capture_warnings(suppress_warnings(do_warnings(), 'ignore'))
                    , c( "but not me."
                       , "if the class matches"
                       ))
    expect_identical( capture_warnings(suppress_warnings(do_warnings(), class='test_ignore-warning'))
                    , c( "ignore me."
                       , "but not me."
                       ))
})
#line 119 "R/suppress.R"
test_that('suppress_messages', {#@testing suppress_messages
    do_messages <- function(){
        message('ignore me.')
        message('but not me.')
        pkg_message('if the class matches', scope = 'test_ignore')
    }
    expect_message(do_messages(), 'ignore me')
    expect_message(do_messages(), 'but not me')
    expect_message(do_messages(), 'if the class matches')

    expect_silent(suppress_messages(do_messages()))

    expect_identical( capture_messages(suppress_messages(do_messages(), 'ignore'))
                    , c( "but not me.\n"
                       , "if the class matches"
                       ))
    expect_identical( capture_messages(suppress_messages(do_messages(), class='test_ignore-message'))
                    , c( "ignore me.\n"
                       , "but not me.\n"
                       ))
})
