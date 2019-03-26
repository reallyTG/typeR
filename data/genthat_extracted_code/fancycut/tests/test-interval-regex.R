# Regex testing
# Based on pattern from Richie Cotton
# https://github.com/adamleerich/fancycut/issues/4
#
#   rx <- "([\\(\\[])\\s*([+-]?Inf|[\\d.+-eE]+)\\s*,\\s*([+-]?Inf|[\\d.+-eE]+)\\s*([\\)\\]])"
#

# [ \\( \\[ ]             Opening bracket can be [ or (
# \\s*                    Whitespace
# [+-]?Inf | [\\d.+-eE]+  Numeric
# \\s*                    Whitespace
# ,                       Comma is mandatory
# \\s*                    Whitespace
# [+-]?Inf | [\\d.+-eE]+  Numeric
# \\s*                    Whitespace
# [ \\) \\] ]             Closing bracket can be ) or ]

# \d = digit class
# \s = whitepace class

# Repetition quantifiers
#   ?    The preceding item is optional and will be matched at most once.
#   *    The preceding item will be matched zero or more times.
#   +    The preceding item will be matched one or more times.


# grep      Returns a vector of the indices of the elements of x that yielded a match
# grepl     Returns a logical vector
# regexpr
# grepexpr
# regexec
# strsplit
# sub
# gsub


popen   <- '(\\(|\\[)'
pclose  <- '(\\)|\\])'
psci    <- '[-+]?\\d*\\.?\\d+(?:[eE][-+]?\\d+)?'  # https://www.regular-expressions.info/floatingpoint.html
pinf    <- '[-+]?Inf'
pnum    <- paste0('((?:', psci, ')|(?:', pinf, '))')
pint    <- paste0('^\\s*', popen, '\\s*', pnum, '\\s*', ',', '\\s*', pnum, '\\s*', pclose, '\\s*', '$')




bracks <- c(
  '(',
  ')',
  '{',
  '}',
  '[',
  ']'
)

well_formed_meaningful <- c(
  '[0,1)',
  '[1,1]',
  '(5, 10]',
  '(+234987, Inf)',
  '[-Inf,+Inf)',
  '  (  1   ,   2  ]',
  '  (  1   ,   2   ]   '
)

badly_formed <- c(
  'a',
  NA,
  '{0,1]',
  '.',
  '[0]',
  '[[123,98798)',
  '[23498,,]',
  '(++1,--1)'
)

well_formed_meaningless <- c(
  '(0,0]',
  '(0,0)',
  '[0,1)',
  '[Inf,Inf]'
)


mixed <- c(
  '[1, 5]',
  '0',
  '(8,+9]',
  '[[,1231231.12.121.}',
  '(0, 5)'
)



context('Regex for interval works')

test_that('I understand what I am doing...', {

  expect_equal(grep(popen, bracks), c(1, 5))
  expect_equal(grepl(popen, bracks), c(T, F, F, F, T, F))

  expect_equal(grep(pclose, bracks), c(2, 6))
  expect_equal(grepl(pclose, bracks), c(F, T, F, F, F, T))

  expect_equal(grepl(psci, ''), F)
  expect_equal(as.numeric(''), NA_real_)

})


test_that('Numbers are matching properly', {

  s <- paste0('^', psci, '$')
  expect_equal(grepl(s, '1'), T)
  expect_equal(grepl(s, '.01'), T)
  expect_equal(grepl(s, 'e5'), F)
  expect_equal(grepl(s, '1.2'), T)
  expect_equal(grepl(s, '+123876123876.123212e-12319287'), T)
  expect_equal(grepl(s, '1..3'), F)


  i <- paste0('^', pinf, '$')
  expect_equal(grepl(i, 'Inf'), T)
  expect_equal(grepl(i, '+Inf'), T)
  expect_equal(grepl(i, '-Inf'), T)
  expect_equal(grepl(i, '+-Inf'), F)
  expect_equal(grepl(i, 'inf'), F)
  expect_equal(grepl(i, 'INF'), F)
  expect_equal(grepl(i, '0.Inf'), F)

})



test_that('Interval regex is working', {

  expect_equal(all(grepl(pint, well_formed_meaningful)), T)
  expect_equal(all(grepl(pint, well_formed_meaningless)), T)
  expect_equal(any(grepl(pint, badly_formed)), F)

})



