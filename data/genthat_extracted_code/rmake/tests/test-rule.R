test_that('single target rule', {
  r <- rule('target', c('dep1', 'dep2'), 'buildCmd', 'cleanCmd')
  expect_true(is.rule(r))
  expect_equal(r$target, 'target')
  expect_equal(r$pattern, 'target')
  expect_equal(r$depends, c('dep1', 'dep2'))
  expect_equal(r$build, 'buildCmd')
  expect_equal(r$clean, 'cleanCmd')
})

test_that('multiple target rule', {
  r <- rule(c('target.doc', 'target.pdf'), c('dep1', 'dep2'), 'buildCmd', 'cleanCmd')
  expect_true(is.rule(r))
  expect_equal(r$target, c('target.doc', 'target.pdf'))
  expect_equal(r$pattern, c('target%doc', 'target%pdf'))
  expect_equal(r$depends, c('dep1', 'dep2'))
  expect_equal(r$build, 'buildCmd')
  expect_equal(r$clean, 'cleanCmd')
})
