
test_that("running associations", {

 data(Metabolites)
 data(Transcripts)
  associations <- associateData(Metabolites[,1:2],Transcripts[,c(1:100)],numCores = 2)
  expect_match(class(associations)[1],"associations" )
  associations <- associateData(Metabolites[,1:2],Transcripts[,c(1:100)],numCores = 2)
  expect_equal(nrow(associations),200)
})