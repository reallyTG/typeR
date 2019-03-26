library(senstrat)


### Name: hodgeslehmann
### Title: Computes Hodges-Lehmann Aligned Ranks.
### Aliases: hodgeslehmann
### Keywords: htest robust

### ** Examples

data("homocyst")
attach(homocyst)
sc<-hodgeslehmann(log2(homocysteine),z,stf,align="hl")
summary(sc)
length(sc)
detach(homocyst)



