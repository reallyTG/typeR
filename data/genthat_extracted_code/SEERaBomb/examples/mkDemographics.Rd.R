library(SEERaBomb)


### Name: mkDemographics
### Title: Make Demographics Tables
### Aliases: mkDemographics
### Keywords: IO

### ** Examples

## Not run: 
##D library(SEERaBomb)
##D rm(list=ls())
##D load("~/data/SEER/mrgd/cancDef.RData")
##D canc$year=cut(canc$yrdx,c(1973,2003,2009,2015),include.lowest = T,dig.lab=4)
##D canc$age=cut(canc$agedx,c(0,40,50,60,70,80,90,126),include.lowest = T)
##D canc=canc%>%filter(surv<9999)
##D canc=canc%>%select(-age86,-radiatn,-chemo,-db,-casenum,-modx,-seqnum,-yrbrth,-ICD9,-reg,-histo3)
##D canc=canc%>%filter(cancer%in%c("AML","MDS","MPN"))
##D head(canc,3)
##D mkDemographics(canc)
## End(Not run)



