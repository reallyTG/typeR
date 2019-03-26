context('Check xpose_geoms')

# Tests start here --------------------------------------------------------

test_that('parse_arg works properly', {
  expect_null(parse_arg(x = NULL, name = 'point'))
  expect_equal(parse_arg(x = c(point_color = 'blue', line_color = 'red'), name = 'point'), 
               c(colour = 'blue'))
})

test_that('update_args works properly', {
  expect_equal(update_args(thm_arg = filter_xp_theme(xpdb_ex_pk$xp_theme, 'point_'), 
                           name = 'point', point_color = 'red'),
               list(alpha = 0.7, colour = 'red', fill = NA, shape = 19, size = 2.5, stroke = 0))
})

test_that('xp_map works properly', {
  expect_equal(xp_map(arg = list(color = 'red'), mapping = aes_string(x = 'IPRED'), ggfun = 'geom_point'),
               geom_point(mapping = aes_string(x = 'IPRED') , color = 'red'))
})

test_that('xp_geoms works properly', {
 expect_equal(xp_geoms(mapping = aes_string(point_color = 'IPRED'), xpdb_ex_pk$xp_theme, name = 'point', 
                       ggfun = 'geom_point', point_size = 3),
              geom_point(mapping = aes_string(color = 'IPRED') , alpha = 0.7, fill = NA, 
                         shape = 19, size = 3, stroke = 0))
})
