library(sensitivity2x2xk)


### Name: mh
### Title: Exact Test for One 2x2xk Table in Observational Studies
### Aliases: mh

### ** Examples

# The example is from Satagopan, et al. (2001), Table 2.
# It is a case-control study of breast cancer and
# BRCA1+ mutations for women aged <40 and women aged >=40.
ageLT40<-matrix(c(18,51,11,673),2,2)
ageGE40<-matrix(c(39,652,21,2699),2,2)
rownames(ageLT40)<-c("BRCA1+","Negative")
rownames(ageGE40)<-c("BRCA1+","Negative")
colnames(ageLT40)<-colnames(ageGE40)<-c("Case","Control")
names(dimnames(ageLT40))<-c("Mutation","Breast Cancer")
names(dimnames(ageGE40))<-c("Mutation","Breast Cancer")
both<-array(c(18,51,11,673,39,652,21,2699),c(2,2,2))
dimnames(both)<-list(c("BRCA1+","Negative"),
      c("Case","Control"),c("LT40","GE40"))
names(dimnames(both))<-c("Mutation","Breast Cancer","Age")

mh(ageLT40,Gamma=9.3)
mh(ageGE40,Gamma=9.3)
mh(both,Gamma=9.3)

#Compare with adaptmh(ageLT40,ageGE40,Gamma=10)



