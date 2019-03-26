library(tsDyn)


### Name: selectSETAR
### Title: Automatic selection of SETAR hyper-parameters
### Aliases: selectSETAR selectSetar selectsetar
### Keywords: ts

### ** Examples

llynx <- log10(lynx)
selectSETAR(llynx, m=2)
#Suggested model is the following:
setar(llynx, m=2, thDelay=1, th=3.4)



