library(MAclinical)


### Name: svm_x
### Title: Classification based on support vector machines using microarray
###   data only
### Aliases: svm_x
### Keywords: htest

### ** Examples

# load MAclinical library
# library(MAclinical)

# Generating xlearn, zlearn, ylearn, xtest, ztest
xlearn<-matrix(rnorm(3000),30,100)
ylearn<-sample(0:1,30,replace=TRUE)
xtest<-matrix(rnorm(2000),20,100)

my.prediction1<-svm_x(Xlearn=xlearn,Ylearn=ylearn,Xtest=xtest)

ordered<-sample(100)
my.prediction2<-svm_x(Xlearn=xlearn,Ylearn=ylearn,Xtest=xtest,ordered=ordered,nbgene=20)





