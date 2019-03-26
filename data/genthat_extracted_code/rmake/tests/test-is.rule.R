test_that('is.rule', {
  expect_true(is.rule(rule(target='target')))
  expect_false(is.rule(list(target='target')))
})
