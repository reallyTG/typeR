context("vars")
f <- system.file("extdata", "S2008001.L3m_DAY_CHL_chlor_a_9km.nc", package = "ncmeta")

test_that("vars works", {
  v <- nc_vars(f)
  v %>% expect_s3_class("tbl_df") %>% expect_named(c("id", "name", "type", "ndims", "natts"))
  expect_that(v$id, equals(0:3))
  expect_that(v$name, equals(c("chlor_a", "lat", "lon", "palette")))
  ## 2018-02-09
  ## this test depends on the env, e.g. UNKNOWN on Windows and Mac, UC_BYTE on Ubuntu
  ## must be RNetCDF version?
#  expect_that(v$type, equals(c("NC_FLOAT", "NC_FLOAT", "NC_FLOAT", "NC_UBYTE")))
expect_that(v$ndims, equals(c(2, 1, 1, 2)))
expect_that(v$natts, equals(c(12, 5, 5, 0)))
})


test_that('grids works', {
  g <- nc_grids(f)
  s <- nc_sources(f)
  v <- nc_var(f, 1)
  g %>% expect_s3_class("tbl_df") %>% expect_named(c("variable", "grid"))
  s %>% expect_s3_class("tbl_df") %>% expect_named(c("access", "source"))
  v %>% expect_s3_class("tbl_df") %>% expect_named(c("id", "name", "type", "ndims", "natts"))
  expect_that(g[["variable"]], equals(c("chlor_a", "palette", "lat", "lon")))
})