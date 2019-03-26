library(simPop)


### Name: simRelation
### Title: Simulate categorical variables of population data
### Aliases: simRelation
### Keywords: datagen

### ** Examples


data(ghanaS) # load sample data
samp <- specifyInput(data=ghanaS, hhid="hhid", strata="region", weight="weight")
ghanaP <- simStructure(data=samp, method="direct", basicHHvars=c("age", "sex", "relate"))
class(ghanaP)

## Not run: 
##D ## long computation time ... 
##D ghanaP <- simRelation(simPopObj=ghanaP, relation="relate", head="head")
##D str(ghanaP)
## End(Not run)




