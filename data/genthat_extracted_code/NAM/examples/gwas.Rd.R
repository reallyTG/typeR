library(NAM)


### Name: GWAS
### Title: Empirical Bayes Genome Wide Association Mapping
### Aliases: gwas gwas2 gwas3 gwasGE meta3
### Keywords: NAM GWAS BLUP

### ** Examples


data(tpod)
gen=reference(gen)
gwa=gwas2(y=y,gen=gen,fam=fam,chr=chr,fixed=TRUE)
plot(gwa,pch=20,lwd=4)




