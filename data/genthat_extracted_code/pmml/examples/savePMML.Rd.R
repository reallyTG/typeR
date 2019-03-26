library(pmml)


### Name: savePMML
### Title: saves a xml object as an external PMML file.
### Aliases: savePMML
### Keywords: interface

### ** Examples


## Not run: 
##D  # make a sample model
##D  library(gbm)
##D  library(pmml)
##D  data(audit)
##D 
##D  mod<-gbm(Adjusted~.,data=audit[,-c(1,4,6,9,10,11,12)],n.trees=3,interaction.depth=4)
##D  pmod <- pmml(mod)
##D  # Save to an external file 
##D  savePMML(pmod, "GBMModel.pmml")
## End(Not run)




