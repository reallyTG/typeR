test_that('targets', {
  job <- 'data.csv' %>>% rRule('process.R') %>>% 'data.rds' %>>% markdownRule('report.Rnw') %>>% 'report.pdf'
  expect_equal(targets(job), c('data.rds', 'report.pdf'))

  rule <- rRule('data.out', 'process.R', 'data.in')
  expect_equal(targets(rule), 'data.out')

  expect_error(targets('character.string'))
})


test_that('prerequisites', {
  job <- 'data.csv' %>>% rRule('process.R') %>>% 'data.rds' %>>% markdownRule('report.Rnw') %>>% 'report.pdf'
  expect_equal(prerequisites(job), c('process.R', 'data.csv', 'report.Rnw', 'data.rds'))

  rule <- rRule('data.out', 'process.R', 'data.in')
  expect_equal(prerequisites(rule), c('process.R', 'data.in'))

  expect_error(prerequisites('character.string'))
})


test_that('tasks', {
  job <- 'data.csv' %>>% rRule('process.R') %>>% 'data.rds' %>>% markdownRule('report.Rnw') %>>% 'report.pdf'
  expect_equal(tasks(job), 'all')

  job <- 'data.csv' %>>% rRule('process.R', task='a') %>>% 'data.rds' %>>% markdownRule('report.Rnw', task='b') %>>% 'report.pdf'
  expect_equal(tasks(job), c('a', 'b'))

  rule <- rRule('data.out', 'process.R', 'data.in')
  expect_equal(tasks(rule), 'all')

  rule <- rRule('data.out', 'process.R', 'data.in', task='blah')
  expect_equal(tasks(rule), 'blah')

  expect_error(prerequisites('character.string'))
})


test_that('terminals', {
  job <- 'data.csv' %>>% rRule('process.R') %>>% 'data.rds' %>>% markdownRule('report.Rnw') %>>% 'report.pdf'
  expect_equal(terminals(job), 'report.pdf')

  rule <- rRule('data.out', 'process.R', 'data.in')
  expect_equal(terminals(rule), 'data.out')

  expect_error(terminals('character.string'))
})

