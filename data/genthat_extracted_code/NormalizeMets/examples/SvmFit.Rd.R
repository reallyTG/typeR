library(NormalizeMets)


### Name: SvmFit
### Title: support vector machine
### Aliases: SvmFit

### ** Examples

 data(alldataC)
SvmFit(featuredata=alldataC$featuredataC, 
       groupdata=alldataC$groupdataC,
       crossvalid=TRUE,
       k=5,
       rocplot = TRUE)




