library(MAclinical)


### Name: plsrf_x_pv
### Title: Classification based on pre-validated PLS dimension reduction
###   and random forests using microarray data only
### Aliases: plsrf_x_pv
### Keywords: htest

### ** Examples

# load MAclinical library
# library(MAclinical)

# Generating xlearn, zlearn, ylearn, xtest, ztest
xlearn<-matrix(rnorm(3000),30,100)
ylearn<-sample(0:1,30,replace=TRUE)
xtest<-matrix(rnorm(2000),20,100)

my.prediction1<-plsrf_x_pv(Xlearn=xlearn,Ylearn=ylearn,Xtest=xtest)

ordered<-sample(100)
my.prediction2<-plsrf_x(Xlearn=xlearn,Ylearn=ylearn,Xtest=xtest,ordered=ordered,nbgene=20)
my.prediction3<-plsrf_x_pv(Xlearn=xlearn,Ylearn=ylearn,Xtest=xtest,fold=30)





