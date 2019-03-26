source('sanitizeCovr.R')

test_that('offlineRule', {
  r <- offlineRule(target='target.pdf', message='The Message', depends=c('dep1', 'dep2'))
  expect_true(is.rule(r))
  expect_equal(r$target, 'target.pdf')
  expect_equal(r$pattern, 'target.pdf')
  expect_equal(r$depends, c('dep1', 'dep2'))
  expect_equal(r$clean, '$(RM) target.pdf')
  expect_equal(r$task, 'all')
  expect_equal(r$phony, FALSE)
  expect_equal(sanitizeCovr(r$build),
               c('$(R) -e \'{\' \\',
                 '-e \'    stop(\"The Message\")\' \\',
                 '-e \'}\''))
})
