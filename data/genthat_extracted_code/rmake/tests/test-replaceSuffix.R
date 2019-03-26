test_that('replaceSuffix', {
  expect_identical(replaceSuffix('filename.csv', '.pdf'),
                   'filename.pdf')
  expect_identical(replaceSuffix('filename.csv', ''),
                   'filename')
  expect_identical(replaceSuffix('filename', '.csv'),
                   'filename.csv')
  expect_identical(replaceSuffix('filename', ''),
                   'filename')
  expect_identical(replaceSuffix(c('a.csv', 'b.txt', 'c.R'), '.new'),
                   c('a.new', 'b.new', 'c.new'))
})
