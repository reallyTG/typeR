library(sensitivity2x2xk)


### Name: adaptmh
### Title: Adaptive Exact Test for Two 2x2xk Tables
### Aliases: adaptmh

### ** Examples

# The first example is from Satagopan, et al. (2001), Table 2.
# It is a case-control study of breast cancer and BRCA1+ mutations
# for women aged <40 and women aged >=40.
ageLT40<-matrix(c(18,51,11,673),2,2)
ageGE40<-matrix(c(39,652,21,2699),2,2)
rownames(ageLT40)<-rownames(ageGE40)<-c("BRCA1+","Negative")
colnames(ageLT40)<-colnames(ageGE40)<-c("Case","Control")
names(dimnames(ageLT40))<-c("Mutation","Breast Cancer")
names(dimnames(ageGE40))<-c("Mutation","Breast Cancer")
adaptmh(ageLT40,ageGE40,Gamma=10)

#The second example is from Fu et al (2012) as discussed
#in Rosenbaum (2015, Table 1). In effect, the test
#adapts between two possible definitions of a high
#life-style risk of large adenomas discovered by colonoscopy.

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
adaptmh(tab1,tab2,Gamma=1)

#An adaptive randomization test,
#giving double weight to the extreme table.

adaptmh(tab1,tab2,Gamma=1,double=TRUE)

#A sensitivity analysis at Gamma=5.
#Only the high risk table leads to rejection.

adaptmh(tab1,tab2,Gamma=5,double=TRUE)

#The third example is from Table II of
#Abbas, S. et al. (2008).  The table started as a 5x2
# crossclassification of doses of vitamin D
#in blood serum (25(OH)D in nM), and became
#two 2x2 tables, an outer table of extreme doses
#and an inner table of moderate doses.

tab1<-matrix(c(345,209,218,294),2,2)
tab2<-matrix(c(354,186,327,218),2,2)

colnames(tab2)<-colnames(tab1)<-c("cases","controls")
rownames(tab1)<-c("<30",">=70")
rownames(tab2)<-c("30-45","60-75")
names(dimnames(tab1))<-c("Vitamin D","Breast Cancer")
names(dimnames(tab2))<-c("Vitamin D","Breast Cancer")

#This performs the adaptive test with increments
#of .25 to limit computation
#in the example, but increments of 0.05
#would provide more detail.

adaptmh(tab1,tab2,Gamma=2, inc=0.25)




