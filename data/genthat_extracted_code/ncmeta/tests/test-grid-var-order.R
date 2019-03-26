context("test-grid-var-order")


f <- system.file("extdata/stars/reduced.nc", package= "ncmeta")
test_that("variable order by grid is correct", {
  ## descending by ndims, but otherwise native to the source
  vars_sort_by_ndims <- nc_vars(f) %>% dplyr::arrange(desc(ndims)) %>% dplyr::pull(name)
  expect_equal(nc_meta(f)$grid$variable, vars_sort_by_ndims)
  expect_equal(nc_grids(f)$variable, vars_sort_by_ndims)
})
