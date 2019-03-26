library(BVS)


### Name: summaryBVS
### Title: Calculates Posterior Summaries for BVS Methods
### Aliases: summaryBVS
### Keywords: Posterior Summaries

### ** Examples

## RARE VARIANT BRI EXAMPLE
  ## Load the data for Rare variant example
  data(RareData)

  ## Load the results from running sampleBVS on rare variant data for 100K iterations
  data(RareBVS.out)

  ## Summarize output with a burn in of 1000 iterations
  ## Results from summary found in data(RareResults)
  RareResults = summaryBVS(RareBVS.out,data=RareData,burnin=1000,rare=TRUE)

## INFORMATIVE iBMU EXAMPLE
  ##Load the data for the informative example
  data(InformData)

  ## Load the results from running sampleBVS with inform=FALSE for 100K iterations
  data(InformBVS.NI.out)

  ## Summarize output
  ## Results from summary found in data(Informresults.NI)
  
  Informresults.NI = summaryBVS(InformBVS.NI.out,data=InformData$data,burnin=1000,
                                regions=InformData$genes,inform=FALSE)

  ## Load the results from running sampleBVS with inform=TRUE for 100K iterations
  data(InformBVS.I.out)

  ## Summarize output
  ## Results from summary found in data(Informresults.I)
 
  Informresults.I = summaryBVS(InformBVS.I.out,data=InformData$data,
                               cov=as.matrix(InformData$cov),burnin=1000,
                               regions=InformData$genes,inform=TRUE)




