library(UBL)


### Name: CNNClassif
### Title: Condensed Nearest Neighbors strategy for multiclass imbalanced
###   problems
### Aliases: CNNClassif
### Keywords: pre-processing classification

### ** Examples

  library(DMwR)
  data(algae)
  clean.algae <- algae[complete.cases(algae), ]
  myCNN <- CNNClassif(season~., clean.algae, 
                      Cl = c("summer", "spring", "winter"),
                      dist = "HEOM")
  CNN1 <- CNNClassif(season~., clean.algae, Cl = "smaller", dist = "HEOM")
  CNN2<- CNNClassif(season~., clean.algae, Cl = "summer",dist = "HVDM")
  summary(myCNN[[1]]$season)
  summary(CNN1[[1]]$season)
  summary(CNN2[[1]]$season)
  
  
  library(MASS)
  data(cats)
  CNN.catsF <- CNNClassif(Sex~., cats, Cl = "F")
  CNN.cats <- CNNClassif(Sex~., cats, Cl = "smaller")



