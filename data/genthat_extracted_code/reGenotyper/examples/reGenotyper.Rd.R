library(reGenotyper)


### Name: reGenotyper
### Title: Detecting mislabeled samples, recovering the optimal genotypes
###   for genetical genomics experiments
### Aliases: reGenotyper
### Keywords: method

### ** Examples

  library(reGenotyper)
  #load example genotype and phenotype data
  data(genotype)
  data(phenotype)
  ### For this test dataset 5 permutations is enough. In real case at least few hundreds 
  ### of permutations are needed.
  wlsObject <- reGenotyper(phenotype, genotype, fileName = "test", thres = 0.9, optGT = TRUE, 
  optGTplot = FALSE,   optGT.thres = 0,  permu = TRUE, n.permu = 5, wls.score.permu = NULL, 
  process = TRUE, t.thres = 1.5, GT.ref=NULL)
  ###Inspecting the output
  wlsObject
  plot(wlsObject)
  ### previous line takes around 30s to execute, you can also load the result:
  data(wlsObject)



