library(sensitivity2x2xk)


### Name: mhWeighted
### Title: Weighted Exact Test for Two 2x2xk Tables
### Aliases: mhWeighted

### ** Examples

# The first example is from Satagopan, et al. (2001),
# Table 2. It is a case-control study of breast
# cancer and BRCA1+ mutations for women aged <40
# and women aged >=40.
ageLT40<-matrix(c(18,51,11,673),2,2)
ageGE40<-matrix(c(39,652,21,2699),2,2)
rownames(ageLT40)<-c("BRCA1+","Negative")
rownames(ageGE40)<-c("BRCA1+","Negative")
colnames(ageLT40)<-c("Case","Control")
colnames(ageGE40)<-c("Case","Control")
names(dimnames(ageLT40))<-c("Mutation","Breast Cancer")
names(dimnames(ageGE40))<-c("Mutation","Breast Cancer")
both<-array(c(18,51,11,673,39,652,21,2699),c(2,2,2))
dimnames(both)<-list(c("BRCA1+","Negative"),
      c("Case","Control"),c("LT40","GE40"))
names(dimnames(both))<-c("Mutation","Breast Cancer","Age")

#This is an unweighted Cochran-Mantel-Haenszel-Birch
#test for the 2x2x2 table:
mh(both,Gamma=7.2)

#This is the weighted test giving double
#weight to the first table.
mhWeighted(ageLT40,ageGE40,Gamma=7.2)
mhWeighted(ageLT40,ageGE40,Gamma=8.3)

#Compare: adaptmh(ageLT40,ageGE40,Gamma=10,double=TRUE)

#The second example is from Table II of
#Abbas, S. et al. (2008).  The table started as a 5x2
# crossclassification of doses of vitamin D
#in blood serum (25(OH)D in nM), and became
#two 2x2 tables, an outer table of extreme doses
#and an inner table of moderate doses.
#Compare with the discussion of the crosscut
#test in Rosenbaum (2015) and the corresponding example
#in the documentation for adaptmh.

tab1<-matrix(c(345,209,218,294),2,2)
tab2<-matrix(c(354,186,327,218),2,2)
colnames(tab2)<-c("cases","controls")
colnames(tab1)<-c("cases","controls")
rownames(tab1)<-c("<30",">=70")
rownames(tab2)<-c("30-45","60-75")
names(dimnames(tab1))<-c("Vitamin D","Breast Cancer")
names(dimnames(tab2))<-c("Vitamin D","Breast Cancer")

mhWeighted(tab1,tab2,Gamma=1.58)

# Compare with an unweighted test
mh(array(c(tab1,tab2),c(2,2,2)),Gamma=1.58)
mh(array(c(tab1,tab2),c(2,2,2)),Gamma=1.46)

# Compare: adaptmh(tab1,tab2,Gamma=2,inc=0.25,double=TRUE)

# Both examples are discussed in Rosenbaum and Small (2015).



