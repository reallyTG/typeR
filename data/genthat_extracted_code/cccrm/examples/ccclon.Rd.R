library(cccrm)


### Name: ccclon
### Title: Concordance Correlation Coefficient for longitudinal repeated
###   measures estimated by variance components
### Aliases: ccclon

### ** Examples

data(bdaw)
estccc<-ccclon(bdaw,"AUC","SUBJ","VNUM","MET")
estccc
summary(estccc)




