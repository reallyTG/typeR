library(GSMX)


### Name: gsm
### Title: Esimate genetic variance-covariances and calculate heritability
###   and predictability using cross validation
### Aliases: gsm
### Keywords: Multivariate Genomic Selection Overfitting Cross Validation

### ** Examples

library(GSMX)
data(pseudo.kin)
data(pseudo.data)
myfit=gsm(pseudo.data, pseudo.kin, nfold=5)



