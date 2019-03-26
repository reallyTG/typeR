context('Check theme objects')

# Tests start here --------------------------------------------------------

test_that('gg_themes objects were properly created', {
  # Proper object class
  expect_true(is.theme(theme_readable()))
  expect_true(is.theme(theme_bw2()))
})

test_that('xp_themes objects were properly created', {
  # Proper object type
  expect_true(is.list(theme_xp_default()))
  expect_true(is.list(theme_xp_xpose4()))
  
  # Proper object attributes
  expect_true(inherits(theme_xp_default(), 'xpose_theme'))
  expect_true(inherits(theme_xp_xpose4(), 'xpose_theme'))
})
