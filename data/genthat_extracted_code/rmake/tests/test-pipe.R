test_that('pipe', {
  job <- 'data.csv' %>>% rRule('preprocess.R') %>>% 'data.rds' %>>% markdownRule('report.rnw') %>>% 'report.pdf'
  expected <- list(rRule(target='data.rds', script='preprocess.R', depends='data.csv'),
                   markdownRule(target='report.pdf', script='report.rnw', depends='data.rds'))
  expect_identical(job, expected)

  expect_error('data.csv' %>>% rRule('process.R'))
  expect_error('data.csv' %>>% rRule('process.R') %>>% 'out.txt' %>>% rRule('process2.R'))
  expect_error('data.csv' %>>% list() %>>% 'out.txt')
  expect_error('data.csv' %>>% 'data2' %>>% 'out.txt')
})
