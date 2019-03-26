library(phybreak)
context("phybreakdata")

test_that("phybreakdata accepts all sequence classes", {
  testdatamatrix <- matrix(c(rep("a", 11), rep("c", 3), rep("g", 6)), nrow = 4)
  testdataDNAbin <- ape::as.DNAbin(testdatamatrix)
  testdataphyDat <- phangorn::as.phyDat(testdatamatrix)

  expect_is(phybreakdata(testdatamatrix, rep(0, 4))$sequences, "phyDat")
  expect_is(phybreakdata(testdataDNAbin, rep(0, 4))$sequences, "phyDat")
  expect_is(phybreakdata(testdataphyDat, rep(0, 4))$sequences, "phyDat")
  
  expect_equivalent(phybreakdata(testdatamatrix, rep(0, 4))$sequences, testdataphyDat)
  expect_equivalent(phybreakdata(testdataDNAbin, rep(0, 4))$sequences, testdataphyDat)
  expect_equivalent(phybreakdata(testdataphyDat, rep(0, 4))$sequences, testdataphyDat)
})


test_that("phybreakdata accepts Date and numeric classes", {
  testdatamatrix <- matrix(c(rep("a", 11), rep("c", 3), rep("g", 6)), nrow = 4)
  testtimesinteger <- 1:4
  testtimesnumeric <- c(1, 2, 3, 4)
  testtimesDate <- as.Date(testtimesnumeric, "2000-01-01")
  testtimeschar <- as.character(testtimesDate)

  expect_is(phybreakdata(testdatamatrix, testtimesinteger)$sample.times, "integer")
  expect_is(phybreakdata(testdatamatrix, testtimesnumeric)$sample.times, "numeric")
  expect_is(phybreakdata(testdatamatrix, testtimesDate)$sample.times, "Date")
  expect_error(phybreakdata(testdatamatrix, testtimeschar))
  
  expect_equivalent(phybreakdata(testdatamatrix, testtimesinteger)$sample.times, testtimesinteger)
  expect_equivalent(phybreakdata(testdatamatrix, testtimesnumeric)$sample.times, testtimesnumeric)
  expect_equivalent(phybreakdata(testdatamatrix, testtimesDate)$sample.times, testtimesDate)
})

test_that("data are correctly sorted by sampling time", {
  testdatamatrix <- matrix(c(rep("a", 11), rep("c", 3), rep("g", 6)), nrow = 4)
  testdataphyDat <- phangorn::as.phyDat(testdatamatrix)
  testtimesnumeric <- c(1, 2, 3, 4)

  expect_equivalent(phybreakdata(testdatamatrix, testtimesnumeric[c(1,3,2,4)])$sample.times, testtimesnumeric)
  expect_equivalent(phybreakdata(testdatamatrix, testtimesnumeric[c(1,3,2,4)])$sequences, testdataphyDat[c(1,3,2,4)])
  
  row.names(testdatamatrix) <- LETTERS[testtimesnumeric]
  names(testtimesnumeric) <- LETTERS[testtimesnumeric]
  expect_equal(phybreakdata(testdatamatrix, testtimesnumeric[c(1,3,2,4)])$sample.times, testtimesnumeric)
  expect_equivalent(phybreakdata(testdatamatrix, testtimesnumeric[c(1,3,2,4)])$sequences, testdataphyDat)
})

test_that("host.names are correctly linked to samples", {
  testdatamatrix <- matrix(c(rep("a", 11), rep("c", 3), rep("g", 6)), nrow = 4)
  testtimesnumeric <- c(1, 2, 3, 4)
  row.names(testdatamatrix) <- LETTERS[testtimesnumeric]
  testdataphyDat <- phangorn::as.phyDat(testdatamatrix)
  testhostnames <- letters[c(1, 2, 3, 1)]
  
  expect_equivalent(phybreakdata(testdatamatrix, testtimesnumeric, 
                                 host.names = testhostnames)$sequences, testdataphyDat)
  expect_equivalent(phybreakdata(testdatamatrix, testtimesnumeric, 
                                 host.names = testhostnames)$sample.times, testtimesnumeric)
  expect_equivalent(phybreakdata(testdatamatrix, testtimesnumeric, 
                                 host.names = testhostnames)$sample.hosts, testhostnames)
  testhostnames <- letters[c(1, 2, 3, 1)]
  names(testhostnames) <- LETTERS[testtimesnumeric]
  expect_equal(phybreakdata(testdatamatrix, testtimesnumeric, 
                                 host.names = testhostnames[c(1, 3, 2, 4)])$sample.hosts, testhostnames)
})

