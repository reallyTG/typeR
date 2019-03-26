library(BVS)


### Name: plotBVS
### Title: Image Plots for top Variant and Region Inclusions
### Aliases: plotBVS
### Keywords: image plot

### ** Examples

## RARE VARIANT BRI EXAMPLE
  ## Load the data for Rare variant example
  data(RareData)

  ## Load the results from running sampleBVS on rare variant data for 100K iterations
  data(RareBVS.out)

  ## Load summary results 
  data(RareResults)
  
  ## Plot the variant inclusions in the top 100 models for the top 10 variants 
  plotBVS(RareResults,num.models=100,num.snps=10)

  ##Include the estimated log(OR) of the risk indices for the top models
  plotBVS(RareResults,num.models=100,num.snps=10,plot.coef=TRUE)

## No test: 
## INFORMATIVE iBMU EXAMPLE
  ##Load the data for the informative example
  data(InformData)

  ## Load the results from running sampleBVS with inform=FALSE for 100K iteration
  data(InformBVS.NI.out)

  ## Load summary results
  data(Informresults.NI)

  ## Make SNP and Gene inclusion plots
  plotBVS(Informresults.NI,num.models=50,num.snps=10,regions=InformData$genes)
  plotBVS(Informresults.NI,num.models=50,num.regions=10,regions=InformData$genes,type="r")

  ## Load the results from running sampleBVS with inform=TRUE for 100K iterations
  data(InformBVS.I.out)

  ## load summary results
  data(Informresults.I)

  ## Make SNP and Gene inclusion plots
  plotBVS(Informresults.I,num.models=50,num.snps=10,regions=InformData$genes)
  plotBVS(Informresults.I,num.models=50,num.regions=10,regions=InformData$genes,type="r")
## End(No test)





