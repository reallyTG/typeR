library(SNPassoc)


### Name: interactionPval
### Title: Two-dimensional SNP analysis for association studies
### Aliases: interactionPval print.SNPinteraction plot.SNPinteraction
### Keywords: utilities

### ** Examples


data(SNPs)
datSNP<-setupSNP(SNPs,6:40,sep="")

ansCod<-interactionPval(log(protein)~sex,datSNP)
print(ansCod)
plot(ansCod)




