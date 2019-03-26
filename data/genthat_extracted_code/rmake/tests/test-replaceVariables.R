test_that('replaceVariables', {
  vars <- c(SIZE='small', METHOD='abc')
  expect_equal(replaceVariables('result-$[SIZE]-$[METHOD].csv', vars),
               'result-small-abc.csv')
  expect_equal(replaceVariables('result-$[SIZE]$[SIZE]-$[METHOD].csv', vars),
               'result-smallsmall-abc.csv')
  expect_equal(replaceVariables(c('res-$[SIZE].csv', 'out-$[SIZE].csv', 'out-$[METHOD].csv'), vars),
               c('res-small.csv', 'out-small.csv', 'out-abc.csv'))
  expect_equal(replaceVariables('result-$[size].csv', vars),
               'result-$[size].csv')

})

