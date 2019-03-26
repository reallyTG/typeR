library(Umpire)


### Name: CancerModel-class
### Title: The "CancerModel" Class
### Aliases: CancerModel-class CancerModel ncol,CancerModel-method
###   nrow,CancerModel-method rand,CancerModel-method
###   summary,CancerModel-method nPatterns nPossibleHits nHitsPerPattern
###   survivalCoefficients outcomeCoefficients
### Keywords: classes datagen

### ** Examples

showClass("CancerModel")
set.seed(391629)
# set up survival outcome; baseline is exponential
sm <- SurvivalModel(baseHazard=1/5, accrual=5, followUp=1)
# now build a CancerModel with 6 subtypes
cm <- CancerModel(name="cansim",
                  nPossible=20,
                  nPattern=6,
                  OUT = function(n) rnorm(n, 0, 1), 
                  SURV= function(n) rnorm(n, 0, 1),
                  survivalModel=sm)
# simulate 100 patients
clinical <- rand(cm, 100)
summary(clinical)



