library(cccrm)


### Name: cccvc
### Title: Concordance Correlation Coefficient estimated by Variance
###   Components
### Aliases: cccvc

### ** Examples

data(bpres)

# Scenario 1. 
#Only 1 measure by subject and method. 
#No subject-method interaction included in the model.

newdat=bpres[bpres$NM==1,]
estccc=cccvc(newdat,"DIA","ID","METODE")
estccc
summary(estccc)

# Scenario 2. 
#Two measures by subject and method. 
#No subject-method interaction included in the model.

estccc=cccvc(bpres,"DIA","ID","METODE")
estccc
summary(estccc)




