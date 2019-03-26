library(senstrat)


### Name: mscores
### Title: Computes M-Scores for Two-Sample or Stratified Permutation
###   Inference.
### Aliases: mscores
### Keywords: htest robust

### ** Examples

data("homocyst")
attach(homocyst)
sc<-mscores(log2(homocysteine),z,st=stf)
par(mfrow=c(1,2))
boxplot(log2(homocysteine)~z,main="Data")
boxplot(sc~z,main="Mscores")
detach(homocyst)



