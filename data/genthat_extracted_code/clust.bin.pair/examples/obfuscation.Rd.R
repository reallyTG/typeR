library(clust.bin.pair)


### Name: obfuscation
### Title: Obfuscated C code misinterpretation data
### Aliases: obfuscation
### Keywords: datasets

### ** Examples

data(obfuscation)

oc <- paired.to.contingency(group = obfuscation[,c("subject", "atom")],
                            t1    = obfuscation$control,
                            t2    = obfuscation$treatment)

clust.bin.pair(oc$ak, oc$bk, oc$ck, oc$dk, method="durkalski")



