library(SNPassoc)


### Name: odds
### Title: Extract odds ratios, 95% CI and pvalues
### Aliases: odds
### Keywords: utilities

### ** Examples

 data(SNPs)
 datSNP<-setupSNP(SNPs,6:40,sep="")
 ans<-WGassociation(casco~1,data=datSNP,model="all")
 odds(ans)



