library(AnalyzeTS)


### Name: fuzzy.ts2
### Title: Abbasov Mamedova model and FVD model
### Aliases: fuzzy.ts2

### ** Examples

#data(enrollment)
#layout(1:2)
#NF.mod<-fuzzy.ts2(enrollment,n=7,w=7,C=0.0001,forecast=11,trace=TRUE,plot=TRUE,type="NFTS")
#AM.mod<-fuzzy.ts2(enrollment,n=5,w=5,C=0.01,forecast=5,plot=TRUE,type="Abbasov-Mamedova")
#NF.mod
#AM.mod

#Finding the best C value by DOC function
#Abbasov-Mamedova model
#str.C1<-DOC(enrollment,n=7,w=7,D1=0,D2=0,CEF="MAPE",type="Abbasov-Mamedova")
#C1<-as.numeric(str.C1[1])
#fuzzy.ts2(enrollment,n=7,w=7,D1=0,D2=0,C=C1,forecast=5,type="Abbasov-Mamedova")

#NFTS model
#str.C2<-DOC(enrollment,n=7,w=7,D1=0,D2=0,CEF="MAPE",type="NFTS")
#C2<-as.numeric(str.C2[1])
#fuzzy.ts2(enrollment,n=7,w=7,D1=0,D2=0,C=C1,forecast=5,type="NFTS")




