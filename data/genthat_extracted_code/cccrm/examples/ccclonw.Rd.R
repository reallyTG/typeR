library(cccrm)


### Name: ccclonw
### Title: Weighted Concordance Correlation Coefficient for longitudinal
###   repeated measures estimated by variance components
### Aliases: ccclonw

### ** Examples

data(bfat)
estccc<-ccclonw(bfat,"BF","SUBJECT","VISITNO","MET",vecD=c(2,1,1))
estccc
summary(estccc)



