library(PANICr)

context("Check output for panic 04 and 10")

test_that("Panic 04 consistency", {

  load(system.file("test_data","test_04.RData",package = "PANICr"))
  load(system.file("test_data","test_dat.Rdata",package = "PANICr"))
  
  set.seed(1234)
  expect_equal(panic04(test1,
                       nfac = 10L,
                       k1 = 7,
                       criteria = "IC1"),
               test_04,
               tolerance = .003)
})

test_that("Panic 10 demeaned consistency", {
  set.seed(1234)
  load(system.file("test_data","test_10_dm.RData",package = "PANICr"))
  load(system.file("test_data","test_dat.Rdata",package = "PANICr"))
  
  set.seed(1234)
  expect_equal(panic10(test1,
                       nfac = 10L,
                       k1 = 7,
                       criteria = "IC1",
                       demean = TRUE),
               test_10_dm,
               tolerance = .003)
})

test_that("Panic 10 non-demeaned consistency", {
  set.seed(1234)
  load(system.file("test_data","test_10_ndm.RData",package = "PANICr"))
  load(system.file("test_data","test_dat.Rdata",package = "PANICr"))
  
  set.seed(1234)
  expect_equal(panic10(test1,
                       nfac = 10L,
                       k1 = 7,
                       criteria = "IC1",
                       demean = FALSE),
               test_10_ndm,
               tolerance = .003)
})