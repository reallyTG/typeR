library(RFGLS)


### Name: pheno
### Title: Simulated quantitative-trait dataset
### Aliases: pheno
### Keywords: datasets

### ** Examples

data(pheno)
str(pheno)
qqnorm(pheno$Zscore[pheno$INDIV==1]) ##<--Normally distributed phenotype.
qqline(pheno$Zscore[pheno$INDIV==1])
##Also see examples for functions fgls(), gls.batch(), and gls.batch.get().



