library(TTR)


### Name: KST
### Title: Know Sure Thing
### Aliases: KST
### Keywords: ts

### ** Examples


data(ttrc)
kst <- KST(ttrc[,"Close"])

kst4MA <- KST(ttrc[,"Close"],
  maType=list(list(SMA),list(EMA),list(DEMA),list(WMA)))




