library(VIGoR)


### Name: Pheno
### Title: An example of Pheno objects
### Aliases: Pheno
### Keywords: datasets

### ** Examples

data(sampledata)
dim(Pheno)#100 samples and 3 traits
any(is.na(Pheno))#TRUE. Pheno includes missing records
which(is.na(Pheno$Weight))#5. The fifth sample lacks the Weight record.



