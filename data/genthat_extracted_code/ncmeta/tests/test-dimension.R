context("dimension")

f <- system.file("extdata", "S2008001.L3m_DAY_CHL_chlor_a_9km.nc", package = "ncmeta")
test_that("file specific dimension inquiry works", {
  
  dim0 <- nc_dim(f, 0) %>% expect_s3_class("tbl_df")
  expect_that(nrow(dim0), equals(1L))
  expect_that(dim0$id, equals(0))
  expect_that(dim0$name, equals("lat"))
  expect_that(dim0$length, equals(2160))  ## double
  expect_that(dim0$unlim, equals(FALSE))

  #  expect_that(unlist(lapply(dim0, typeof)), 
  #            equals(structure(c("integer", "character", "double", "logical"), .Names = c("id", 
                                                                                                           #            "name", "length", "unlim"))))
  
})

test_that("file all dimensions inquiry works", {
  dimension <- nc_dims(f) %>% expect_s3_class("tbl_df")
  expect_that(nrow(dimension), equals(4L))
  expect_that(dimension$id, equals(0:3))
  expect_that(dimension$name, equals(c("lat", "lon", "rgb", "eightbitcolor")))
  expect_that(dimension$length, equals(c(2160, 4320, 3, 256)))  ## double
  expect_false(any(dimension$unlim))
  #expect_that(unlist(lapply(dimension, typeof)), 
  #            equals(structure(c("integer", "character", "double", "logical"), 
  #            .Names = c("id","name", "length", "unlim"))))
})


