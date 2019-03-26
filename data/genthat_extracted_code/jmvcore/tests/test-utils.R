
context('utils')

test_that('extractRegexMatches() works', {
    content <- 'fred:jim && bob:will'
    matches <- gregexpr('[A-Za-z][A-Za-z0-9]*:[A-Za-z][A-Za-z0-9]*', content)
    expect_equal(extractRegexMatches(content, matches), c('fred:jim', 'bob:will'))
})

test_that('replaceRegexMatches() works', {
    content <- '(fred:jim && bob:will) || fred:glen'
    matches <- gregexpr('[A-Za-z][A-Za-z0-9]*:[A-Za-z][A-Za-z0-9]*', content)
    replaced <- replaceRegexMatches(content, matches, c('pow', 'wow', 'woo'))
    expect_equal(replaced, '(pow && wow) || woo')
})
