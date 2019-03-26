
test_that("plotting associations", {
  data(Metabolites)
  data(Transcripts)

  associations <- associateData(Metabolites[,1:2],Transcripts[,c(1:100)],numCores = 2)
  #if you only define feature1 or feature2 if will plot all associations
  p <- plot(associations,Metabolites,Transcripts,feature1=1,withShift = TRUE)
  
  expect_match(class(p)[1],"gg" )
  
  #if you define feature1 and feature2 it will only plot these two profiles
  p <- plot(associations,Metabolites,Transcripts,feature1="Metabolite 1",feature2="Transcript 2")
  expect_match(class(p)[1],"gg" )
})