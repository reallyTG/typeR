source('testhelpers.R')
context('phenomena')

try({
  boxes = osem_boxes()
  all_phen = unique(unlist(boxes$phenomena))
})

test_that('phenomena from boxes is a list of counts', {
  check_api()

  phenomena = osem_phenomena(boxes)

  expect_true(is.numeric(unlist(phenomena)))
  expect_true(is.list(phenomena))
})

test_that('phenomena from boxes has all phenomena', {
  check_api()

  phenomena = osem_phenomena(boxes)

  expect_true(all(all_phen %in% names(phenomena)))
  expect_true(all(names(phenomena) %in% all_phen))
})

test_that('phenomena from a not sensebox data.frame returns error', {
  expect_error(osem_phenomena(list()), 'no applicable method')
  expect_error(osem_phenomena(data.frame()), 'no applicable method')
  boxes_df = boxes
  class(boxes_df) = c('data.frame')
  expect_error(osem_phenomena(boxes_df), 'no applicable method')
})
