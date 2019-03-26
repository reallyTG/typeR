#! This file was automatically produced by the testextra package.
#! Changes will be overwritten.

context('tests extracted from file `infix.R`')
#line 43 "R/infix.R"
test_that('%<<%', {#! @testing %<<%
    a <- 'A vain chalks above the integrated biscuit. '
    b <- 'Within the ground burns the leader.'
    c <- 'How can the fifteen distress lose?'
    expect_equal(a %<<% b, paste(a,b))
    expect_equal(a %<<% b %<<% c, paste(a,b,c))

    expect_equal(a %<<% NULL, a)
    expect_equal(NULL %<<% a, a)
    expect_equal(NULL %<<% NULL, "")
})
#line 57 "R/infix.R"
test_that('%<<<%', {#! @testing %<<<%
    a <- 'A vain chalks above the integrated biscuit. '
    b <- ' Within the ground burns the leader.'
    c <- 'How can the fifteen distress lose?'
    expect_equal(a %<<<% b, paste0(a,b))
    expect_equal(a %<<<% b %<<<% c, paste0(a,b, c, sep=''))

    expect_equal(a %<<<% NULL, a)
    expect_equal(NULL %<<<% a, a)
    expect_equal(NULL %<<<% NULL, '')
})
#line 70 "R/infix.R"
test_that('newline-concatenation', {#! @testing newline-concatenation
    a <- 'A vain chalks above the integrated biscuit. '
    b <- ' Within the ground burns the leader.'
    c <- 'How can the fifteen distress lose?'
    expect_equal(a %\% b, paste(a,b, sep='\n'))
    expect_equal(a %\% b %\% c, paste(a,b, c, sep='\n'))
})
#line 79 "R/infix.R"
test_that('`%||%`', {#@testing
    expect_true( NULL %||% TRUE)
    expect_true( TRUE %||% FALSE)
})
#line 98 "R/infix.R"
test_that('`%!in%`', {#@testing
    expect_true('A' %!in% letters)
    expect_false('a' %!in% letters)
})
