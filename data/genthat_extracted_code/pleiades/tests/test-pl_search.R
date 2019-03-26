context("pl_search")

test_that("pl_search works", {
  skip_on_cran()

  aa <- pl_search()
  bb <- pl_search_loc()
  cc <- pl_search_names()
  dd <- pl_search_places()

  expect_is(aa, 'list')
  expect_is(aa[[1]], 'tbl')
  expect_equal(length(aa), 3)

  expect_is(bb, 'tbl')
  expect_is(cc, 'tbl')
  expect_is(dd, 'tbl')
})


test_that("pl_search fails well", {
  skip_on_cran()

  expect_error(pl_search(5), "is.character\\(x\\) is not TRUE")
  expect_error(pl_search(mtcars), "is.character\\(x\\) is not TRUE")
  expect_error(pl_search_loc(5), "is.character\\(x\\) is not TRUE")
  expect_error(pl_search_names(5), "is.character\\(x\\) is not TRUE")
  expect_error(pl_search_places(5), "is.character\\(x\\) is not TRUE")
})
