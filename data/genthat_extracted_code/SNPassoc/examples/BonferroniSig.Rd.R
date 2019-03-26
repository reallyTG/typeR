library(SNPassoc)


### Name: Bonferroni.sig
### Title: Bonferroni correction of p values
### Aliases: Bonferroni.sig
### Keywords: utilities

### ** Examples

data(SNPs)
datSNP<-setupSNP(SNPs,6:40,sep="")
ans<-WGassociation(protein~1,data=datSNP,model="all")
Bonferroni.sig(ans, model="codominant", alpha=0.05, include.all.SNPs=FALSE)




