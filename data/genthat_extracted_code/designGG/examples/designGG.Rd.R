library(designGG)


### Name: designGG
### Title: Optimal design for genetical genomics experiments
### Aliases: designGG 'design genetical genomics experiment'
### Keywords: method

### ** Examples

  library(designGG)
  #load genotype data
  data(genotype)
  #Example:  single-channel experiment with 2 environmental factors,
  #each with 2 levels, and there will be four samples per condition(nTuple=4).
  optimalDesign <- designGG ( genotype, nSlides=NULL, nTuple=4, nEnvFactors=2,
                        nLevels=c(2,2),Level=list(c(16,24),c(5,10)),  bTwoColorArray=FALSE,
                        initial=NULL, weight=1, region=seq(1,20), optimality="A", 
                        method="SA", nIterations=100, n.search=2, endTemp=1e-10,
                        startTemp=1, maxTempStep=0.9, plotScores=TRUE, 
                        directory=NULL, fileName=NULL, envFactorNames=NULL, 
                        writingProcess=FALSE )
  #Example 2:  dual-channel experiment with 2 environmental factors,
  #each with 2 levels. There are 50 slides available.
  optimalDesign <- designGG ( genotype, nSlides=50, nTuple=NULL, nEnvFactors=2,
                        nLevels=c(2,2),Level=list(c(16,24),c(5,10)),  bTwoColorArray=TRUE,
                        initial=NULL, weight=1, region=seq(1,20), optimality="A", 
                        method="SA", nIterations=100, n.search=2, endTemp=1e-10,
                        startTemp=1, maxTempStep=0.9, plotScores=TRUE, 
                        directory=NULL, fileName=NULL, envFactorNames=NULL, 
                        writingProcess=FALSE )
  #result
  optimalDesign$arrayDesign
  optimalDesign$conditionDesign
  plotAllScores(optimalDesign$plot.obj)
  
  #Use the following commands to see example output tables: 
  data(exampleArrayDesignTable)
  exampleArrayDesignTable
  data(exampleConditionDesignTable)
  exampleConditionDesignTable



