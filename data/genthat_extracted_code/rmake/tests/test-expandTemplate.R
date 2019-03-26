test_that('expandTemplate 1', {
  tmpl <- rRule('data-$[VERSION].csv', 'process-$[TYPE].R', 'output-$[VERSION]-$[TYPE].csv')

  res <- expandTemplate(tmpl, c(VERSION='small', TYPE='a'))
  expected <- list(rRule('data-small.csv', 'process-a.R', 'output-small-a.csv'))
  expect_equal(res, expected)

  res <- expandTemplate(list(tmpl), c(VERSION='small', TYPE='a'))
  expected <- list(rRule('data-small.csv', 'process-a.R', 'output-small-a.csv'))
  expect_equal(res, expected)

  res <- expandTemplate(tmpl, expand.grid(VERSION=c('small', 'big'),
                                          TYPE=c('a', 'b', 'c')))
  expected <- list(rRule('data-small.csv', 'process-a.R', 'output-small-a.csv'),
                   rRule('data-big.csv', 'process-a.R', 'output-big-a.csv'),
                   rRule('data-small.csv', 'process-b.R', 'output-small-b.csv'),
                   rRule('data-big.csv', 'process-b.R', 'output-big-b.csv'),
                   rRule('data-small.csv', 'process-c.R', 'output-small-c.csv'),
                   rRule('data-big.csv', 'process-c.R', 'output-big-c.csv'))
  expect_equal(res, expected)

  res <- expandTemplate(list(tmpl), expand.grid(VERSION=c('small', 'big'),
                                          TYPE=c('a', 'b', 'c')))
  expected <- list(rRule('data-small.csv', 'process-a.R', 'output-small-a.csv'),
                   rRule('data-big.csv', 'process-a.R', 'output-big-a.csv'),
                   rRule('data-small.csv', 'process-b.R', 'output-small-b.csv'),
                   rRule('data-big.csv', 'process-b.R', 'output-big-b.csv'),
                   rRule('data-small.csv', 'process-c.R', 'output-small-c.csv'),
                   rRule('data-big.csv', 'process-c.R', 'output-big-c.csv'))
  expect_equal(res, expected)
})


test_that('expandTemplate 2', {
  tmpl <- 'd-$[VERSION].csv' %>>%
    rRule('process-$[TYPE].R') %>>%
    'output-$[VERSION]-$[TYPE].csv' %>>%
    markdownRule('report.Rnw') %>>%
    'report-$[VERSION]-$[TYPE].pdf'

  res <- expandTemplate(tmpl, c(VERSION='small', TYPE='a'))
  expected <- 'd-small.csv' %>>%  rRule('process-a.R') %>>% 'output-small-a.csv' %>>%
    markdownRule('report.Rnw') %>>% 'report-small-a.pdf'
  expect_equal(res, expected)

  res <- expandTemplate(tmpl, expand.grid(VERSION=c('small', 'big'),
                                          TYPE=c('a', 'b', 'c')))
  expected <- c('d-small.csv' %>>%  rRule('process-a.R') %>>% 'output-small-a.csv' %>>%
                  markdownRule('report.Rnw') %>>% 'report-small-a.pdf',
                'd-big.csv' %>>%  rRule('process-a.R') %>>% 'output-big-a.csv' %>>%
                  markdownRule('report.Rnw') %>>% 'report-big-a.pdf',
                'd-small.csv' %>>%  rRule('process-b.R') %>>% 'output-small-b.csv' %>>%
                  markdownRule('report.Rnw') %>>% 'report-small-b.pdf',
                'd-big.csv' %>>%  rRule('process-b.R') %>>% 'output-big-b.csv' %>>%
                  markdownRule('report.Rnw') %>>% 'report-big-b.pdf',
                'd-small.csv' %>>%  rRule('process-c.R') %>>% 'output-small-c.csv' %>>%
                  markdownRule('report.Rnw') %>>% 'report-small-c.pdf',
                'd-big.csv' %>>%  rRule('process-c.R') %>>% 'output-big-c.csv' %>>%
                  markdownRule('report.Rnw') %>>% 'report-big-c.pdf')
  expect_equal(res, expected)
})
