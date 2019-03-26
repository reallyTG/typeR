library(cccrm)


### Name: cccUst
### Title: Repeated Measures Concordance Correlation Coefficient estimated
###   by U-statistics
### Aliases: cccUst

### ** Examples

# Non-longitudinal scenario
data(bpres)
newdat=bpres[bpres$NM==1,]
estccc=cccUst(newdat,"DIA","METODE")
estccc

# Longitudinal scenario
data(bdaw)
estccc=cccUst(bdaw,"AUC","MET","VNUM")
estccc

# Weighted CCC
data(bfat)
estccc=cccUst(bfat,"BF","MET","VISITNO",Dmat=diag(c(2,1,1)))
estccc



