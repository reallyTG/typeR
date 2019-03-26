library(hierfstat)


### Name: crocrussula
### Title: Genotypes and sex of 140 shrews Crocidura russula
### Aliases: crocrussula
### Keywords: datasets

### ** Examples

data(crocrussula)
aic<-AIc(crocrussula$genot)
boxplot(aic~crocrussula$sex)
sexbias.test(crocrussula$genot,crocrussula$sex)



