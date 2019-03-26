library(MCPAN)


### Name: estShannonf
### Title: Estimate the Shannon-Wiener index
### Aliases: estShannonf
### Keywords: htest

### ** Examples


data(HCD)
HCD

# Groupwise point estimates:

est<-estShannonf(X=HCD[,-1], f=HCD[,1])

est






