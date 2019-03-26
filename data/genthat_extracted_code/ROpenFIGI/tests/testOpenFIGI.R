
library(ROpenFIGI)
library(dplyr)
jsondf <- sampleOpenFIGIdf()

jsonrst <- OpenFIGI(jsondf)

test_that('number of returned json list', {
  expect_equal(length(jsonrst), 2L )
  expect_equal(names(jsonrst[[1L]]), c('figi','securityType','marketSector','ticker','name','uniqueID','exchCode','shareClassFIGI','compositeFIGI','uniqueIDFutOpt') )
})

finalrst <- OpenFIGI_MappingCreator(jsondf)

test_that('number of returned json list', {
  expect_equal(ncol(finalrst), 30L )
  expect_equal(finalrst$ID_ISIN[1L], "US4592001014" )
})
