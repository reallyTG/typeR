source('testhelpers.R')

context('osem_box_to_archivename()')

try({
  boxes = osem_boxes(grouptag = 'ifgi')
  box = osem_box('593bcd656ccf3b0011791f5a')
})

test_that('osem_box_to_archive_name does the correct character replacements', {
  b = data.frame(
    name = 'aA1._- äß!"?$%&/',
    X_id = 'UUID'
  )

  archivename = opensensmapr:::osem_box_to_archivename(b)
  expect_equal(archivename, 'UUID-aA1._-__________')
})

test_that('osem_box_to_archive_name works for one box', {
  if (is.null(box)) skip('no box data could be fetched')

  archivename = opensensmapr:::osem_box_to_archivename(box)
  expect_length(archivename, 1)
  expect_type(archivename, 'character')
})

test_that('osem_box_to_archive_name works for multiple boxes', {
  if (is.null(boxes)) skip('no box data available')

  archivename = opensensmapr:::osem_box_to_archivename(boxes)
  expect_length(archivename, nrow(boxes))
  expect_type(archivename, 'character')
})

context('osem_measurements_archive()')

test_that('osem_measurements_archive works for one box', {
  if (is.null(box)) skip('no box data could be fetched')

  m = osem_measurements_archive(box, as.POSIXlt('2018-08-08'))
  expect_length(m, nrow(box$sensors[[1]]) + 1) # one column for each sensor + createdAt
  expect_s3_class(m, c('data.frame'))
})

test_that('osem_measurements_archive fails for multiple boxes', {
  if (is.null(boxes)) skip('no box data available')

  expect_error(
    osem_measurements_archive(boxes, as.POSIXlt('2018-08-08')),
    'this function only works for exactly one senseBox!'
  )
})
