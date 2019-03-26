context('Check update_theme')


# Define custom theme -----------------------------------------------------
theme_xp_custom <- theme_xp_default()
theme_xp_custom$point_color <- 'green'
theme_xp_custom <- as.xpose.theme(theme_xp_custom)


# Tests start here --------------------------------------------------------

test_that('returns error on missing xpdb', {
  expect_error(update_themes())
})

test_that('returns identical xpdb if missing themes', {
  expect_identical(update_themes(xpdb = xpdb_ex_pk), xpdb_ex_pk)
})

test_that('full gg_themes are properly added', {
  expect_equivalent(update_themes(xpdb = xpdb_ex_pk, 
                                 gg_theme = theme_bw2())$gg_theme, 
                   theme_bw2())
})

test_that('message returned on bad gg_theme input', {
  expect_message(update_themes(xpdb = xpdb_ex_pk, 
                               gg_theme = theme_xp_default(),
                               quiet = FALSE))
})

test_that('full xp_themes are properly added', {
  expect_equivalent(update_themes(xpdb = xpdb_ex_pk,
                                 xp_theme = theme_xp_xpose4())$xp_theme,
                   theme_xp_xpose4())
})

test_that('parial xp_themes are properly added', {
  expect_equivalent(update_themes(xpdb = xpdb_ex_pk, 
                                  xp_theme = c(point_color = 'green'))$xp_theme,
                    theme_xp_custom)
})

test_that('message on unnamed xp_theme input', {
  expect_message(update_themes(xpdb = xpdb_ex_pk, 
                               xp_theme = c('blue', 'dashed'), 
                               quiet = FALSE))
})
