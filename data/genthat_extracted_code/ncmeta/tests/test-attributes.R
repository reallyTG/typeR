context("attributes")
f <- system.file("extdata", "S2008001.L3m_DAY_CHL_chlor_a_9km.nc", package = "ncmeta")
u <- "https://upwell.pfeg.noaa.gov/erddap/tabledap/FRDCPSTrawlLHHaulCatch"

test_that("attributes works", {
  testthat::skip_on_cran()
  met <- nc_meta(f)
  da <- nc_atts(f) %>% expect_s3_class("tbl_df") %>% 
    expect_named(c("attribute", "variable", "value")) 
  expect_that(nrow(da), equals(87L))
  expect_that(da$value, is_a("list"))
 })
test_that("attributes from Thredds works", {
  context("avoiding thredds tests for RNetCDF")
  skip_on_cran()
  skip_on_travis()
  
    du <- nc_atts(u) %>%  expect_s3_class("tbl_df") %>% 
    expect_named(c("attribute", "variable", "value"))
  expect_that(nrow(du), equals(119L))
  expect_that(du$value, is_a("list"))
  
  })

test_that("individual attribute inquiry works", {
  testthat::skip_on_cran()
  
  nc_att(f, 0, 0) %>% expect_s3_class("tbl_df") %>% 
    expect_named(c("attribute", "variable", "value")) 
  a3 <- nc_att(f, 0, 3)  
  expect_that(a3$attribute, equals(3.0))
  expect_that(a3$value, equals(list(-32767)))
})

l3binfile <- system.file("extdata", "S2008001.L3b_DAY_CHL.nc", package = "ncmeta")

test_that("failure is graceful", {
  expect_warning(abin <- nc_atts(l3binfile), "no variables recognizable")
  
  abin %>%  expect_s3_class("tbl_df") %>% 
    expect_named(c("id", "name", "type", "ndims", "dimids", "natts")) 
  expect_that(nrow(abin), equals(1L))
  expect_that(abin$name, equals("NC_GLOBAL"))
  expect_that(abin$id, equals(-1))
  expect_true(all(is.na(c(abin$dimids, abin$ndims))))
  expect_that(abin$natts, equals(49))
})

