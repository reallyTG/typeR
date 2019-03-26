context("file")

f <- system.file("extdata", "S2008001.L3m_DAY_CHL_chlor_a_9km.nc", package = "ncmeta")

#inq_structure <- structure(c("integer", "integer", "integer", "integer", "character"
#), .Names = c("ndims", "nvars", "ngatts", "unlimdimid", "filename"
#))

test_that("file inquiry works", {
  inq <- nc_inq(f) %>% expect_s3_class("tbl_df")
  expect_that(nrow(inq), equals(1L))
  expect_that(inq$ndims, equals(4L))
  expect_that(inq$nvars, equals(4L))
  expect_that(inq$ngatts, equals( 65L))
  expect_true(is.na(inq$unlimdimid))
 # expect_that(unlist(lapply(inq, typeof)), 
#              equals(inq_structure))
  
  })

test_that("multiple file inquiry works", {
  inqfiles <- nc_inq(c(f, f)) %>% expect_s3_class("tbl_df")
  expect_that(nrow(inqfiles), equals(2L))
  expect_that(unique(inqfiles$ndims), equals(4L))
  expect_that(unique(inqfiles$nvars), equals(4L))
  expect_that(unique(inqfiles$ngatts), equals( 65L))
  expect_true(is.na(unique(inqfiles$unlimdimid)))
 # expect_that(unlist(lapply(inqfiles, typeof)), 
#              equals(inq_structure))
  
})

test_that("thredds access works", {
  skip_on_cran()
  
  u <- "https://upwell.pfeg.noaa.gov/erddap/tabledap/FRDCPSTrawlLHHaulCatch"
  thredds <- nc_inq(u) %>% expect_s3_class("tbl_df")
  expect_that(nrow(thredds), equals(1L))
  
})



