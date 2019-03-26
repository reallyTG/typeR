library(SNPassoc)


### Name: qqpval
### Title: Functions for inspecting population substructure
### Aliases: qqpval
### Keywords: utilities

### ** Examples

data(SNPs)
datSNP<-setupSNP(SNPs,6:40,sep="")
res<-WGassociation(casco,datSNP,model=c("do","re","log-add"))

# observed vs expected p values for recessive model
qqpval(recessive(res))




