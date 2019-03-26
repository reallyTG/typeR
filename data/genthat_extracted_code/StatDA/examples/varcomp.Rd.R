library(StatDA)


### Name: varcomp
### Title: Variance Components
### Aliases: varcomp
### Keywords: univar

### ** Examples

# field duplicates:
data(CHorFieldDUP)
xfield1=CHorFieldDUP[,5:98]
xfield2=CHorFieldDUP[,99:192]

# anaytical duplicates:
data(CHorANADUP)
xanal1=CHorANADUP[,3:96]
xanal2=CHorANADUP[,97:190]

varcomp(xanal1[,1],xanal2[,1],xfield1[,1],xfield2[,1])



