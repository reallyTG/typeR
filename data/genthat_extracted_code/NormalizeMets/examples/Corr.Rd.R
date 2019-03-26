library(NormalizeMets)


### Name: Corr
### Title: Computes correlation matrix for a metabolomics dataset or
###   compares the correlation between two metabolomics datasets
### Aliases: Corr

### ** Examples

data("featuredata_roots")
featuredata_roots[featuredata_roots==0]<-NA
imp_data<-MissingValues(LogTransform(featuredata_roots)$featuredata)$featuredata
Corr( imp_data[c(1:17),], imp_data[c(18:37),])
Corr( imp_data[c(1:17),])




