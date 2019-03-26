library(SNPassoc)


### Name: GenomicControl
### Title: Population substructure
### Aliases: GenomicControl
### Keywords: utilities

### ** Examples


data(SNPs) 
datSNP<-setupSNP(SNPs,6:40,sep="")
res<-WGassociation(casco,datSNP,model=c("do","re","log-add"))

# Genomic Control 
resCorrected<-GenomicControl(res)
plot(resCorrected)




