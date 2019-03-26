library(UBL)


### Name: ImpSampRegress
### Title: Importance Sampling algorithm for imbalanced regression problems
### Aliases: ImpSampRegress
### Keywords: pre-processing regression

### ** Examples

  library(DMwR)
  data(algae)
  clean.algae <- algae[complete.cases(algae), ]
  # defining a threshold on the relevance
  IS.ext <-ImpSampRegress(a7~., clean.algae, rel = "auto", 
                          thr.rel = 0.7, C.perc = "extreme")
  IS.bal <-ImpSampRegress(a7~., clean.algae, rel = "auto", thr.rel = 0.7,
                          C.perc = "balance")
  myIS <-ImpSampRegress(a7~., clean.algae, rel = "auto", thr.rel = 0.7,
                        C.perc = list(0.2, 6))
  # neither threshold nor C.perc defined
  IS.auto <- ImpSampRegress(a7~., clean.algae, rel = "auto")




