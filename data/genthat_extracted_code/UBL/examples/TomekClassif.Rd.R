library(UBL)


### Name: TomekClassif
### Title: Tomek links for imbalanced classification problems
### Aliases: TomekClassif
### Keywords: pre-processing classification

### ** Examples

  library(DMwR)
  data(algae)
  clean.algae <- algae[complete.cases(algae), ]
  alg.HVDM1 <- TomekClassif(season~., clean.algae, dist = "HVDM", 
                            Cl = c("winter", "spring"), rem = "both")
  alg.HVDM2 <- TomekClassif(season~., clean.algae, dist = "HVDM", rem = "maj")
  
  # removes only examples from class summer which are the 
  # majority class in the link
  alg.EuM <- TomekClassif(season~., clean.algae, dist = "HEOM", 
                          Cl = "summer", rem = "maj")
  
  # removes only examples from class summer in every link they appear
  alg.EuB <- TomekClassif(season~., clean.algae, dist = "HEOM",
                          Cl = "summer", rem = "both")
                          
  summary(clean.algae$season)
  summary(alg.HVDM1[[1]]$season)
  summary(alg.HVDM2[[1]]$season)
  summary(alg.EuM[[1]]$season)
  summary(alg.EuB[[1]]$season)
  
  # check which were the indexes of the examples removed in alg.EuM
  alg.EuM[[2]]



