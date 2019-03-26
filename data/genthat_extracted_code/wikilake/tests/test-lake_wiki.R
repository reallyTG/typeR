context("lake_wiki")

test_that("lake_wiki works", {
  skip_on_cran()
  skip_on_travis()

  expect_false(is.na(lake_wiki("Lake Mendota")$`Max. depth`))
  expect_false(is.na(lake_wiki("Trout Lake (Wisconsin)")$`Max. depth`))

  # Lake pages with multiple info boxes
  expect_false(is.na(lake_wiki("Acton Lake")$`Surface area`))

})

test_that("simple redirects work", {
  skip_on_cran()
  skip_on_travis()

  expect_false(is.na(lake_wiki("Lake George (Michigan-Ontario)")$Name))
})

# test_that("lake_wiki fails well", {
#   skip_on_cran()
#   skip_on_travis()
#
#   expect_error(lake_wiki("Lake Bamboozle"), NA)
#
# })
