library(UBL)


### Name: ImpSampClassif
### Title: Importance Sampling algorithm for imbalanced classification
###   problems
### Aliases: ImpSampClassif
### Keywords: pre-processing classification

### ** Examples

  data(iris)
  # generating an artificially imbalanced data set
  ir <- iris[-c(51:70,111:150), ]
  IS.ext <-ImpSampClassif(Species~., ir, C.perc = "extreme")
  IS.bal <-ImpSampClassif(Species~., ir, C.perc = "balance")
  myIS <-ImpSampClassif(Species~., ir, C.perc = list(setosa = 0.2,
                                                    versicolor = 2,
                                                    virginica = 6))
  # check the results
  table(ir$Species)
  table(IS.ext$Species)
  table(IS.bal$Species)
  table(myIS$Species)



