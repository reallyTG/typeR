library(LDcorSV)


### Name: LD.Measures
### Title: LD Measures
### Aliases: LD.Measures

### ** Examples

data(data.test)
Geno<-data.test[[1]]
Geno.test<-Geno[,1:5]
V.WAIS<-data.test[[2]]
S.2POP<-data.test[[3]]
LD<-LD.Measures(Geno.test,V=V.WAIS,S=S.2POP,data ="G",supinfo=TRUE,na.presence=TRUE)
LD



