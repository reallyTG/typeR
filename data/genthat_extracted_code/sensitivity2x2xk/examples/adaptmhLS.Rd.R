library(sensitivity2x2xk)


### Name: adaptmhLS
### Title: Large Sample Adaptive Test for Two 2x2xk Tables
### Aliases: adaptmhLS

### ** Examples

# The first example is from Satagopan, et al. (2001),
# Table 2.  It is a case-control study of
# breast cancer and BRCA1+ mutations
# for women aged <40 and women aged >=40.
ageLT40<-matrix(c(18,51,11,673),2,2)
ageGE40<-matrix(c(39,652,21,2699),2,2)
rownames(ageLT40)<-c("BRCA1+","Negative")
rownames(ageGE40)<-c("BRCA1+","Negative")
colnames(ageLT40)<-c("Case","Control")
colnames(ageGE40)<-c("Case","Control")
names(dimnames(ageLT40))<-c("Mutation","Breast Cancer")
names(dimnames(ageGE40))<-c("Mutation","Breast Cancer")
adaptmhLS(ageLT40,ageGE40,Gamma=9.6)

#This example is from Fu et al (2012) as discussed
#in Rosenbaum (2015, Table 1). In effect, the test
#adapts between two possible definitions of a high
#life-style risk of large adenomas
#discovered by colonoscopy.

tab1<-matrix(c(42,45,136,913),2,2)
tab2<-matrix(c(77,78,482,885),2,2)
colnames(tab1)<-c(">1cm","None")
colnames(tab2)<-c(">1cm","None")
rownames(tab1)<-c("5-6","0-1")
rownames(tab2)<-c("4","2")
names(dimnames(tab1))<-c("Risk Score","Adenoma Size")
names(dimnames(tab2))<-c("Risk Score","Adenoma Size")

#An adaptive randomization test,
#where both component tests reject.
adaptmhLS(tab1,tab2,Gamma=1)

#An adaptive randomization test,
#giving double weight to the extreme table.
adaptmhLS(tab1,tab2,Gamma=1,double=TRUE)

#A sensitivity analysis at Gamma=4.
#Only the high risk table leads to rejection.
adaptmhLS(tab1,tab2,Gamma=4,double=TRUE)




