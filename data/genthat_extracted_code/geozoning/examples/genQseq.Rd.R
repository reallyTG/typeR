library(geozoning)


### Name: genQseq
### Title: genQseq
### Aliases: genQseq

### ** Examples

data(mapTest)
qProb=c(0.4,0.7)
ZK=initialZoning(qProb,mapTest)
K=ZK$resZ
print(K$lab)
genQseq(qProb,K,mapTest,1,2) # from label 3 to label 2



