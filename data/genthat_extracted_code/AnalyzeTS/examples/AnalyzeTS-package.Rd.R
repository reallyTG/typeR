library(AnalyzeTS)


### Name: AnalyzeTS-package
### Title: Analyze Fuzzy Time Series
### Aliases: AnalyzeTS-package AnalyzeTS

### ** Examples

library(AnalyzeTS)
data(enrollment)
#Sing model
fuzzy.ts1(lh,n=5,type="Singh",plot=TRUE)

#Abbasov Mamedova model
fuzzy.ts2(enrollment,n=5,w=5,C=0.01,forecast=5,plot=TRUE,type="Abbasov-Mamedova")

#NFTS model
fuzzy.ts2(enrollment,n=5,w=5,C=0.01,forecast=5,plot=TRUE,type="NFTS")



