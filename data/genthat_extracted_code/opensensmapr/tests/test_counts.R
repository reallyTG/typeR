source('testhelpers.R')
context('counts')

test_that('counts can be retrieved as a list of numbers', {
  check_api()

  counts = osem_counts()

  expect_true(is.list(counts))
  expect_true(is.numeric(unlist(counts)))
  expect_length(counts, 3)
})

test_that('requests can be cached', {
  check_api()

  osem_clear_cache()
  expect_length(list.files(tempdir(), pattern = 'osemcache\\..*\\.rds'), 0)
  c = osem_counts(cache = tempdir())

  cacheFile = paste(
    tempdir(),
    opensensmapr:::osem_cache_filename('/stats'),
    sep = '/'
  )
  expect_true(file.exists(cacheFile))
  expect_length(list.files(tempdir(), pattern = 'osemcache\\..*\\.rds'), 1)

  # no download output (works only in interactive mode..)
  out = capture.output({
    c = osem_counts(cache = tempdir())
  })
  expect_length(out, 0)
  expect_length(list.files(tempdir(), pattern = 'osemcache\\..*\\.rds'), 1)

  osem_clear_cache()
  expect_length(list.files(tempdir(), pattern = 'osemcache\\..*\\.rds'), 0)
})