test_that("infection times are handled correctly", {
  testdatamatrix <- matrix(c(rep("a", 11), rep("c", 3), rep("g", 6)), nrow = 4)
  testtimesnumeric <- c(1, 2, 3, 4)
  names(testtimesnumeric) <- LETTERS[testtimesnumeric]
  testtimesDate <- as.Date(testtimesnumeric, "2000-01-01")
  testinftimesnumeric <- c(1, 0, 2, 3)
  names(testinftimesnumeric) <- LETTERS[1 + testinftimesnumeric]
  
  expect_error(phybreakdata(testdatamatrix, testtimesDate, sim.infection.times = testinftimesnumeric))
  expect_equal(phybreakdata(testdatamatrix, testtimesnumeric, 
                            sim.infection.times = testinftimesnumeric)$sample.times, testtimesnumeric)
  expect_equal(phybreakdata(testdatamatrix, testtimesnumeric, 
                            sim.infection.times = testinftimesnumeric)$sim.infection.times, 
               testinftimesnumeric[names(testtimesnumeric)])
  
  testhostnames <- letters[c(1, 2, 3, 1)]
  names(testinftimesnumeric) <- letters[1 + testinftimesnumeric]
  expect_equivalent(phybreakdata(testdatamatrix, testtimesnumeric, sim.infection.times = testinftimesnumeric[1:3],  
                                 host.names = testhostnames)$sim.infection.times,
                    testinftimesnumeric[c(2, 1, 3)])
})


test_that("infectors are handled correctly", {
  testdatamatrix <- matrix(c(rep("a", 11), rep("c", 3), rep("g", 6)), nrow = 4)
  testtimesnumeric <- c(1, 2, 3, 4)
  names(testtimesnumeric) <- LETTERS[testtimesnumeric]
  testinfectorsnumeric <- c(0, 2, 2, 3)
  names(testinfectorsnumeric) <- LETTERS[c(2, 1, 3, 4)]
  testinfectorsnamed <- c("index", "B", "B", "C")
  names(testinfectorsnamed) <- LETTERS[c(2, 1, 3, 4)]
  testinfectorsnamed0 <- c("0", "B", "B", "C")
  names(testinfectorsnamed0) <- LETTERS[c(2, 1, 3, 4)]
  testinfectorsnamedincorrect <- c("0", "B", "B", "E")
  names(testinfectorsnamedincorrect) <- LETTERS[c(2, 1, 3, 4)]
  
  expect_error(phybreakdata(testdatamatrix, testtimesDate, sim.infectors = testinfectorsnamedincorrect))
  expect_equal(phybreakdata(testdatamatrix, testtimesnumeric, 
                            sim.infectors = testinfectorsnumeric)$sample.times, testtimesnumeric)
  expect_equal(phybreakdata(testdatamatrix, testtimesnumeric, 
                            sim.infectors = testinfectorsnumeric)$sim.infectors, 
               testinfectorsnamed[names(testtimesnumeric)])
  expect_equal(phybreakdata(testdatamatrix, testtimesnumeric, 
                            sim.infectors = testinfectorsnamed)$sim.infectors, 
               testinfectorsnamed[names(testtimesnumeric)])
  expect_equal(phybreakdata(testdatamatrix, testtimesnumeric, 
                            sim.infectors = testinfectorsnamed0)$sim.infectors, 
               testinfectorsnamed[names(testtimesnumeric)])
})



