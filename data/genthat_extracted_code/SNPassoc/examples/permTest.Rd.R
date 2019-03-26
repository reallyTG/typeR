library(SNPassoc)


### Name: permTest
### Title: Permutation test analysis
### Aliases: permTest print.permTest plot.permTest
### Keywords: utilities

### ** Examples


data(SNPs)
datSNP<-setupSNP(SNPs,6:40,sep="")
ans<-scanWGassociation(casco~1,data=datSNP,model="co",nperm=1000)

# pPerm<-permTest(ans)
# print(pPerm)
# plot(pPerm)





