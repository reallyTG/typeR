library(rsem)


### Name: rsem.lavaan
### Title: Conduct robust SEM analysis using lavaan
### Aliases: rsem.lavaan

### ** Examples


 data(mardiamv25)
 names(mardiamv25)<-paste('V', 1:5, sep='')
 
 fa.model<-'f1 =~ V1 + V2
f2 =~ V4 + V5 
f1 ~ 1
f2 ~ 1
V1 ~0*1
V2 ~0*1
V4 ~0*1
V5 ~0*1'

 analysis<-rsem.lavaan(mardiamv25, fa.model, c(1,2,4,5))



