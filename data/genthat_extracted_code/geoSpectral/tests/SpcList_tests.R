library(geoSpectral)
library(testthat)
sptest = spc.example_spectra()
test_that("SpcLists are created properly", {
  expect_equal(SpcList(list(sptest,sptest^2)), as(list(sptest,sptest^2), "SpcList"))
})
spctest = spc.makeSpcList(sptest, "CAST")
test_that("Names function returns correct number of names", {
  expect_true(all(names(spctest)==unique(sptest$CAST)))
})
headertest <- spc.makeSpcList(sptest, "STATION")
a = new("SpcHeader")
a$Longitude = 123
a$Station = 5
spc.setheader(headertest[[1]]) <- a
test_that("spc.getheader() gets correct headers", {
  expect_is(spc.getheader(headertest[1], "Station"), "numeric")
  expect_equal(spc.getheader(headertest[[1]], "Station"), 5)
})

headertest <- spc.updateheader(headertest, "Station", 11)
header = spc.getheader(headertest, "Station")
test_that("spc.updateheader() funciton updates header", {
  expect_is(spc.getheader(headertest, "Station"), "numeric")
  expect_equal(header[1], 11)
})

BL= spc.makeSpcList(sptest, "CAST")
sphead = spc.data2header(BL, "CAST")
sphead2 = spc.data2header(BL, "CAST", "ProjectCast")
test_that("spc.data2header() functions correctly", {
  expect_equal(sphead[[1]]@header$CAST, spctest[[1]]@data$CAST)
  expect_equal(sphead2[[1]]@header$ProjectCast, spctest[[1]]@data$CAST)
})

sptestdata = spctest
sptestdata = spc.updateheader(sptestdata, "Zone", "ZoneA")
sptestdata = spc.header2data(sptestdata, "Zone")
test_that("spc.header2data() sets fields correctly", {
  expect_equal(sptestdata[[1]]@data$Zone, sptestdata[[1]]$Zone)
})

