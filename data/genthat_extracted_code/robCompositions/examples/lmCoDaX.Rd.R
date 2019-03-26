library(robCompositions)


### Name: lmCoDaX
### Title: Classical and robust regression of non-compositional response on
###   compositional predictors
### Aliases: lmCoDaX ilrregression robilrregression
### Keywords: models

### ** Examples


## How the total household expenditures in EU Member
## States depend on relative contributions of 
## single household expenditures:
data(expendituresEU)
y <- as.numeric(apply(expendituresEU,1,sum))
lmCoDaX(y, expendituresEU, method="classical")
lmCoDaX(y, expendituresEU, method="robust")



