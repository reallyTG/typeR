library(UBL)


### Name: OSSClassif
### Title: One-sided selection strategy for handling multiclass imbalanced
###   problems.
### Aliases: OSSClassif
### Keywords: pre-processing classification

### ** Examples

  ## Not run: 
##D   library(DMwR)
##D   data(algae)
##D   clean.algae <- algae[complete.cases(algae), ]
##D   alg1 <- OSSClassif(season~., clean.algae, dist = "HVDM", 
##D                      Cl = c("spring", "summer"))
##D   alg2 <- OSSClassif(season~., clean.algae, dist = "HEOM", 
##D                      Cl = c("spring", "summer"), start = "Tomek")
##D   alg3 <- OSSClassif(season~., clean.algae, dist = "HVDM", start = "CNN")
##D   alg4 <- OSSClassif(season~., clean.algae, dist = "HVDM", start = "Tomek")
##D   alg5 <- OSSClassif(season~., clean.algae, dist = "HEOM", Cl = "winter")
##D   summary(alg1$season)
##D   summary(alg2$season)
##D   summary(alg3$season)
##D   summary(alg4$season)
##D   summary(alg5$season)
##D   
## End(Not run)



