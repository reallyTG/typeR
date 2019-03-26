library(risksetROC)


### Name: pbc
### Title: Incident/Dynamic (I/D) ROC curve, AUC and integrated AUC (iAUC)
###   estimation of censored survival data
### Aliases: pbc
### Keywords: survival

### ** Examples

library(MASS)
data(VA)
## need to order the data in ascending order of survival time
new.VA=VA[order(VA$stime),]
risket.VA=riskset(new.VA)




